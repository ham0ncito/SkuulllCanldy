-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-12-2023 a las 01:24:55
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `skull2canldydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album`
--

CREATE TABLE `album` (
  `id_album` varchar(500) NOT NULL,
  `title_album` varchar(255) DEFAULT NULL,
  `image_album` varchar(255) DEFAULT NULL,
  `release_date_album` date DEFAULT NULL,
  `number_of_songs_album` int(11) DEFAULT NULL,
  `id_artist` varchar(255) DEFAULT NULL,
  `status_album` varchar(5) DEFAULT NULL,
  `id_genre` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `album`
--

INSERT INTO `album` (`id_album`, `title_album`, `image_album`, `release_date_album`, `number_of_songs_album`, `id_artist`, `status_album`, `id_genre`) VALUES
('03f8a5510828d99a63c609c0b45cafccfade56f7d40db21e9629ae7e9bf80a8e', 'Paradise', 'https://31.media.tumblr.com/6ed32723211b08b33b4852f103e10dbe/tumblr_mxbduzheif1r861hjo1_1280.jpg', '2023-11-11', 9, '0bf18fd271f7a7d9f4c52373a642986722acedcd9e03ef383a765994c8e83910', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
('0a993b87597245e6f85d8e155e4e9f0e7f463b147a919f6021d169dd9859736b', 'The Fame Monster', 'https://th.bing.com/th/id/OIP.wNbeSQJeLeSNZhpeIno39AHaHa?rs=1&pid=ImgDetMain', '2024-02-02', 12, '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
('1138900a952dd563124910e6625bc56dceef34e0237d2b431e8667a8cbf73a30', 'Speak Now', 'https://th.bing.com/th/id/OIP.4alMO0aivpQLH04ylfBbBQHaHa?rs=1&pid=ImgDetMain', '2023-12-12', 17, 'c2ce09cb217d8d65cc7085546021ff3468401b68b634e963323f2bdfe030bc8e', 'ACT', '701d021d08c54579f23343581e45b65ffb1150b2c99f94352fdac4b7036dbbd5'),
('34a1fe41f550d7928d6577189ce6abbc03522df63cb26dd00c6453debc066491', 'Unapologetic', 'https://th.bing.com/th/id/OIP.v5w0NmXFcLRzHff142tangHaHb?rs=1&pid=ImgDetMain', '2024-05-05', 10, 'c2d4913d8ef080d76d32d2def25d6a58cff39216c2fe708393d09c27992e27e8', 'ACT', '7b90ccc95230f095dd56b57ea9cbdd4f64bd33f5fde6968201bd551a97ba1460'),
('3975302118d61c4c7f6016783d502e1d16cbfc7b926a878608d7ebd23a298011', 'One Of the Boys', 'https://th.bing.com/th/id/R.2eddaa4ec1a38866bff326db39b2cfe6?rik=v1m005rGwIY8Rw&pid=ImgRaw&r=0', '2023-10-10', 13, '2b37d69d7b5cb4c1e7b3cc04dc2f41936b15f6ad04e93393f1b7343e98941f64', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
('59036afa9cb6d33c3d2d0b3cc88324cce8bf8a8098c58e830707289f6f204618', 'Kill This Love', 'https://th.bing.com/th/id/R.9546de89f64f25b5558c0c623536c6c7?rik=%2b2uJEXtI8enxNg&pid=ImgRaw&r=0', '2023-05-05', 8, '4a51977706f0a2d0473619ecdbc820a2f42739f87b46a8478f42389da553aebd', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
('5e5c22f9ccac863ad0388e43086b6c397ae960acc854973e2fd85b9e6a78d8b2', 'Thank u next', 'https://i.imgur.com/CQriKOF.jpg', '2019-01-01', 18, '6d93c4647d0738766d08682dec0c1ced423e41e21ccc83d59078a8c9f21ce8cd', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
('63598ec553a3d1cb3f340c505b58293fd48941a0940eba34df607c712ccdbe85', 'Harry Styles', 'https://m.media-amazon.com/images/I/61ON1kLVKOL._AC_SX569_.jpg', '2023-09-09', 11, '02978be3af7568a8491f44817a16cc8a716848284a1f6d2167473513f132f7a2', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
('6bcdc092dda4569f9eb9209eda3fb5876d42cdb3d5aa8cde792d6f5a4679d39c', 'Blue Neighbourhood', 'https://th.bing.com/th/id/OIP.B8VpZ27npErYbv-_ZLtdgwHaHa?w=600&h=600&rs=1&pid=ImgDetMain', '2013-02-02', 18, 'e0b9f1c88709d143c8c1dcefac53e75cd810cc54dbc35fe2bb8b561b7fab72ce', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
('6e9dac7b19d06868b4a47151812491f7c28b6fe3f5670c25bfa75a35cc5d1af6', '21', 'https://th.bing.com/th/id/R.4cf681fae9fc85f12650805a1ec86551?rik=tG3NFIwDk7y%2fbw&pid=ImgRaw&r=0', '2012-01-01', 15, '10c2d630409d5a4b8132f21478f40a030b8aefb29ab1a541da6d884a0286a6dc', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
('7ac842f1c0cd5c836106f27056fbe76f9ad756943c6099aee0fed7a43196b59c', 'Love Yourself', 'https://th.bing.com/th/id/OIP.iZQmjlPIbOFaENe-z6b7EgHaHb?rs=1&pid=ImgDetMain', '2023-06-06', 10, '0779a9cf03c24adf40c8e20aa592def290119dd939b0ac5b3401e350a75b78c4', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
('8ee907561768c820adb37eadb408ead95c5c61d8aff1c3fa31eb7f7222d384d5', 'Ultraviolence', 'https://th.bing.com/th/id/R.24185b38a9e4c9f1ece22975ded2987f?rik=tRaaEbZw3PHdlQ&pid=ImgRaw&r=0', '2024-04-04', 11, '0bf18fd271f7a7d9f4c52373a642986722acedcd9e03ef383a765994c8e83910', 'ACT', 'f302f0ea1db5df02bef4e6520435b493640eff8cf840ac709d6b5e5f746b3f76'),
('ab58e63f1937f2fcd92977d3fb7b8a9bbf203e5a86d66d09347177a78e2052fc', 'Honeymoon', 'https://th.bing.com/th/id/R.d3ae00889a3746c4cfde91183acb5c1c?rik=MLvyc18AzRn3ZQ&pid=ImgRaw&r=0', '2023-04-04', 12, '0bf18fd271f7a7d9f4c52373a642986722acedcd9e03ef383a765994c8e83910', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
('e042633d18d833a3e62887ebd816c3d4d29a7f4e4fbd2fa0d53fa2d4d71e6ca5', 'Lust For Life', 'https://th.bing.com/th/id/R.2f12f38c8e53357e86243cd3d26cf999?rik=0PxLDVEswkRZwg&pid=ImgRaw&r=0', '2023-07-07', 14, '0bf18fd271f7a7d9f4c52373a642986722acedcd9e03ef383a765994c8e83910', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
('e4d562e31895e6a04b02b758fc649b2482a7dbf60ea2b02858f0490b970171a1', 'Mind Of Mine', 'https://th.bing.com/th/id/R.fd3053cf930005782e5047e549407c26?rik=K6p9pDkpeRAm%2bA&pid=ImgRaw&r=0', '2023-08-08', 16, '6567207703cca3c6798f5d5f777307ac21cc708cf322d618925b2bccace800ea', 'ACT', '7b90ccc95230f095dd56b57ea9cbdd4f64bd33f5fde6968201bd551a97ba1460'),
('f4fa1319534451a4a9f45a80992e20ea84c3e5028ed8a7a961214d368c3cd245', 'Born To Die', 'https://th.bing.com/th/id/R.182b2f15445c91c521b063bceeb75dae?rik=p4s53jfOOWN%2f4w&pid=ImgRaw&r=0', '2023-03-03', 15, '0bf18fd271f7a7d9f4c52373a642986722acedcd9e03ef383a765994c8e83910', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
('fa47559e514373247726f855443c4a0d6057421fb37a167dc8cd42da006c88b9', 'The Thrill of it all', 'https://th.bing.com/th/id/R.541b4755cc7386f0c470461328c09dc7?rik=GmfiUY3RBs80Fg&pid=ImgRaw&r=0', '2024-03-03', 14, '942ed3a371fa9c714abb580207ad665a7a9314a6475abcceed46c620f1fa2284', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artist`
--

CREATE TABLE `artist` (
  `id_artist` varchar(500) NOT NULL,
  `name_artist` varchar(200) DEFAULT NULL,
  `image_artist` varchar(200) DEFAULT NULL,
  `date_of_birth_artist` date DEFAULT NULL,
  `country_artist` varchar(200) DEFAULT NULL,
  `status_artist` varchar(5) DEFAULT NULL,
  `artist_bio` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `artist`
--

INSERT INTO `artist` (`id_artist`, `name_artist`, `image_artist`, `date_of_birth_artist`, `country_artist`, `status_artist`, `artist_bio`) VALUES
('02978be3af7568a8491f44817a16cc8a716848284a1f6d2167473513f132f7a2', 'Harry Styles', 'https://th.bing.com/th/id/R.725ed70ae4201ea010f302fb9939f62a?rik=SUG9QRWtH5CoBg&pid=ImgRaw&r=0', '1994-02-01', 'United Kingdom', 'ACT', 'Harry Edward Styles is a versatile British musician and actor known for his eclectic style and musical creativity.'),
('0779a9cf03c24adf40c8e20aa592def290119dd939b0ac5b3401e350a75b78c4', 'BTS', 'https://th.bing.com/th/id/R.76068f69a98b2083b2ce0d875ab6a0d4?rik=UmJhZ4R7RANpHQ&pid=ImgRaw&r=0', '1993-12-20', 'South Korea', 'ACT', 'BTS, also known as the Bangtan Boys, is a global phenomenon and South Korean boy band known for their exceptional music and powerful stage presence.'),
('0bf18fd271f7a7d9f4c52373a642986722acedcd9e03ef383a765994c8e83910', 'Lana Del Rey', 'https://th.bing.com/th/id/R.70fe689c73763f389365a6be43d138ae?rik=NaqZObGzGxL7%2bw&pid=ImgRaw&r=0', '1985-06-21', 'United States', 'ACT', 'Elizabeth Woolridge Grant, known professionally as Lana Del Rey, is an American singer-songwriter.'),
('10c2d630409d5a4b8132f21478f40a030b8aefb29ab1a541da6d884a0286a6dc', 'Adele', 'https://th.bing.com/th/id/R.a5a86f8c0abcc037d15753ef32e25d03?rik=F3Lz6E%2fpKNMFEQ&pid=ImgRaw&r=0', '1988-05-05', 'United Kingdom', 'ACT', 'Adele Laurie Blue Adkins is an English singer-songwriter known for her powerful voice and emotional ballads.'),
('2b37d69d7b5cb4c1e7b3cc04dc2f41936b15f6ad04e93393f1b7343e98941f64', 'Katy Perry', 'https://th.bing.com/th/id/R.05c1c72af574110b876c6b580dc4417c?rik=RdlqzeF2JqzXZA&pid=ImgRaw&r=0', '1984-10-25', 'United States', 'ACT', 'Katy Perry, born Katheryn Elizabeth Hudson, is an American singer-songwriter known for her chart-topping hits and vibrant personality.'),
('4a51977706f0a2d0473619ecdbc820a2f42739f87b46a8478f42389da553aebd', 'Blackpink', 'https://th.bing.com/th/id/R.345bc678ae372f7f463f60bc2f412702?rik=Wtgs36tQDAkSEg&pid=ImgRaw&r=0', '1996-08-08', 'South Korea', 'ACT', 'Blackpink is a popular South Korean girl group known for their energetic performances and catchy songs.'),
('6567207703cca3c6798f5d5f777307ac21cc708cf322d618925b2bccace800ea', 'ZAYN', 'https://th.bing.com/th/id/R.74ef52def98f69bc4930043c72f18b9b?rik=95XIKQf7Dz7lqA&pid=ImgRaw&r=0', '1993-01-12', 'United Kingdom', 'ACT', 'ZAYN Malik is a British singer-songwriter known for his unique voice and successful solo career.'),
('6d93c4647d0738766d08682dec0c1ced423e41e21ccc83d59078a8c9f21ce8cd', 'Ariana Grande', 'https://th.bing.com/th/id/R.2aa210fdc0031a8fda1bfe99e4c117e1?rik=ZkcKWFW4B%2fADvA&pid=ImgRaw&r=0', '1993-06-26', 'United States', 'ACT', 'Ariana Grande-Butera is an American singer, songwriter, and actress.'),
('89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'Lady Gaga', 'https://th.bing.com/th/id/R.b5599c473e77532c6896a112d4a09940?rik=Mer878SPKd1%2fYg&pid=ImgRaw&r=0', '1986-03-28', 'United States', 'ACT', 'Stefani Joanne Angelina Germanotta, known professionally as Lady Gaga, is an American singer, songwriter, and actress.'),
('942ed3a371fa9c714abb580207ad665a7a9314a6475abcceed46c620f1fa2284', 'Sam Smith', 'https://th.bing.com/th/id/R.096920ff99e97dc23fd441f0ffb5b61e?rik=HTNFw21lkhRqrQ&pid=ImgRaw&r=0', '1992-05-19', 'United Kingdom', 'ACT', 'Samuel Frederick Smith is an English singer and songwriter.'),
('c2ce09cb217d8d65cc7085546021ff3468401b68b634e963323f2bdfe030bc8e', 'Taylor Swift', 'https://th.bing.com/th/id/OIF.vBjS0n0svYP101Hi1yjZ5Q?rs=1&pid=ImgDetMain', '1989-12-13', 'United States', 'ACT', 'Taylor Swift is a Grammy Award-winning American singer-songwriter known for her storytelling through music.'),
('c2d4913d8ef080d76d32d2def25d6a58cff39216c2fe708393d09c27992e27e8', 'Rihanna', 'https://cache.magazine-avantages.fr/data/fichiers/4z/mnr1-rihanna1.jpg', '1988-02-20', 'Barbados', 'ACT', 'Rihanna is a global superstar and Barbadian singer known for her diverse musical style and fashion influence.'),
('e0b9f1c88709d143c8c1dcefac53e75cd810cc54dbc35fe2bb8b561b7fab72ce', 'Troye Sivan', 'https://th.bing.com/th/id/OIP.heuuAY1unJF-8-j5NmpKkgHaJm?rs=1&pid=ImgDetMain', '1995-06-05', 'Australia', 'ACT', 'Troye Sivan Mellet is an Australian singer, songwriter, and actor known for his honest and introspective music.'),
('e5aaccbe1ebafbca5e9fd2794431862f', 'Madonna', 'https://2.bp.blogspot.com/-R_G8feMd3Go/TbUb8IkIJdI/AAAAAAAAA9Y/dwv3FZIsGt0/s1600/madonna.jpg', '1958-08-16', 'United States', 'ACT', 'Madonna is a pop music singer and actress who went solo in 1981 and became a sensation in the then male-dominated 1980s music scene. She has achieved 21 Top 10 hits in the United States and sold more '),
('hbu23wsdbu23823nbsndi2324588231wss2343', 'Bad Bunny', 'https://www.the-sun.com/wp-content/uploads/sites/6/2021/02/comp-ac-bad-bunny-seo.jpg', '1992-05-22', 'Puerto Rico', 'ACT', 'An artist that has changed music ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `bitacoracod` int(11) NOT NULL,
  `bitacorafch` datetime DEFAULT NULL,
  `bitprograma` varchar(255) DEFAULT NULL,
  `bitdescripcion` varchar(255) DEFAULT NULL,
  `bitobservacion` mediumtext DEFAULT NULL,
  `bitTipo` char(3) DEFAULT NULL,
  `bitusuario` bigint(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`bitacoracod`, `bitacorafch`, `bitprograma`, `bitdescripcion`, `bitobservacion`, `bitTipo`, `bitusuario`) VALUES
(10, '2023-11-26 10:30:00', 'Programa A', 'Descripción detallada del evento A', 'Observación del evento A', 'T-A', 123456789),
(11, '2023-11-27 09:45:00', 'Programa B', 'Descripción detallada del evento B', 'Observación del evento B', 'T-B', 987654321),
(12, '2023-11-28 14:20:00', 'Programa C', 'Descripción detallada del evento C', 'Observación del evento C', 'T-C', 456789123),
(13, '2023-11-29 11:00:00', 'Programa D', 'Descripción detallada del evento D', 'Observación del evento D', 'T-D', 789123456),
(14, '2023-11-30 15:45:00', 'Programa E', 'Descripción detallada del evento E', 'Observación del evento E', 'T-E', 321654987),
(15, '2023-12-01 08:00:00', 'Programa F', 'Descripción detallada del evento F', 'Observación del evento F', 'T-F', 654987321),
(16, '2023-12-02 13:10:00', 'Programa G', 'Descripción detallada del evento G', 'Observación del evento G', 'T-G', 987321654),
(17, '2023-12-03 10:55:00', 'Programa H', 'Descripción detallada del evento H', 'Observación del evento H', 'T-H', 147258369),
(18, '2023-12-04 16:30:00', 'Programa I', 'Descripción detallada del evento I', 'Observación del evento I', 'T-I', 258369147),
(19, '2023-12-05 09:20:00', 'Programa J', 'Descripción detallada del evento J', 'Observación del evento J', 'T-J', 369147258);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carretilla`
--

CREATE TABLE `carretilla` (
  `usercod` varchar(450) NOT NULL,
  `productId` bigint(11) NOT NULL,
  `crrctd` int(5) NOT NULL,
  `crrprc` decimal(12,2) NOT NULL,
  `crrfching` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `carretilla`
--

INSERT INTO `carretilla` (`usercod`, `productId`, `crrctd`, `crrprc`, `crrfching`) VALUES
('31ce7c8c735a4a519653c2d239bd8a834b5b577056f8c6c9f6a859eb79e7e649', 2, 100, 25.50, '2023-11-26 09:00:00'),
('40dd9080b8bbfa27d84fe3feb77be06dd599ac246c6f0411e1f9094ab8005b0e', 11, 50, 15.75, '2023-11-27 10:30:00'),
('626827faf35878c1792eef8f5e976f7da6aea68a3c892b32223c2a0c0f90fadf', 222, 300, 50.00, '2023-11-28 11:45:00'),
('6353d3a7c31d7173e20623d58ccdedf8e89fc20cb4abf49feac7a83fdb106bb4', 2, 1, 19.99, '2023-12-04 23:59:39'),
('6353d3a7c31d7173e20623d58ccdedf8e89fc20cb4abf49feac7a83fdb106bb4', 11, 1, 59.99, '2023-12-04 23:59:35'),
('6353d3a7c31d7173e20623d58ccdedf8e89fc20cb4abf49feac7a83fdb106bb4', 222, 1, 29.99, '2023-12-04 23:59:39'),
('6353d3a7c31d7173e20623d58ccdedf8e89fc20cb4abf49feac7a83fdb106bb4', 82392, 1, 99.99, '2023-12-04 23:59:38'),
('6353d3a7c31d7173e20623d58ccdedf8e89fc20cb4abf49feac7a83fdb106bb4', 2324423, 1, 69.99, '2023-12-05 00:00:50'),
('f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764', 2, 1, 19.99, '2023-12-07 02:20:03'),
('f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764', 11, 1, 59.99, '2023-12-07 02:21:00'),
('f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764', 222, 1, 29.99, '2023-12-07 02:20:03'),
('f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764', 6454645, 1, 74.99, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carretillaanon`
--

CREATE TABLE `carretillaanon` (
  `anoncod` varchar(128) NOT NULL,
  `productId` bigint(11) NOT NULL,
  `crrctd` int(5) NOT NULL,
  `crrprc` decimal(12,2) NOT NULL,
  `crrfching` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorites`
--

CREATE TABLE `favorites` (
  `id_favorite` varchar(500) NOT NULL,
  `usercod` varchar(500) DEFAULT NULL,
  `id_reference` varchar(500) DEFAULT NULL,
  `type_favorite` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones`
--

CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(45) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `funciones`
--

INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
('album_DEL', 'Eliminar album', 'ACT', 'FNC'),
('album_DSP', 'Detalle de album', 'ACT', 'FNC'),
('album_INS', 'Agregar album', 'ACT', 'FNC'),
('album_UPD', 'Editar album', 'ACT', 'FNC'),
('artist_DEL', 'Eliminar artist', 'ACT', 'FNC'),
('artist_DSP', 'Detalle de artist', 'ACT', 'FNC'),
('artist_INS', 'Agregar artist', 'ACT', 'FNC'),
('artist_UPD', 'Editar artist', 'ACT', 'FNC'),
('bitacora_DEL', 'Eliminar bitacora', 'ACT', 'FNC'),
('bitacora_DSP', 'Detalle de bitacora', 'ACT', 'FNC'),
('bitacora_INS', 'Agregar bitacora', 'ACT', 'FNC'),
('bitacora_UPD', 'Editar bitacora', 'ACT', 'FNC'),
('carretillaanon_DEL', 'Eliminar carretillaanon', 'ACT', 'FNC'),
('carretillaanon_DSP', 'Detalle de carretillaanon', 'ACT', 'FNC'),
('carretillaanon_INS', 'Agregar carretillaanon', 'ACT', 'FNC'),
('carretillaanon_UPD', 'Editar carretillaanon', 'ACT', 'FNC'),
('carretilla_DEL', 'Eliminar carretilla', 'ACT', 'FNC'),
('carretilla_DSP', 'Detalle de carretilla', 'ACT', 'FNC'),
('carretilla_INS', 'Agregar carretilla', 'ACT', 'FNC'),
('carretilla_UPD', 'Editar carretilla', 'ACT', 'FNC'),
('Controllers\\Admin', 'Dashboard para Administradores', 'ACT', 'CTR'),
('Controllers\\Admin\\Dashboard', 'Dashboard', 'ACT', 'MNU'),
('Controllers\\Admin\\Dashboard\\', 'Dashboard para Administradores', 'ACT', 'CTR'),
('Controllers\\Albums\\Album', 'Lista de Album', 'ACT', 'CTR'),
('Controllers\\Albums\\Albums', 'Formulario de Album', 'ACT', 'CTR'),
('Controllers\\Artists\\Artist', 'Lista de Artist', 'ACT', 'CTR'),
('Controllers\\Artists\\Artists', 'Formulario de Artist', 'ACT', 'CTR'),
('Controllers\\Bitacoras\\Bitacora', 'Lista de Bitacora', 'ACT', 'CTR'),
('Controllers\\Bitacoras\\Bitacoras', 'Formulario de Bitacora', 'ACT', 'CTR'),
('Controllers\\Carretillaanons\\Carretillaanon', 'Lista de Carretillaanon', 'ACT', 'CTR'),
('Controllers\\Carretillaanons\\Carretillaanons', 'Formulario de Carretillaanon', 'ACT', 'CTR'),
('Controllers\\Carretillas\\Carretilla', 'Lista de Carretilla', 'ACT', 'CTR'),
('Controllers\\Carretillas\\Carretillas', 'Formulario de Carretilla', 'ACT', 'CTR'),
('Controllers\\Escupitajo\\GenerarCrud', 'Escupitajo', 'ACT', 'MNU'),
('Controllers\\Favoritess\\Favorites', 'Lista de Favorites', 'ACT', 'CTR'),
('Controllers\\Favoritess\\Favoritess', 'Formulario de Favorites', 'ACT', 'CTR'),
('Controllers\\Funcionesroless\\Funcionesroles', 'Lista de Funcionesroles', 'ACT', 'CTR'),
('Controllers\\Funcionesroless\\Funcionesroless', 'Formulario de Funcionesroles', 'ACT', 'CTR'),
('Controllers\\Funcioness\\Funciones', 'Lista de Funciones', 'ACT', 'CTR'),
('Controllers\\Funcioness\\Funcioness', 'Formulario de Funciones', 'ACT', 'CTR'),
('Controllers\\Genres\\Genre', 'Lista de Genre', 'ACT', 'CTR'),
('Controllers\\Genres\\Genres', 'Formulario de Genre', 'ACT', 'CTR'),
('Controllers\\Highligthsplaylists\\Highligthsplaylist', 'Lista de Highligthsplaylist', 'ACT', 'CTR'),
('Controllers\\Highligthsplaylists\\Highligthsplaylists', 'Formulario de Highligthsplaylist', 'ACT', 'CTR'),
('Controllers\\Highligthss\\Highligths', 'Lista de Highligths', 'ACT', 'CTR'),
('Controllers\\Highligthss\\Highligthss', 'Formulario de Highligths', 'ACT', 'CTR'),
('Controllers\\Home\\Home', 'Formulario de Home', 'ACT', 'CTR'),
('Controllers\\Lognonusers\\Lognonuser', 'Lista de Lognonuser', 'ACT', 'CTR'),
('Controllers\\Lognonusers\\Lognonusers', 'Formulario de Lognonuser', 'ACT', 'CTR'),
('Controllers\\Logs\\Log', 'Lista de Log', 'ACT', 'CTR'),
('Controllers\\Logs\\Logs', 'Formulario de Log', 'ACT', 'CTR'),
('Controllers\\Logusers\\Loguser', 'Lista de Loguser', 'ACT', 'CTR'),
('Controllers\\Logusers\\Logusers', 'Formulario de Loguser', 'ACT', 'CTR'),
('Controllers\\Offersubscriptions\\Offersubscription', 'Lista de Offersubscription', 'ACT', 'CTR'),
('Controllers\\Offersubscriptions\\Offersubscriptions', 'Formulario de Offersubscription', 'ACT', 'CTR'),
('Controllers\\Offers\\Offer', 'Lista de Offer', 'ACT', 'CTR'),
('Controllers\\Offers\\Offers', 'Formulario de Offer', 'ACT', 'CTR'),
('Controllers\\Playlistsongss\\Playlistsongs', 'Lista de Playlistsongs', 'ACT', 'CTR'),
('Controllers\\Playlistsongss\\Playlistsongss', 'Formulario de Playlistsongs', 'ACT', 'CTR'),
('Controllers\\Playlists\\Playlist', 'Lista de Playlist', 'ACT', 'CTR'),
('Controllers\\Playlists\\Playlists', 'Formulario de Playlist', 'ACT', 'CTR'),
('Controllers\\Popularitys\\Popularity', 'Lista de Popularity', 'ACT', 'CTR'),
('Controllers\\Popularitys\\Popularitys', 'Formulario de Popularity', 'ACT', 'CTR'),
('Controllers\\Productss\\Products', 'Lista de Products', 'ACT', 'CTR'),
('Controllers\\Productss\\Productss', 'Formulario de Products', 'ACT', 'CTR'),
('Controllers\\Purchasedetails\\Purchasedetail', 'Lista de Purchasedetail', 'ACT', 'CTR'),
('Controllers\\Purchasedetails\\Purchasedetails', 'Formulario de Purchasedetail', 'ACT', 'CTR'),
('Controllers\\Purchases\\Purchase', 'Lista de Purchase', 'ACT', 'CTR'),
('Controllers\\Purchases\\Purchases', 'Formulario de Purchase', 'ACT', 'CTR'),
('Controllers\\Roless\\Roles', 'Lista de Roles', 'ACT', 'CTR'),
('Controllers\\Roless\\Roless', 'Formulario de Roles', 'ACT', 'CTR'),
('Controllers\\Rolesusuarioss\\Rolesusuarios', 'Lista de Rolesusuarios', 'ACT', 'CTR'),
('Controllers\\Rolesusuarioss\\Rolesusuarioss', 'Formulario de Rolesusuarios', 'ACT', 'CTR'),
('Controllers\\Search\\Search', 'Formulario de Search', 'ACT', 'CTR'),
('Controllers\\Songauthorss\\Songauthors', 'Lista de Songauthors', 'ACT', 'CTR'),
('Controllers\\Songauthorss\\Songauthorss', 'Formulario de Songauthors', 'ACT', 'CTR'),
('Controllers\\Songs\\Song', 'Lista de Song', 'ACT', 'CTR'),
('Controllers\\Songs\\Songs', 'Formulario de Song', 'ACT', 'CTR'),
('Controllers\\Store\\ShoppingCart', 'Shopping', 'ACT', 'MNU'),
('Controllers\\Store\\Store', 'Store', 'ACT', 'MNU'),
('Controllers\\Subscriptions\\Subscription', 'Lista de Subscription', 'ACT', 'CTR'),
('Controllers\\Subscriptions\\Subscriptions', 'Formulario de Subscription', 'ACT', 'CTR'),
('Controllers\\Subscriptionusers\\Subscriptionuser', 'Lista de Subscriptionuser', 'ACT', 'CTR'),
('Controllers\\Subscriptionusers\\Subscriptionusers', 'Formulario de Subscriptionuser', 'ACT', 'CTR'),
('Controllers\\Usuarios\\Usuario', 'Lista de Usuario', 'ACT', 'CTR'),
('Controllers\\Usuarios\\Usuarios', 'Formulario de Usuario', 'ACT', 'CTR'),
('Controllers\\Videos\\Video', 'Lista de Video', 'ACT', 'CTR'),
('Controllers\\Videos\\Videos', 'Formulario de Video', 'ACT', 'CTR'),
('favorites_DEL', 'Eliminar favorites', 'ACT', 'FNC'),
('favorites_DSP', 'Detalle de favorites', 'ACT', 'FNC'),
('favorites_INS', 'Agregar favorites', 'ACT', 'FNC'),
('favorites_UPD', 'Editar favorites', 'ACT', 'FNC'),
('funciones_DEL', 'Eliminar funciones', 'ACT', 'FNC'),
('funciones_DSP', 'Detalle de funciones', 'ACT', 'FNC'),
('funciones_INS', 'Agregar funciones', 'ACT', 'FNC'),
('funciones_roles_DEL', 'Eliminar funciones_roles', 'ACT', 'FNC'),
('funciones_roles_DSP', 'Detalle de funciones_roles', 'ACT', 'FNC'),
('funciones_roles_INS', 'Agregar funciones_roles', 'ACT', 'FNC'),
('funciones_roles_UPD', 'Editar funciones_roles', 'ACT', 'FNC'),
('funciones_UPD', 'Editar funciones', 'ACT', 'FNC'),
('genre_DEL', 'Eliminar genre', 'ACT', 'FNC'),
('genre_DSP', 'Detalle de genre', 'ACT', 'FNC'),
('genre_INS', 'Agregar genre', 'ACT', 'FNC'),
('genre_UPD', 'Editar genre', 'ACT', 'FNC'),
('highligthsplaylist_DEL', 'Eliminar highligthsplaylist', 'ACT', 'FNC'),
('highligthsplaylist_DSP', 'Detalle de highligthsplaylist', 'ACT', 'FNC'),
('highligthsplaylist_INS', 'Agregar highligthsplaylist', 'ACT', 'FNC'),
('highligthsplaylist_UPD', 'Editar highligthsplaylist', 'ACT', 'FNC'),
('highligths_DEL', 'Eliminar highligths', 'ACT', 'FNC'),
('highligths_DSP', 'Detalle de highligths', 'ACT', 'FNC'),
('highligths_INS', 'Agregar highligths', 'ACT', 'FNC'),
('highligths_UPD', 'Editar highligths', 'ACT', 'FNC'),
('lognonuser_DEL', 'Eliminar lognonuser', 'ACT', 'FNC'),
('lognonuser_DSP', 'Detalle de lognonuser', 'ACT', 'FNC'),
('lognonuser_INS', 'Agregar lognonuser', 'ACT', 'FNC'),
('lognonuser_UPD', 'Editar lognonuser', 'ACT', 'FNC'),
('loguser_DEL', 'Eliminar loguser', 'ACT', 'FNC'),
('loguser_DSP', 'Detalle de loguser', 'ACT', 'FNC'),
('loguser_INS', 'Agregar loguser', 'ACT', 'FNC'),
('loguser_UPD', 'Editar loguser', 'ACT', 'FNC'),
('log_DEL', 'Eliminar log', 'ACT', 'FNC'),
('log_DSP', 'Detalle de log', 'ACT', 'FNC'),
('log_INS', 'Agregar log', 'ACT', 'FNC'),
('log_UPD', 'Editar log', 'ACT', 'FNC'),
('Menu_Album', 'Menu_Album', 'ACT', 'MNU'),
('Menu_Artist', 'Menu_Artist', 'ACT', 'MNU'),
('Menu_Bitacora', 'Menu_Bitacora', 'ACT', 'MNU'),
('Menu_Carretilla', 'Menu_Carretilla', 'ACT', 'MNU'),
('Menu_Carretillaanon', 'Menu_Carretillaanon', 'ACT', 'MNU'),
('Menu_Favorites', 'Menu_Favorites', 'ACT', 'MNU'),
('Menu_Funciones', 'Menu_Funciones', 'ACT', 'MNU'),
('Menu_Funcionesroles', 'Menu_Funcionesroles', 'ACT', 'MNU'),
('Menu_Genre', 'Menu_Genre', 'ACT', 'MNU'),
('Menu_Highligths', 'Menu_Highligths', 'ACT', 'MNU'),
('Menu_Highligthsplaylist', 'Menu_Highligthsplaylist', 'ACT', 'MNU'),
('Menu_Home', 'Menu_Home', 'ACT', 'MNU'),
('Menu_Log', 'Menu_Log', 'ACT', 'MNU'),
('Menu_Lognonuser', 'Menu_Lognonuser', 'ACT', 'MNU'),
('Menu_Loguser', 'Menu_Loguser', 'ACT', 'MNU'),
('Menu_Offer', 'Menu_Offer', 'ACT', 'MNU'),
('Menu_Offersubscription', 'Menu_Offersubscription', 'ACT', 'MNU'),
('Menu_PaymentCheckout', 'Menu_PaymentCheckout', 'ACT', 'MNU'),
('Menu_Playlist', 'Menu_Playlist', 'ACT', 'MNU'),
('Menu_Playlistsongs', 'Menu_Playlistsongs', 'ACT', 'MNU'),
('Menu_Popularity', 'Menu_Popularity', 'ACT', 'MNU'),
('Menu_Products', 'Menu_Products', 'ACT', 'MNU'),
('Menu_Purchase', 'Menu_Purchase', 'ACT', 'MNU'),
('Menu_Purchasedetail', 'Menu_Purchasedetail', 'ACT', 'MNU'),
('Menu_Roles', 'Menu_Roles', 'ACT', 'MNU'),
('Menu_Rolesusuarios', 'Menu_Rolesusuarios', 'ACT', 'MNU'),
('Menu_Search', 'Menu_Search', 'ACT', 'MNU'),
('Menu_Song', 'Menu_Song', 'ACT', 'MNU'),
('Menu_Songauthors', 'Menu_Songauthors', 'ACT', 'MNU'),
('Menu_Subscription', 'Menu_Subscription', 'ACT', 'MNU'),
('Menu_Subscriptionuser', 'Menu_Subscriptionuser', 'ACT', 'MNU'),
('Menu_Usuario', 'Menu_Usuario', 'ACT', 'MNU'),
('Menu_Video', 'Menu_Video', 'ACT', 'MNU'),
('offersubscription_DEL', 'Eliminar offersubscription', 'ACT', 'FNC'),
('offersubscription_DSP', 'Detalle de offersubscription', 'ACT', 'FNC'),
('offersubscription_INS', 'Agregar offersubscription', 'ACT', 'FNC'),
('offersubscription_UPD', 'Editar offersubscription', 'ACT', 'FNC'),
('offer_DEL', 'Eliminar offer', 'ACT', 'FNC'),
('offer_DSP', 'Detalle de offer', 'ACT', 'FNC'),
('offer_INS', 'Agregar offer', 'ACT', 'FNC'),
('offer_UPD', 'Editar offer', 'ACT', 'FNC'),
('playlistsongs_DEL', 'Eliminar playlistsongs', 'ACT', 'FNC'),
('playlistsongs_DSP', 'Detalle de playlistsongs', 'ACT', 'FNC'),
('playlistsongs_INS', 'Agregar playlistsongs', 'ACT', 'FNC'),
('playlistsongs_UPD', 'Editar playlistsongs', 'ACT', 'FNC'),
('playlist_DEL', 'Eliminar playlist', 'ACT', 'FNC'),
('playlist_DSP', 'Detalle de playlist', 'ACT', 'FNC'),
('playlist_INS', 'Agregar playlist', 'ACT', 'FNC'),
('playlist_UPD', 'Editar playlist', 'ACT', 'FNC'),
('popularity_DEL', 'Eliminar popularity', 'ACT', 'FNC'),
('popularity_DSP', 'Detalle de popularity', 'ACT', 'FNC'),
('popularity_INS', 'Agregar popularity', 'ACT', 'FNC'),
('popularity_UPD', 'Editar popularity', 'ACT', 'FNC'),
('products_DEL', 'Eliminar products', 'ACT', 'FNC'),
('products_DSP', 'Detalle de products', 'ACT', 'FNC'),
('products_INS', 'Agregar products', 'ACT', 'FNC'),
('products_UPD', 'Editar products', 'ACT', 'FNC'),
('purchasedetail_DEL', 'Eliminar purchasedetail', 'ACT', 'FNC'),
('purchasedetail_DSP', 'Detalle de purchasedetail', 'ACT', 'FNC'),
('purchasedetail_INS', 'Agregar purchasedetail', 'ACT', 'FNC'),
('purchasedetail_UPD', 'Editar purchasedetail', 'ACT', 'FNC'),
('purchase_DEL', 'Eliminar purchase', 'ACT', 'FNC'),
('purchase_DSP', 'Detalle de purchase', 'ACT', 'FNC'),
('purchase_INS', 'Agregar purchase', 'ACT', 'FNC'),
('purchase_UPD', 'Editar purchase', 'ACT', 'FNC'),
('roles_DEL', 'Eliminar roles', 'ACT', 'FNC'),
('roles_DSP', 'Detalle de roles', 'ACT', 'FNC'),
('roles_INS', 'Agregar roles', 'ACT', 'FNC'),
('roles_UPD', 'Editar roles', 'ACT', 'FNC'),
('roles_usuarios_DEL', 'Eliminar roles_usuarios', 'ACT', 'FNC'),
('roles_usuarios_DSP', 'Detalle de roles_usuarios', 'ACT', 'FNC'),
('roles_usuarios_INS', 'Agregar roles_usuarios', 'ACT', 'FNC'),
('roles_usuarios_UPD', 'Editar roles_usuarios', 'ACT', 'FNC'),
('songauthors_DEL', 'Eliminar songauthors', 'ACT', 'FNC'),
('songauthors_DSP', 'Detalle de songauthors', 'ACT', 'FNC'),
('songauthors_INS', 'Agregar songauthors', 'ACT', 'FNC'),
('songauthors_UPD', 'Editar songauthors', 'ACT', 'FNC'),
('song_DEL', 'Eliminar song', 'ACT', 'FNC'),
('song_DSP', 'Detalle de song', 'ACT', 'FNC'),
('song_INS', 'Agregar song', 'ACT', 'FNC'),
('song_UPD', 'Editar song', 'ACT', 'FNC'),
('subscriptionuser_DEL', 'Eliminar subscriptionuser', 'ACT', 'FNC'),
('subscriptionuser_DSP', 'Detalle de subscriptionuser', 'ACT', 'FNC'),
('subscriptionuser_INS', 'Agregar subscriptionuser', 'ACT', 'FNC'),
('subscriptionuser_UPD', 'Editar subscriptionuser', 'ACT', 'FNC'),
('subscription_DEL', 'Eliminar subscription', 'ACT', 'FNC'),
('subscription_DSP', 'Detalle de subscription', 'ACT', 'FNC'),
('subscription_INS', 'Agregar subscription', 'ACT', 'FNC'),
('subscription_UPD', 'Editar subscription', 'ACT', 'FNC'),
('usuario_DEL', 'Eliminar usuario', 'ACT', 'FNC'),
('usuario_DSP', 'Detalle de usuario', 'ACT', 'FNC'),
('usuario_INS', 'Agregar usuario', 'ACT', 'FNC'),
('usuario_UPD', 'Editar usuario', 'ACT', 'FNC'),
('video_DEL', 'Eliminar video', 'ACT', 'FNC'),
('video_DSP', 'Detalle de video', 'ACT', 'FNC'),
('video_INS', 'Agregar video', 'ACT', 'FNC'),
('video_UPD', 'Editar video', 'ACT', 'FNC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones_roles`
--

CREATE TABLE `funciones_roles` (
  `rolescod` varchar(15) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `funciones_roles`
--

INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`, `fnexp`) VALUES
('ADMIN', 'album_DEL', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'album_DSP', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'album_INS', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'album_UPD', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'artist_DEL', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'artist_DSP', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'artist_INS', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'artist_UPD', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'bitacora_DEL', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'bitacora_DSP', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'bitacora_INS', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'bitacora_UPD', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'carretillaanon_DEL', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'carretillaanon_DSP', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'carretillaanon_INS', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'carretillaanon_UPD', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'carretilla_DEL', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'carretilla_DSP', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'carretilla_INS', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'carretilla_UPD', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'Controllers\\Admin', 'ACT', '2024-12-06 16:50:01'),
('ADMIN', 'Controllers\\Admin\\Dashboard', 'ACT', '2024-12-04 15:44:52'),
('ADMIN', 'Controllers\\Admin\\Dashboard\\', 'ACT', '2024-12-06 16:50:33'),
('ADMIN', 'Controllers\\Albums\\Album', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Albums\\Albums', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Artists\\Artist', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Artists\\Artists', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Bitacoras\\Bitacora', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Bitacoras\\Bitacoras', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Carretillaanons\\Carretillaanon', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Carretillaanons\\Carretillaanons', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Carretillas\\Carretilla', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Carretillas\\Carretillas', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Escupitajo\\GenerarCrud', 'ACT', '2024-12-04 15:44:52'),
('ADMIN', 'Controllers\\Favoritess\\Favorites', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Favoritess\\Favoritess', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Funcionesroless\\Funcionesroles', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Funcionesroless\\Funcionesroless', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Funcioness\\Funciones', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Funcioness\\Funcioness', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Genres\\Genre', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Genres\\Genres', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Highligthsplaylists\\Highligthsplaylist', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Highligthsplaylists\\Highligthsplaylists', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Highligthss\\Highligths', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Highligthss\\Highligthss', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Home\\Home', 'ACT', '2024-12-04 15:44:52'),
('ADMIN', 'Controllers\\Lognonusers\\Lognonuser', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Lognonusers\\Lognonusers', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Logs\\Log', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Logs\\Logs', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Logusers\\Loguser', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Logusers\\Logusers', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Controllers\\Offersubscriptions\\Offersubscription', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Offersubscriptions\\Offersubscriptions', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Offers\\Offer', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Offers\\Offers', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Playlistsongss\\Playlistsongs', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Playlistsongss\\Playlistsongss', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Playlists\\Playlist', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Playlists\\Playlists', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Popularitys\\Popularity', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Popularitys\\Popularitys', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Productss\\Products', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Productss\\Productss', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Purchasedetails\\Purchasedetail', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Purchasedetails\\Purchasedetails', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Purchases\\Purchase', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Purchases\\Purchases', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Roless\\Roles', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Roless\\Roless', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Rolesusuarioss\\Rolesusuarios', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Rolesusuarioss\\Rolesusuarioss', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Search\\Search', 'ACT', '2024-12-04 15:44:52'),
('ADMIN', 'Controllers\\Songauthorss\\Songauthors', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Songauthorss\\Songauthorss', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Songs\\Song', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Songs\\Songs', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Store\\ShoppingCart', 'ACT', '2024-12-04 15:44:52'),
('ADMIN', 'Controllers\\Store\\Store', 'ACT', '2024-12-04 15:44:52'),
('ADMIN', 'Controllers\\Subscriptions\\Subscription', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Subscriptions\\Subscriptions', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Subscriptionusers\\Subscriptionuser', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Subscriptionusers\\Subscriptionusers', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Usuarios\\Usuario', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Usuarios\\Usuarios', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Videos\\Video', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Controllers\\Videos\\Videos', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'favorites_DEL', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'favorites_DSP', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'favorites_INS', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'favorites_UPD', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'funciones_DEL', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'funciones_DSP', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'funciones_INS', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'funciones_roles_DEL', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'funciones_roles_DSP', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'funciones_roles_INS', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'funciones_roles_UPD', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'funciones_UPD', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'genre_DEL', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'genre_DSP', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'genre_INS', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'genre_UPD', 'ACT', '2024-12-04 17:44:53'),
('ADMIN', 'highligthsplaylist_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'highligthsplaylist_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'highligthsplaylist_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'highligthsplaylist_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'highligths_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'highligths_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'highligths_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'highligths_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'lognonuser_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'lognonuser_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'lognonuser_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'lognonuser_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'loguser_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'loguser_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'loguser_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'loguser_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'log_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'log_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'log_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'log_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'Menu_Album', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Menu_Artist', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Menu_Bitacora', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Menu_Carretilla', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Menu_Carretillaanon', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Menu_Favorites', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Menu_Funciones', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Menu_Funcionesroles', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Menu_Genre', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Menu_Highligths', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Menu_Highligthsplaylist', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Menu_Home', 'ACT', '2024-12-04 15:44:52'),
('ADMIN', 'Menu_Log', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Menu_Lognonuser', 'ACT', '2024-12-04 15:44:41'),
('ADMIN', 'Menu_Loguser', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Offer', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Offersubscription', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Playlist', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Playlistsongs', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Popularity', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Products', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Purchase', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Purchasedetail', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Roles', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Rolesusuarios', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Search', 'ACT', '2024-12-04 15:44:52'),
('ADMIN', 'Menu_Song', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Songauthors', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Subscription', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Subscriptionuser', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Usuario', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'Menu_Video', 'ACT', '2024-12-04 15:44:42'),
('ADMIN', 'offersubscription_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'offersubscription_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'offersubscription_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'offersubscription_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'offer_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'offer_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'offer_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'offer_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'playlistsongs_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'playlistsongs_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'playlistsongs_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'playlistsongs_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'playlist_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'playlist_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'playlist_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'playlist_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'popularity_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'popularity_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'popularity_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'popularity_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'products_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'products_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'products_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'products_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'purchasedetail_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'purchasedetail_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'purchasedetail_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'purchasedetail_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'purchase_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'purchase_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'purchase_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'purchase_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'roles_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'roles_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'roles_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'roles_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'roles_usuarios_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'roles_usuarios_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'roles_usuarios_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'roles_usuarios_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'songauthors_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'songauthors_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'songauthors_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'songauthors_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'song_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'song_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'song_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'song_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'subscriptionuser_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'subscriptionuser_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'subscriptionuser_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'subscriptionuser_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'subscription_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'subscription_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'subscription_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'subscription_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'usuario_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'usuario_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'usuario_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'usuario_UPD', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'video_DEL', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'video_DSP', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'video_INS', 'ACT', '2024-12-04 17:44:54'),
('ADMIN', 'video_UPD', 'ACT', '2024-12-04 17:44:54'),
('ART', 'album_DEL', 'ACT', '2024-12-04 17:44:59'),
('ART', 'album_DSP', 'ACT', '2024-12-04 17:44:59'),
('ART', 'album_INS', 'ACT', '2024-12-04 17:44:59'),
('ART', 'album_UPD', 'ACT', '2024-12-04 17:44:59'),
('ART', 'artist_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'artist_DSP', 'ACT', '2024-12-04 17:44:59'),
('ART', 'artist_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'artist_UPD', 'ACT', '2024-12-04 17:44:59'),
('ART', 'bitacora_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'bitacora_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'bitacora_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'bitacora_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'carretillaanon_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'carretillaanon_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'carretillaanon_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'carretillaanon_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'carretilla_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'carretilla_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'carretilla_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'carretilla_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'Controllers\\Admin\\Dashboard', 'ACT', '2024-12-06 16:45:23'),
('ART', 'Controllers\\Albums\\Album', 'ACT', '2024-12-04 15:44:46'),
('ART', 'Controllers\\Albums\\Albums', 'ACT', '2024-12-04 15:44:46'),
('ART', 'Controllers\\Artists\\Artist', 'ACT', '2024-12-04 15:44:46'),
('ART', 'Controllers\\Artists\\Artists', 'ACT', '2024-12-04 15:44:46'),
('ART', 'Controllers\\Bitacoras\\Bitacora', 'ACT', '2024-12-04 15:44:46'),
('ART', 'Controllers\\Bitacoras\\Bitacoras', 'ACT', '2024-12-04 15:44:46'),
('ART', 'Controllers\\Carretillaanons\\Carretillaanon', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Carretillaanons\\Carretillaanons', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Carretillas\\Carretilla', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Carretillas\\Carretillas', 'ACT', '2024-12-04 15:44:46'),
('ART', 'Controllers\\Favoritess\\Favorites', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Favoritess\\Favoritess', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Funcionesroless\\Funcionesroles', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Funcionesroless\\Funcionesroless', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Funcioness\\Funciones', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Funcioness\\Funcioness', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Genres\\Genre', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Genres\\Genres', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Highligthsplaylists\\Highligthsplaylist', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Highligthsplaylists\\Highligthsplaylists', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Highligthss\\Highligths', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Highligthss\\Highligthss', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Home\\Home', 'ACT', '2024-12-04 15:44:52'),
('ART', 'Controllers\\Lognonusers\\Lognonuser', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Lognonusers\\Lognonusers', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Logs\\Log', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Logs\\Logs', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Logusers\\Loguser', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Logusers\\Logusers', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Offersubscriptions\\Offersubscription', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Offersubscriptions\\Offersubscriptions', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Offers\\Offer', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Offers\\Offers', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Playlistsongss\\Playlistsongs', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Playlistsongss\\Playlistsongss', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Playlists\\Playlist', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Playlists\\Playlists', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Popularitys\\Popularity', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Popularitys\\Popularitys', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Productss\\Products', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Productss\\Productss', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Purchasedetails\\Purchasedetail', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Purchasedetails\\Purchasedetails', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Purchases\\Purchase', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Purchases\\Purchases', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Roless\\Roles', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Roless\\Roless', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Rolesusuarioss\\Rolesusuarios', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Rolesusuarioss\\Rolesusuarioss', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Search\\Search', 'ACT', '2024-12-04 15:44:52'),
('ART', 'Controllers\\Songauthorss\\Songauthors', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Songauthorss\\Songauthorss', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Songs\\Song', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Songs\\Songs', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Subscriptions\\Subscription', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Subscriptions\\Subscriptions', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Subscriptionusers\\Subscriptionuser', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Subscriptionusers\\Subscriptionusers', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Usuarios\\Usuario', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Usuarios\\Usuarios', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Videos\\Video', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Controllers\\Videos\\Videos', 'ACT', '2024-12-04 15:44:47'),
('ART', 'favorites_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'favorites_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'favorites_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'favorites_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'funciones_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'funciones_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'funciones_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'funciones_roles_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'funciones_roles_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'funciones_roles_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'funciones_roles_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'funciones_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'genre_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'genre_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'genre_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'genre_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'highligthsplaylist_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'highligthsplaylist_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'highligthsplaylist_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'highligthsplaylist_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'highligths_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'highligths_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'highligths_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'highligths_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'lognonuser_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'lognonuser_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'lognonuser_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'lognonuser_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'loguser_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'loguser_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'loguser_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'loguser_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'log_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'log_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'log_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'log_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'Menu_Album', 'ACT', '2024-12-04 15:44:46'),
('ART', 'Menu_Artist', 'ACT', '2024-12-04 15:44:46'),
('ART', 'Menu_Bitacora', 'ACT', '2024-12-04 15:44:46'),
('ART', 'Menu_Carretilla', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Carretillaanon', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Favorites', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Funciones', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Funcionesroles', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Genre', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Highligths', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Highligthsplaylist', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Home', 'ACT', '2024-12-04 15:44:52'),
('ART', 'Menu_Log', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Lognonuser', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Loguser', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Offer', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Offersubscription', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Playlist', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Playlistsongs', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Popularity', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Products', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Purchase', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Purchasedetail', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Roles', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Rolesusuarios', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Search', 'ACT', '2024-12-04 15:44:52'),
('ART', 'Menu_Song', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Songauthors', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Subscription', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Subscriptionuser', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Usuario', 'ACT', '2024-12-04 15:44:47'),
('ART', 'Menu_Video', 'ACT', '2024-12-04 15:44:47'),
('ART', 'offersubscription_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'offersubscription_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'offersubscription_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'offersubscription_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'offer_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'offer_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'offer_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'offer_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'playlistsongs_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'playlistsongs_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'playlistsongs_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'playlistsongs_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'playlist_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'playlist_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'playlist_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'playlist_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'popularity_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'popularity_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'popularity_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'popularity_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'products_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'products_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'products_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'products_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'purchasedetail_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'purchasedetail_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'purchasedetail_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'purchasedetail_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'purchase_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'purchase_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'purchase_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'purchase_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'roles_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'roles_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'roles_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'roles_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'roles_usuarios_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'roles_usuarios_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'roles_usuarios_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'roles_usuarios_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'songauthors_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'songauthors_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'songauthors_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'songauthors_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'song_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'song_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'song_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'song_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'subscriptionuser_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'subscriptionuser_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'subscriptionuser_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'subscriptionuser_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'subscription_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'subscription_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'subscription_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'subscription_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'usuario_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'usuario_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'usuario_INS', 'ACT', '2024-12-04 17:45:00'),
('ART', 'usuario_UPD', 'ACT', '2024-12-04 17:45:00'),
('ART', 'video_DEL', 'ACT', '2024-12-04 17:45:00'),
('ART', 'video_DSP', 'ACT', '2024-12-04 17:45:00'),
('ART', 'video_INS', 'ACT', '2024-12-04 17:45:01'),
('ART', 'video_UPD', 'ACT', '2024-12-04 17:45:00'),
('AUDIT', 'album_DSP', 'ACT', '2024-12-04 17:44:54'),
('AUDIT', 'artist_DSP', 'ACT', '2024-12-04 17:44:54'),
('AUDIT', 'bitacora_DSP', 'ACT', '2024-12-04 17:44:54'),
('AUDIT', 'carretillaanon_DSP', 'ACT', '2024-12-04 17:44:54'),
('AUDIT', 'carretilla_DSP', 'ACT', '2024-12-04 17:44:54'),
('AUDIT', 'Controllers\\Albums\\Album', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Albums\\Albums', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Artists\\Artist', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Artists\\Artists', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Bitacoras\\Bitacora', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Bitacoras\\Bitacoras', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Carretillaanons\\Carretillaanon', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Carretillaanons\\Carretillaanons', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Carretillas\\Carretilla', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Carretillas\\Carretillas', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Favoritess\\Favorites', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Favoritess\\Favoritess', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Funcionesroless\\Funcionesroles', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Funcionesroless\\Funcionesroless', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Funcioness\\Funciones', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Funcioness\\Funcioness', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Genres\\Genre', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Genres\\Genres', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Highligthsplaylists\\Highligthsplaylist', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Highligthsplaylists\\Highligthsplaylists', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Highligthss\\Highligths', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Highligthss\\Highligthss', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Home\\Home', 'ACT', '2024-12-04 15:44:52'),
('AUDIT', 'Controllers\\Lognonusers\\Lognonuser', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Lognonusers\\Lognonusers', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Logs\\Log', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Logs\\Logs', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Logusers\\Loguser', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Logusers\\Logusers', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Offersubscriptions\\Offersubscription', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Offersubscriptions\\Offersubscriptions', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Offers\\Offer', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Offers\\Offers', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Playlistsongss\\Playlistsongs', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Playlistsongss\\Playlistsongss', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Playlists\\Playlist', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Playlists\\Playlists', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Popularitys\\Popularity', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Popularitys\\Popularitys', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Productss\\Products', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Productss\\Productss', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Purchasedetails\\Purchasedetail', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Purchasedetails\\Purchasedetails', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Purchases\\Purchase', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Purchases\\Purchases', 'ACT', '2024-12-04 15:44:42'),
('AUDIT', 'Controllers\\Roless\\Roles', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Roless\\Roless', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Rolesusuarioss\\Rolesusuarios', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Rolesusuarioss\\Rolesusuarioss', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Search\\Search', 'ACT', '2024-12-04 15:44:52'),
('AUDIT', 'Controllers\\Songauthorss\\Songauthors', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Songauthorss\\Songauthorss', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Songs\\Song', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Songs\\Songs', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Subscriptions\\Subscription', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Subscriptions\\Subscriptions', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Subscriptionusers\\Subscriptionuser', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Subscriptionusers\\Subscriptionusers', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Usuarios\\Usuario', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Usuarios\\Usuarios', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Videos\\Video', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'Controllers\\Videos\\Videos', 'ACT', '2024-12-04 15:44:43'),
('AUDIT', 'favorites_DSP', 'ACT', '2024-12-04 17:44:54'),
('AUDIT', 'funciones_DSP', 'ACT', '2024-12-04 17:44:54'),
('AUDIT', 'funciones_roles_DEL', 'ACT', '2024-12-04 17:44:54'),
('AUDIT', 'funciones_roles_DSP', 'ACT', '2024-12-04 17:44:54'),
('AUDIT', 'funciones_roles_INS', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'funciones_roles_UPD', 'ACT', '2024-12-04 17:44:54'),
('AUDIT', 'genre_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'highligthsplaylist_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'highligths_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'lognonuser_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'loguser_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'log_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'Menu_Home', 'ACT', '2024-12-04 15:44:52'),
('AUDIT', 'Menu_Search', 'ACT', '2024-12-04 15:44:52'),
('AUDIT', 'offersubscription_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'offer_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'playlistsongs_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'playlist_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'popularity_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'products_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'purchasedetail_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'purchase_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'roles_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'roles_usuarios_DEL', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'roles_usuarios_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'roles_usuarios_INS', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'roles_usuarios_UPD', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'songauthors_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'song_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'subscriptionuser_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'subscription_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'usuario_DSP', 'ACT', '2024-12-04 17:44:55'),
('AUDIT', 'video_DSP', 'ACT', '2024-12-04 17:44:55'),
('CLN', 'album_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLN', 'artist_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLN', 'bitacora_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLN', 'carretillaanon_DEL', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'carretillaanon_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'carretillaanon_INS', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'carretillaanon_UPD', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'carretilla_DEL', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'carretilla_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLN', 'carretilla_INS', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'carretilla_UPD', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'Controllers\\Carretillaanons\\Carretillaanon', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Carretillaanons\\Carretillaanons', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Carretillas\\Carretilla', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Carretillas\\Carretillas', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Favoritess\\Favorites', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Favoritess\\Favoritess', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Home\\Home', 'ACT', '2024-12-04 15:44:52'),
('CLN', 'Controllers\\Offersubscriptions\\Offersubscription', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Offersubscriptions\\Offersubscriptions', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Productss\\Products', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Productss\\Productss', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Purchasedetails\\Purchasedetail', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Purchasedetails\\Purchasedetails', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Purchases\\Purchase', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Purchases\\Purchases', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Search\\Search', 'ACT', '2024-12-04 15:44:52'),
('CLN', 'Controllers\\Store\\Store', 'ACT', '2024-12-04 15:44:52'),
('CLN', 'Controllers\\Subscriptionusers\\Subscriptionuser', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Controllers\\Subscriptionusers\\Subscriptionusers', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'favorites_DEL', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'favorites_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'favorites_INS', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'favorites_UPD', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'funciones_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'funciones_roles_DEL', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'funciones_roles_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'funciones_roles_INS', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'funciones_roles_UPD', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'genre_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'highligthsplaylist_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'highligths_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'lognonuser_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'loguser_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'log_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'Menu_Carretilla', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Menu_Carretillaanon', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Menu_Favorites', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Menu_Home', 'ACT', '2024-12-04 15:44:52'),
('CLN', 'Menu_Offersubscription', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Menu_Products', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Menu_Purchase', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Menu_Purchasedetail', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'Menu_Search', 'ACT', '2024-12-04 15:44:52'),
('CLN', 'Menu_Subscriptionuser', 'ACT', '2024-12-04 15:44:45'),
('CLN', 'offersubscription_DEL', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'offersubscription_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'offersubscription_INS', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'offersubscription_UPD', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'offer_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'playlistsongs_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'playlist_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'popularity_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'products_DEL', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'products_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'products_INS', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'products_UPD', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'purchasedetail_DEL', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'purchasedetail_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'purchasedetail_INS', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'purchasedetail_UPD', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'purchase_DEL', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'purchase_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'purchase_INS', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'purchase_UPD', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'roles_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'roles_usuarios_DEL', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'roles_usuarios_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'roles_usuarios_INS', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'roles_usuarios_UPD', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'songauthors_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'song_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'subscriptionuser_DEL', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'subscriptionuser_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'subscriptionuser_INS', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'subscriptionuser_UPD', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'subscription_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'usuario_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLN', 'video_DSP', 'ACT', '2024-12-04 17:44:58'),
('CLS', 'album_DEL', 'ACT', '2024-12-04 17:44:56'),
('CLS', 'album_DSP', 'ACT', '2024-12-04 17:44:56'),
('CLS', 'album_INS', 'ACT', '2024-12-04 17:44:56'),
('CLS', 'album_UPD', 'ACT', '2024-12-04 17:44:56'),
('CLS', 'artist_DEL', 'ACT', '2024-12-04 17:44:56'),
('CLS', 'artist_DSP', 'ACT', '2024-12-04 17:44:56'),
('CLS', 'artist_INS', 'ACT', '2024-12-04 17:44:56'),
('CLS', 'artist_UPD', 'ACT', '2024-12-04 17:44:56'),
('CLS', 'bitacora_DEL', 'ACT', '2024-12-04 17:44:56'),
('CLS', 'bitacora_DSP', 'ACT', '2024-12-04 17:44:56'),
('CLS', 'bitacora_INS', 'ACT', '2024-12-04 17:44:56'),
('CLS', 'bitacora_UPD', 'ACT', '2024-12-04 17:44:56'),
('CLS', 'carretillaanon_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'carretillaanon_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'carretillaanon_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'carretillaanon_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'carretilla_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'carretilla_DSP', 'ACT', '2024-12-04 17:44:56'),
('CLS', 'carretilla_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'carretilla_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'Controllers\\Albums\\Album', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Albums\\Albums', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Artists\\Artist', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Artists\\Artists', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Bitacoras\\Bitacora', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Bitacoras\\Bitacoras', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Carretillaanons\\Carretillaanon', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Carretillaanons\\Carretillaanons', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Carretillas\\Carretilla', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Carretillas\\Carretillas', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Favoritess\\Favorites', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Favoritess\\Favoritess', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Funcionesroless\\Funcionesroles', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Funcionesroless\\Funcionesroless', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Funcioness\\Funciones', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Funcioness\\Funcioness', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Genres\\Genre', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Genres\\Genres', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Highligthsplaylists\\Highligthsplaylist', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Highligthsplaylists\\Highligthsplaylists', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Highligthss\\Highligths', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Highligthss\\Highligthss', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Home\\Home', 'ACT', '2024-12-04 15:44:52'),
('CLS', 'Controllers\\Lognonusers\\Lognonuser', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Lognonusers\\Lognonusers', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Logs\\Log', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Logs\\Logs', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Logusers\\Loguser', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Logusers\\Logusers', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Offersubscriptions\\Offersubscription', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Offersubscriptions\\Offersubscriptions', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Offers\\Offer', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Offers\\Offers', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Playlistsongss\\Playlistsongs', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Playlistsongss\\Playlistsongss', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Playlists\\Playlist', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Playlists\\Playlists', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Popularitys\\Popularity', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Popularitys\\Popularitys', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Productss\\Products', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Productss\\Productss', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Purchasedetails\\Purchasedetail', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Purchasedetails\\Purchasedetails', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Purchases\\Purchase', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Purchases\\Purchases', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Roless\\Roles', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Roless\\Roless', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Rolesusuarioss\\Rolesusuarios', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Rolesusuarioss\\Rolesusuarioss', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Search\\Search', 'ACT', '2024-12-04 15:44:52'),
('CLS', 'Controllers\\Songauthorss\\Songauthors', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Songauthorss\\Songauthorss', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Songs\\Song', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Songs\\Songs', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Store\\Store', 'ACT', '2024-12-04 15:44:52'),
('CLS', 'Controllers\\Subscriptions\\Subscription', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Subscriptions\\Subscriptions', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Subscriptionusers\\Subscriptionuser', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Subscriptionusers\\Subscriptionusers', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Usuarios\\Usuario', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Usuarios\\Usuarios', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Videos\\Video', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Controllers\\Videos\\Videos', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'favorites_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'favorites_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'favorites_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'favorites_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'funciones_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'funciones_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'funciones_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'funciones_roles_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'funciones_roles_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'funciones_roles_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'funciones_roles_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'funciones_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'genre_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'genre_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'genre_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'genre_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'highligthsplaylist_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'highligthsplaylist_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'highligthsplaylist_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'highligthsplaylist_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'highligths_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'highligths_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'highligths_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'highligths_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'lognonuser_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'lognonuser_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'lognonuser_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'lognonuser_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'loguser_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'loguser_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'loguser_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'loguser_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'log_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'log_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'log_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'log_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'Menu_Album', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Artist', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Bitacora', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Carretilla', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Carretillaanon', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Favorites', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Funciones', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Funcionesroles', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Genre', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Highligths', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Highligthsplaylist', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Home', 'ACT', '2024-12-04 15:44:52'),
('CLS', 'Menu_Log', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Lognonuser', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Loguser', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Offer', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Offersubscription', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Playlist', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Playlistsongs', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Popularity', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Products', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Purchase', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Purchasedetail', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Roles', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Rolesusuarios', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Search', 'ACT', '2024-12-04 15:44:52'),
('CLS', 'Menu_Song', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Songauthors', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Subscription', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Subscriptionuser', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Usuario', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'Menu_Video', 'ACT', '2024-12-04 15:44:44'),
('CLS', 'offersubscription_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'offersubscription_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'offersubscription_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'offersubscription_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'offer_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'offer_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'offer_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'offer_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'playlistsongs_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'playlistsongs_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'playlistsongs_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'playlistsongs_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'playlist_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'playlist_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'playlist_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'playlist_UPD', 'ACT', '2024-12-04 17:44:57');
INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`, `fnexp`) VALUES
('CLS', 'popularity_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'popularity_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'popularity_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'popularity_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'products_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'products_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'products_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'products_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'purchasedetail_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'purchasedetail_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'purchasedetail_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'purchasedetail_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'purchase_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'purchase_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'purchase_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'purchase_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'roles_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'roles_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'roles_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'roles_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'roles_usuarios_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'roles_usuarios_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'roles_usuarios_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'roles_usuarios_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'songauthors_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'songauthors_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'songauthors_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'songauthors_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'song_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'song_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'song_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'song_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'subscriptionuser_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'subscriptionuser_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'subscriptionuser_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'subscriptionuser_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'subscription_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'subscription_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'subscription_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'subscription_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'usuario_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'usuario_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'usuario_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'usuario_UPD', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'video_DEL', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'video_DSP', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'video_INS', 'ACT', '2024-12-04 17:44:57'),
('CLS', 'video_UPD', 'ACT', '2024-12-04 17:44:57'),
('DEV', 'album_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'album_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'album_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'album_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'artist_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'artist_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'artist_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'artist_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'bitacora_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'bitacora_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'bitacora_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'bitacora_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'carretillaanon_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'carretillaanon_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'carretillaanon_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'carretillaanon_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'carretilla_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'carretilla_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'carretilla_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'carretilla_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'Controllers\\Albums\\Album', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Albums\\Albums', 'ACT', '2024-12-04 15:44:47'),
('DEV', 'Controllers\\Artists\\Artist', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Artists\\Artists', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Bitacoras\\Bitacora', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Bitacoras\\Bitacoras', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Carretillaanons\\Carretillaanon', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Carretillaanons\\Carretillaanons', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Carretillas\\Carretilla', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Carretillas\\Carretillas', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Favoritess\\Favorites', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Favoritess\\Favoritess', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Funcionesroless\\Funcionesroles', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Funcionesroless\\Funcionesroless', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Funcioness\\Funciones', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Funcioness\\Funcioness', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Genres\\Genre', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Genres\\Genres', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Highligthsplaylists\\Highligthsplaylist', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Highligthsplaylists\\Highligthsplaylists', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Highligthss\\Highligths', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Highligthss\\Highligthss', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Home\\Home', 'ACT', '2024-12-04 15:44:52'),
('DEV', 'Controllers\\Lognonusers\\Lognonuser', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Lognonusers\\Lognonusers', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Logs\\Log', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Logs\\Logs', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Logusers\\Loguser', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Logusers\\Logusers', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Offersubscriptions\\Offersubscription', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Offersubscriptions\\Offersubscriptions', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Offers\\Offer', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Offers\\Offers', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Playlistsongss\\Playlistsongs', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Playlistsongss\\Playlistsongss', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Playlists\\Playlist', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Playlists\\Playlists', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Popularitys\\Popularity', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Popularitys\\Popularitys', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Productss\\Products', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Productss\\Productss', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Purchasedetails\\Purchasedetail', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Purchasedetails\\Purchasedetails', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Purchases\\Purchase', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Purchases\\Purchases', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Roless\\Roles', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Roless\\Roless', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Rolesusuarioss\\Rolesusuarios', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Rolesusuarioss\\Rolesusuarioss', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Search\\Search', 'ACT', '2024-12-04 15:44:52'),
('DEV', 'Controllers\\Songauthorss\\Songauthors', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Songauthorss\\Songauthorss', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Songs\\Song', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Songs\\Songs', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Subscriptions\\Subscription', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Subscriptions\\Subscriptions', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Subscriptionusers\\Subscriptionuser', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Subscriptionusers\\Subscriptionusers', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Usuarios\\Usuario', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Usuarios\\Usuarios', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Videos\\Video', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Controllers\\Videos\\Videos', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'favorites_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'favorites_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'favorites_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'favorites_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'funciones_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'funciones_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'funciones_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'funciones_roles_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'funciones_roles_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'funciones_roles_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'funciones_roles_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'funciones_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'genre_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'genre_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'genre_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'genre_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'highligthsplaylist_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'highligthsplaylist_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'highligthsplaylist_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'highligthsplaylist_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'highligths_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'highligths_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'highligths_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'highligths_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'lognonuser_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'lognonuser_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'lognonuser_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'lognonuser_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'loguser_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'loguser_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'loguser_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'loguser_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'log_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'log_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'log_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'log_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'Menu_Album', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Artist', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Bitacora', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Carretilla', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Carretillaanon', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Favorites', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Funciones', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Funcionesroles', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Genre', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Highligths', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Highligthsplaylist', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Home', 'ACT', '2024-12-04 15:44:52'),
('DEV', 'Menu_Log', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Lognonuser', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Loguser', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Offer', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Offersubscription', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Playlist', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Playlistsongs', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Popularity', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Products', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Purchase', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Purchasedetail', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Roles', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Rolesusuarios', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Search', 'ACT', '2024-12-04 15:44:52'),
('DEV', 'Menu_Song', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Songauthors', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Subscription', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Subscriptionuser', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Usuario', 'ACT', '2024-12-04 15:44:48'),
('DEV', 'Menu_Video', 'ACT', '2024-12-04 15:44:49'),
('DEV', 'offersubscription_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'offersubscription_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'offersubscription_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'offersubscription_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'offer_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'offer_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'offer_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'offer_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'playlistsongs_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'playlistsongs_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'playlistsongs_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'playlistsongs_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'playlist_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'playlist_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'playlist_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'playlist_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'popularity_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'popularity_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'popularity_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'popularity_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'products_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'products_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'products_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'products_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'purchasedetail_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'purchasedetail_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'purchasedetail_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'purchasedetail_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'purchase_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'purchase_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'purchase_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'purchase_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'roles_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'roles_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'roles_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'roles_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'roles_usuarios_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'roles_usuarios_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'roles_usuarios_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'roles_usuarios_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'songauthors_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'songauthors_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'songauthors_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'songauthors_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'song_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'song_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'song_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'song_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'subscriptionuser_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'subscriptionuser_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'subscriptionuser_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'subscriptionuser_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'subscription_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'subscription_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'subscription_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'subscription_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'usuario_DEL', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'usuario_DSP', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'usuario_INS', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'usuario_UPD', 'ACT', '2024-12-04 17:45:01'),
('DEV', 'video_DEL', 'ACT', '2024-12-04 17:45:02'),
('DEV', 'video_DSP', 'ACT', '2024-12-04 17:45:02'),
('DEV', 'video_INS', 'ACT', '2024-12-04 17:45:02'),
('DEV', 'video_UPD', 'ACT', '2024-12-04 17:45:02'),
('INV', 'album_DSP', 'ACT', '2024-12-04 17:45:02'),
('INV', 'artist_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'bitacora_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'carretillaanon_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'carretilla_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'Controllers\\Albums\\Album', 'ACT', '2024-12-04 15:44:49'),
('INV', 'Controllers\\Albums\\Albums', 'ACT', '2024-12-04 15:44:49'),
('INV', 'Controllers\\Artists\\Artist', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Artists\\Artists', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Bitacoras\\Bitacora', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Bitacoras\\Bitacoras', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Carretillaanons\\Carretillaanon', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Carretillaanons\\Carretillaanons', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Carretillas\\Carretilla', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Carretillas\\Carretillas', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Favoritess\\Favorites', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Favoritess\\Favoritess', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Funcionesroless\\Funcionesroles', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Funcionesroless\\Funcionesroless', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Funcioness\\Funciones', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Funcioness\\Funcioness', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Genres\\Genre', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Genres\\Genres', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Highligthsplaylists\\Highligthsplaylist', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Highligthsplaylists\\Highligthsplaylists', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Highligthss\\Highligths', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Highligthss\\Highligthss', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Home\\Home', 'ACT', '2024-12-04 15:44:52'),
('INV', 'Controllers\\Lognonusers\\Lognonuser', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Lognonusers\\Lognonusers', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Logs\\Log', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Logs\\Logs', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Logusers\\Loguser', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Logusers\\Logusers', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Offersubscriptions\\Offersubscription', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Offersubscriptions\\Offersubscriptions', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Offers\\Offer', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Offers\\Offers', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Playlistsongss\\Playlistsongs', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Playlistsongss\\Playlistsongss', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Playlists\\Playlist', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Playlists\\Playlists', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Popularitys\\Popularity', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Popularitys\\Popularitys', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Productss\\Products', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Productss\\Productss', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Purchasedetails\\Purchasedetail', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Purchasedetails\\Purchasedetails', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Purchases\\Purchase', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Purchases\\Purchases', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Roless\\Roles', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Roless\\Roless', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Rolesusuarioss\\Rolesusuarios', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Rolesusuarioss\\Rolesusuarioss', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Search\\Search', 'ACT', '2024-12-04 15:44:52'),
('INV', 'Controllers\\Songauthorss\\Songauthors', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Songauthorss\\Songauthorss', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Songs\\Song', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Songs\\Songs', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Subscriptions\\Subscription', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Subscriptions\\Subscriptions', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Subscriptionusers\\Subscriptionuser', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Subscriptionusers\\Subscriptionusers', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Usuarios\\Usuario', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Usuarios\\Usuarios', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Videos\\Video', 'ACT', '2024-12-04 15:44:50'),
('INV', 'Controllers\\Videos\\Videos', 'ACT', '2024-12-04 15:44:50'),
('INV', 'favorites_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'funciones_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'funciones_roles_DEL', 'ACT', '2024-12-04 17:45:03'),
('INV', 'funciones_roles_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'funciones_roles_INS', 'ACT', '2024-12-04 17:45:03'),
('INV', 'funciones_roles_UPD', 'ACT', '2024-12-04 17:45:03'),
('INV', 'genre_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'highligthsplaylist_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'highligths_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'lognonuser_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'loguser_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'log_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'Menu_Home', 'ACT', '2024-12-04 15:44:52'),
('INV', 'Menu_Search', 'ACT', '2024-12-04 15:44:52'),
('INV', 'offersubscription_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'offer_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'playlistsongs_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'playlist_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'popularity_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'products_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'purchasedetail_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'purchase_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'roles_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'roles_usuarios_DEL', 'ACT', '2024-12-04 17:45:03'),
('INV', 'roles_usuarios_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'roles_usuarios_INS', 'ACT', '2024-12-04 17:45:03'),
('INV', 'roles_usuarios_UPD', 'ACT', '2024-12-04 17:45:03'),
('INV', 'songauthors_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'song_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'subscriptionuser_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'subscription_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'usuario_DSP', 'ACT', '2024-12-04 17:45:03'),
('INV', 'video_DSP', 'ACT', '2024-12-04 17:45:03'),
('OPADQ', 'album_DEL', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'album_DSP', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'album_INS', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'album_UPD', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'artist_DEL', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'artist_DSP', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'artist_INS', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'artist_UPD', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'bitacora_DEL', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'bitacora_DSP', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'bitacora_INS', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'bitacora_UPD', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'carretillaanon_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'carretillaanon_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'carretillaanon_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'carretillaanon_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'carretilla_DEL', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'carretilla_DSP', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'carretilla_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'carretilla_UPD', 'ACT', '2024-12-04 17:44:55'),
('OPADQ', 'Controllers\\Albums\\Album', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Albums\\Albums', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Artists\\Artist', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Artists\\Artists', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Bitacoras\\Bitacora', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Bitacoras\\Bitacoras', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Carretillaanons\\Carretillaanon', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Carretillaanons\\Carretillaanons', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Carretillas\\Carretilla', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Carretillas\\Carretillas', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Favoritess\\Favorites', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Favoritess\\Favoritess', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Funcionesroless\\Funcionesroles', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Funcionesroless\\Funcionesroless', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Funcioness\\Funciones', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Funcioness\\Funcioness', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Genres\\Genre', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Genres\\Genres', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Highligthsplaylists\\Highligthsplaylist', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Highligthsplaylists\\Highligthsplaylists', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Highligthss\\Highligths', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Highligthss\\Highligthss', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Home\\Home', 'ACT', '2024-12-04 15:44:52'),
('OPADQ', 'Controllers\\Lognonusers\\Lognonuser', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Lognonusers\\Lognonusers', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Logs\\Log', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Logs\\Logs', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Logusers\\Loguser', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Logusers\\Logusers', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Offersubscriptions\\Offersubscription', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Offersubscriptions\\Offersubscriptions', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Offers\\Offer', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Offers\\Offers', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Playlistsongss\\Playlistsongs', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Playlistsongss\\Playlistsongss', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Playlists\\Playlist', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Playlists\\Playlists', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Popularitys\\Popularity', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Popularitys\\Popularitys', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Productss\\Products', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Productss\\Productss', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Purchasedetails\\Purchasedetail', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Purchasedetails\\Purchasedetails', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Purchases\\Purchase', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Purchases\\Purchases', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Roless\\Roles', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Roless\\Roless', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Rolesusuarioss\\Rolesusuarios', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Rolesusuarioss\\Rolesusuarioss', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Search\\Search', 'ACT', '2024-12-04 15:44:52'),
('OPADQ', 'Controllers\\Songauthorss\\Songauthors', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Songauthorss\\Songauthorss', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Songs\\Song', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Songs\\Songs', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Subscriptions\\Subscription', 'ACT', '2024-12-04 15:44:44'),
('OPADQ', 'Controllers\\Subscriptions\\Subscriptions', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Controllers\\Subscriptionusers\\Subscriptionuser', 'ACT', '2024-12-04 15:44:44'),
('OPADQ', 'Controllers\\Subscriptionusers\\Subscriptionusers', 'ACT', '2024-12-04 15:44:44'),
('OPADQ', 'Controllers\\Usuarios\\Usuario', 'ACT', '2024-12-04 15:44:44'),
('OPADQ', 'Controllers\\Usuarios\\Usuarios', 'ACT', '2024-12-04 15:44:44'),
('OPADQ', 'Controllers\\Videos\\Video', 'ACT', '2024-12-04 15:44:44'),
('OPADQ', 'Controllers\\Videos\\Videos', 'ACT', '2024-12-04 15:44:44'),
('OPADQ', 'favorites_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'favorites_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'favorites_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'favorites_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'funciones_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'funciones_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'funciones_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'funciones_roles_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'funciones_roles_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'funciones_roles_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'funciones_roles_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'funciones_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'genre_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'genre_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'genre_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'genre_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'highligthsplaylist_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'highligthsplaylist_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'highligthsplaylist_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'highligthsplaylist_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'highligths_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'highligths_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'highligths_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'highligths_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'lognonuser_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'lognonuser_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'lognonuser_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'lognonuser_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'loguser_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'loguser_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'loguser_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'loguser_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'log_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'log_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'log_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'log_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'Menu_Album', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Artist', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Bitacora', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Carretilla', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Carretillaanon', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Favorites', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Funciones', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Funcionesroles', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Genre', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Highligths', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Highligthsplaylist', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Home', 'ACT', '2024-12-04 15:44:52'),
('OPADQ', 'Menu_Log', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Lognonuser', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Loguser', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Offer', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Offersubscription', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Playlist', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Playlistsongs', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Popularity', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Products', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Purchase', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Purchasedetail', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Roles', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Rolesusuarios', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Search', 'ACT', '2024-12-04 15:44:52'),
('OPADQ', 'Menu_Song', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Songauthors', 'ACT', '2024-12-04 15:44:43'),
('OPADQ', 'Menu_Subscription', 'ACT', '2024-12-04 15:44:44'),
('OPADQ', 'Menu_Subscriptionuser', 'ACT', '2024-12-04 15:44:44'),
('OPADQ', 'Menu_Usuario', 'ACT', '2024-12-04 15:44:44'),
('OPADQ', 'Menu_Video', 'ACT', '2024-12-04 15:44:44'),
('OPADQ', 'offersubscription_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'offersubscription_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'offersubscription_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'offersubscription_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'offer_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'offer_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'offer_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'offer_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'playlistsongs_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'playlistsongs_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'playlistsongs_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'playlistsongs_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'playlist_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'playlist_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'playlist_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'playlist_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'popularity_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'popularity_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'popularity_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'popularity_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'products_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'products_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'products_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'products_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'purchasedetail_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'purchasedetail_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'purchasedetail_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'purchasedetail_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'purchase_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'purchase_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'purchase_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'purchase_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'roles_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'roles_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'roles_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'roles_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'roles_usuarios_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'roles_usuarios_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'roles_usuarios_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'roles_usuarios_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'songauthors_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'songauthors_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'songauthors_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'songauthors_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'song_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'song_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'song_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'song_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'subscriptionuser_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'subscriptionuser_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'subscriptionuser_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'subscriptionuser_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'subscription_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'subscription_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'subscription_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'subscription_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'usuario_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'usuario_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'usuario_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'usuario_UPD', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'video_DEL', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'video_DSP', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'video_INS', 'ACT', '2024-12-04 17:44:56'),
('OPADQ', 'video_UPD', 'ACT', '2024-12-04 17:44:56'),
('SOP', 'album_DEL', 'ACT', '2024-12-04 17:45:03'),
('SOP', 'album_DSP', 'ACT', '2024-12-04 17:45:03'),
('SOP', 'album_INS', 'ACT', '2024-12-04 17:45:03'),
('SOP', 'album_UPD', 'ACT', '2024-12-04 17:45:03'),
('SOP', 'artist_DEL', 'ACT', '2024-12-04 17:45:03'),
('SOP', 'artist_DSP', 'ACT', '2024-12-04 17:45:03'),
('SOP', 'artist_INS', 'ACT', '2024-12-04 17:45:03'),
('SOP', 'artist_UPD', 'ACT', '2024-12-04 17:45:03'),
('SOP', 'bitacora_DEL', 'ACT', '2024-12-04 17:45:03'),
('SOP', 'bitacora_DSP', 'ACT', '2024-12-04 17:45:03'),
('SOP', 'bitacora_INS', 'ACT', '2024-12-04 17:45:03'),
('SOP', 'bitacora_UPD', 'ACT', '2024-12-04 17:45:03'),
('SOP', 'carretillaanon_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'carretillaanon_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'carretillaanon_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'carretillaanon_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'carretilla_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'carretilla_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'carretilla_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'carretilla_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'Controllers\\Albums\\Album', 'ACT', '2024-12-04 15:44:50'),
('SOP', 'Controllers\\Albums\\Albums', 'ACT', '2024-12-04 15:44:50'),
('SOP', 'Controllers\\Artists\\Artist', 'ACT', '2024-12-04 15:44:50'),
('SOP', 'Controllers\\Artists\\Artists', 'ACT', '2024-12-04 15:44:50'),
('SOP', 'Controllers\\Bitacoras\\Bitacora', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Bitacoras\\Bitacoras', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Carretillaanons\\Carretillaanon', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Carretillaanons\\Carretillaanons', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Carretillas\\Carretilla', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Carretillas\\Carretillas', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Favoritess\\Favorites', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Favoritess\\Favoritess', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Funcionesroless\\Funcionesroles', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Funcionesroless\\Funcionesroless', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Funcioness\\Funciones', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Funcioness\\Funcioness', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Genres\\Genre', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Genres\\Genres', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Highligthsplaylists\\Highligthsplaylist', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Highligthsplaylists\\Highligthsplaylists', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Highligthss\\Highligths', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Highligthss\\Highligthss', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Home\\Home', 'ACT', '2024-12-04 15:44:52'),
('SOP', 'Controllers\\Lognonusers\\Lognonuser', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Lognonusers\\Lognonusers', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Logs\\Log', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Logs\\Logs', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Logusers\\Loguser', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Logusers\\Logusers', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Offersubscriptions\\Offersubscription', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Offersubscriptions\\Offersubscriptions', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Offers\\Offer', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Offers\\Offers', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Playlistsongss\\Playlistsongs', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Playlistsongss\\Playlistsongss', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Playlists\\Playlist', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Playlists\\Playlists', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Popularitys\\Popularity', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Popularitys\\Popularitys', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Productss\\Products', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Productss\\Productss', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Purchasedetails\\Purchasedetail', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Purchasedetails\\Purchasedetails', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Purchases\\Purchase', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Purchases\\Purchases', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Roless\\Roles', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Roless\\Roless', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Rolesusuarioss\\Rolesusuarios', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Rolesusuarioss\\Rolesusuarioss', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Search\\Search', 'ACT', '2024-12-04 15:44:52'),
('SOP', 'Controllers\\Songauthorss\\Songauthors', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Songauthorss\\Songauthorss', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Songs\\Song', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Songs\\Songs', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Subscriptions\\Subscription', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Subscriptions\\Subscriptions', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Subscriptionusers\\Subscriptionuser', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Subscriptionusers\\Subscriptionusers', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Usuarios\\Usuario', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Usuarios\\Usuarios', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Videos\\Video', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Controllers\\Videos\\Videos', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'favorites_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'favorites_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'favorites_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'favorites_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'funciones_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'funciones_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'funciones_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'funciones_roles_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'funciones_roles_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'funciones_roles_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'funciones_roles_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'funciones_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'genre_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'genre_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'genre_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'genre_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'highligthsplaylist_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'highligthsplaylist_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'highligthsplaylist_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'highligthsplaylist_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'highligths_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'highligths_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'highligths_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'highligths_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'lognonuser_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'lognonuser_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'lognonuser_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'lognonuser_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'loguser_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'loguser_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'loguser_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'loguser_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'log_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'log_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'log_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'log_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'Menu_Album', 'ACT', '2024-12-04 15:44:50'),
('SOP', 'Menu_Artist', 'ACT', '2024-12-04 15:44:50'),
('SOP', 'Menu_Bitacora', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Carretilla', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Carretillaanon', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Favorites', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Funciones', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Funcionesroles', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Genre', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Highligths', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Highligthsplaylist', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Home', 'ACT', '2024-12-04 15:44:52'),
('SOP', 'Menu_Log', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Lognonuser', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Loguser', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Offer', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Offersubscription', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Playlist', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Playlistsongs', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Popularity', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Products', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Purchase', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Purchasedetail', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Roles', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Rolesusuarios', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Search', 'ACT', '2024-12-04 15:44:52'),
('SOP', 'Menu_Song', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Songauthors', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Subscription', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Subscriptionuser', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Usuario', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'Menu_Video', 'ACT', '2024-12-04 15:44:51'),
('SOP', 'offersubscription_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'offersubscription_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'offersubscription_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'offersubscription_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'offer_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'offer_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'offer_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'offer_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'playlistsongs_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'playlistsongs_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'playlistsongs_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'playlistsongs_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'playlist_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'playlist_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'playlist_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'playlist_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'popularity_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'popularity_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'popularity_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'popularity_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'products_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'products_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'products_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'products_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'purchasedetail_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'purchasedetail_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'purchasedetail_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'purchasedetail_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'purchase_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'purchase_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'purchase_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'purchase_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'roles_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'roles_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'roles_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'roles_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'roles_usuarios_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'roles_usuarios_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'roles_usuarios_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'roles_usuarios_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'songauthors_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'songauthors_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'songauthors_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'songauthors_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'song_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'song_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'song_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'song_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'subscriptionuser_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'subscriptionuser_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'subscriptionuser_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'subscriptionuser_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'subscription_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'subscription_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'subscription_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'subscription_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'usuario_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'usuario_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'usuario_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'usuario_UPD', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'video_DEL', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'video_DSP', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'video_INS', 'ACT', '2024-12-04 17:45:04'),
('SOP', 'video_UPD', 'ACT', '2024-12-04 17:45:04'),
('VEN', 'album_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'album_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'album_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'album_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'artist_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'artist_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'artist_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'artist_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'bitacora_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'bitacora_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'bitacora_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'bitacora_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'carretillaanon_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'carretillaanon_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'carretillaanon_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'carretillaanon_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'carretilla_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'carretilla_DSP', 'ACT', '2024-12-04 17:45:02');
INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`, `fnexp`) VALUES
('VEN', 'carretilla_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'carretilla_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'Controllers\\Albums\\Album', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Albums\\Albums', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Artists\\Artist', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Artists\\Artists', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Bitacoras\\Bitacora', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Bitacoras\\Bitacoras', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Carretillaanons\\Carretillaanon', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Carretillaanons\\Carretillaanons', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Carretillas\\Carretilla', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Carretillas\\Carretillas', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Favoritess\\Favorites', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Favoritess\\Favoritess', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Funcionesroless\\Funcionesroles', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Funcionesroless\\Funcionesroless', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Funcioness\\Funciones', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Funcioness\\Funcioness', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Genres\\Genre', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Genres\\Genres', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Highligthsplaylists\\Highligthsplaylist', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Highligthsplaylists\\Highligthsplaylists', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Highligthss\\Highligths', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Highligthss\\Highligthss', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Home\\Home', 'ACT', '2024-12-04 15:44:52'),
('VEN', 'Controllers\\Lognonusers\\Lognonuser', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Lognonusers\\Lognonusers', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Logs\\Log', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Logs\\Logs', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Logusers\\Loguser', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Logusers\\Logusers', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Offersubscriptions\\Offersubscription', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Offersubscriptions\\Offersubscriptions', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Offers\\Offer', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Offers\\Offers', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Playlistsongss\\Playlistsongs', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Playlistsongss\\Playlistsongss', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Playlists\\Playlist', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Playlists\\Playlists', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Popularitys\\Popularity', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Popularitys\\Popularitys', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Productss\\Products', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Productss\\Productss', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Purchasedetails\\Purchasedetail', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Purchasedetails\\Purchasedetails', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Purchases\\Purchase', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Purchases\\Purchases', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Roless\\Roles', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Roless\\Roless', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Rolesusuarioss\\Rolesusuarios', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Rolesusuarioss\\Rolesusuarioss', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Search\\Search', 'ACT', '2024-12-04 15:44:52'),
('VEN', 'Controllers\\Songauthorss\\Songauthors', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Songauthorss\\Songauthorss', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Songs\\Song', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Songs\\Songs', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Subscriptions\\Subscription', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Subscriptions\\Subscriptions', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Subscriptionusers\\Subscriptionuser', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Subscriptionusers\\Subscriptionusers', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Usuarios\\Usuario', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Usuarios\\Usuarios', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Videos\\Video', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Controllers\\Videos\\Videos', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'favorites_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'favorites_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'favorites_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'favorites_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'funciones_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'funciones_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'funciones_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'funciones_roles_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'funciones_roles_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'funciones_roles_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'funciones_roles_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'funciones_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'genre_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'genre_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'genre_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'genre_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'highligthsplaylist_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'highligthsplaylist_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'highligthsplaylist_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'highligthsplaylist_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'highligths_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'highligths_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'highligths_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'highligths_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'lognonuser_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'lognonuser_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'lognonuser_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'lognonuser_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'loguser_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'loguser_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'loguser_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'loguser_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'log_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'log_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'log_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'log_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'Menu_Album', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Artist', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Bitacora', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Carretilla', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Carretillaanon', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Favorites', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Funciones', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Funcionesroles', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Genre', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Highligths', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Highligthsplaylist', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Home', 'ACT', '2024-12-04 15:44:52'),
('VEN', 'Menu_Log', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Lognonuser', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Loguser', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Offer', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Offersubscription', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Playlist', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Playlistsongs', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Popularity', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Products', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Purchase', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Purchasedetail', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Roles', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Rolesusuarios', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Search', 'ACT', '2024-12-04 15:44:52'),
('VEN', 'Menu_Song', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Songauthors', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Subscription', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Subscriptionuser', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Usuario', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'Menu_Video', 'ACT', '2024-12-04 15:44:49'),
('VEN', 'offersubscription_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'offersubscription_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'offersubscription_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'offersubscription_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'offer_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'offer_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'offer_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'offer_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'playlistsongs_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'playlistsongs_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'playlistsongs_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'playlistsongs_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'playlist_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'playlist_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'playlist_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'playlist_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'popularity_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'popularity_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'popularity_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'popularity_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'products_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'products_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'products_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'products_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'purchasedetail_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'purchasedetail_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'purchasedetail_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'purchasedetail_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'purchase_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'purchase_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'purchase_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'purchase_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'roles_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'roles_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'roles_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'roles_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'roles_usuarios_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'roles_usuarios_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'roles_usuarios_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'roles_usuarios_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'songauthors_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'songauthors_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'songauthors_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'songauthors_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'song_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'song_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'song_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'song_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'subscriptionuser_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'subscriptionuser_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'subscriptionuser_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'subscriptionuser_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'subscription_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'subscription_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'subscription_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'subscription_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'usuario_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'usuario_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'usuario_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'usuario_UPD', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'video_DEL', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'video_DSP', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'video_INS', 'ACT', '2024-12-04 17:45:02'),
('VEN', 'video_UPD', 'ACT', '2024-12-04 17:45:02'),
('VIS', 'album_DEL', 'ACT', '2024-12-04 17:44:58'),
('VIS', 'album_DSP', 'ACT', '2024-12-04 17:44:58'),
('VIS', 'album_INS', 'ACT', '2024-12-04 17:44:58'),
('VIS', 'album_UPD', 'ACT', '2024-12-04 17:44:58'),
('VIS', 'artist_DEL', 'ACT', '2024-12-04 17:44:58'),
('VIS', 'artist_DSP', 'ACT', '2024-12-04 17:44:58'),
('VIS', 'artist_INS', 'ACT', '2024-12-04 17:44:58'),
('VIS', 'artist_UPD', 'ACT', '2024-12-04 17:44:58'),
('VIS', 'bitacora_DEL', 'ACT', '2024-12-04 17:44:58'),
('VIS', 'bitacora_DSP', 'ACT', '2024-12-04 17:44:58'),
('VIS', 'bitacora_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'bitacora_UPD', 'ACT', '2024-12-04 17:44:58'),
('VIS', 'carretillaanon_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'carretillaanon_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'carretillaanon_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'carretillaanon_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'carretilla_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'carretilla_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'carretilla_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'carretilla_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'Controllers\\Albums\\Album', 'ACT', '2024-12-04 15:44:45'),
('VIS', 'Controllers\\Albums\\Albums', 'ACT', '2024-12-04 15:44:45'),
('VIS', 'Controllers\\Artists\\Artist', 'ACT', '2024-12-04 15:44:45'),
('VIS', 'Controllers\\Artists\\Artists', 'ACT', '2024-12-04 15:44:45'),
('VIS', 'Controllers\\Bitacoras\\Bitacora', 'ACT', '2024-12-04 15:44:45'),
('VIS', 'Controllers\\Bitacoras\\Bitacoras', 'ACT', '2024-12-04 15:44:45'),
('VIS', 'Controllers\\Carretillaanons\\Carretillaanon', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Carretillaanons\\Carretillaanons', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Carretillas\\Carretilla', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Carretillas\\Carretillas', 'ACT', '2024-12-04 15:44:45'),
('VIS', 'Controllers\\Favoritess\\Favorites', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Favoritess\\Favoritess', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Funcionesroless\\Funcionesroles', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Funcionesroless\\Funcionesroless', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Funcioness\\Funciones', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Funcioness\\Funcioness', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Genres\\Genre', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Genres\\Genres', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Highligthsplaylists\\Highligthsplaylist', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Highligthsplaylists\\Highligthsplaylists', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Highligthss\\Highligths', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Highligthss\\Highligthss', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Home\\Home', 'ACT', '2024-12-04 15:44:52'),
('VIS', 'Controllers\\Lognonusers\\Lognonuser', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Lognonusers\\Lognonusers', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Logs\\Log', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Logs\\Logs', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Logusers\\Loguser', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Logusers\\Logusers', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Offersubscriptions\\Offersubscription', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Offersubscriptions\\Offersubscriptions', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Offers\\Offer', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Offers\\Offers', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Playlistsongss\\Playlistsongs', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Playlistsongss\\Playlistsongss', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Playlists\\Playlist', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Playlists\\Playlists', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Popularitys\\Popularity', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Popularitys\\Popularitys', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Productss\\Products', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Productss\\Productss', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Purchasedetails\\Purchasedetail', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Purchasedetails\\Purchasedetails', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Purchases\\Purchase', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Purchases\\Purchases', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Roless\\Roles', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Roless\\Roless', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Rolesusuarioss\\Rolesusuarios', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Rolesusuarioss\\Rolesusuarioss', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Search\\Search', 'ACT', '2024-12-04 15:44:52'),
('VIS', 'Controllers\\Songauthorss\\Songauthors', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Songauthorss\\Songauthorss', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Songs\\Song', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Songs\\Songs', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Subscriptions\\Subscription', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Subscriptions\\Subscriptions', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Subscriptionusers\\Subscriptionuser', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Subscriptionusers\\Subscriptionusers', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Usuarios\\Usuario', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Usuarios\\Usuarios', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Videos\\Video', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Controllers\\Videos\\Videos', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'favorites_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'favorites_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'favorites_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'favorites_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'funciones_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'funciones_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'funciones_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'funciones_roles_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'funciones_roles_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'funciones_roles_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'funciones_roles_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'funciones_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'genre_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'genre_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'genre_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'genre_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'highligthsplaylist_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'highligthsplaylist_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'highligthsplaylist_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'highligthsplaylist_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'highligths_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'highligths_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'highligths_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'highligths_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'lognonuser_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'lognonuser_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'lognonuser_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'lognonuser_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'loguser_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'loguser_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'loguser_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'loguser_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'log_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'log_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'log_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'log_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'Menu_Album', 'ACT', '2024-12-04 15:44:45'),
('VIS', 'Menu_Artist', 'ACT', '2024-12-04 15:44:45'),
('VIS', 'Menu_Bitacora', 'ACT', '2024-12-04 15:44:45'),
('VIS', 'Menu_Carretilla', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Carretillaanon', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Favorites', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Funciones', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Funcionesroles', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Genre', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Highligths', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Highligthsplaylist', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Home', 'ACT', '2024-12-04 15:44:52'),
('VIS', 'Menu_Log', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Lognonuser', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Loguser', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Offer', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Offersubscription', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Playlist', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Playlistsongs', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Popularity', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Products', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Purchase', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Purchasedetail', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Roles', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Rolesusuarios', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Search', 'ACT', '2024-12-04 15:44:52'),
('VIS', 'Menu_Song', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Songauthors', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Subscription', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Subscriptionuser', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Usuario', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'Menu_Video', 'ACT', '2024-12-04 15:44:46'),
('VIS', 'offersubscription_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'offersubscription_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'offersubscription_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'offersubscription_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'offer_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'offer_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'offer_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'offer_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'playlistsongs_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'playlistsongs_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'playlistsongs_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'playlistsongs_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'playlist_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'playlist_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'playlist_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'playlist_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'popularity_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'popularity_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'popularity_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'popularity_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'products_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'products_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'products_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'products_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'purchasedetail_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'purchasedetail_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'purchasedetail_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'purchasedetail_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'purchase_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'purchase_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'purchase_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'purchase_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'roles_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'roles_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'roles_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'roles_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'roles_usuarios_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'roles_usuarios_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'roles_usuarios_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'roles_usuarios_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'songauthors_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'songauthors_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'songauthors_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'songauthors_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'song_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'song_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'song_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'song_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'subscriptionuser_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'subscriptionuser_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'subscriptionuser_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'subscriptionuser_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'subscription_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'subscription_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'subscription_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'subscription_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'usuario_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'usuario_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'usuario_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'usuario_UPD', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'video_DEL', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'video_DSP', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'video_INS', 'ACT', '2024-12-04 17:44:59'),
('VIS', 'video_UPD', 'ACT', '2024-12-04 17:44:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genre`
--

CREATE TABLE `genre` (
  `id_genre` varchar(500) NOT NULL,
  `name_genre` varchar(255) DEFAULT NULL,
  `description_genre` varchar(255) DEFAULT NULL,
  `status_genre` varchar(5) DEFAULT NULL,
  `image_genre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `genre`
--

INSERT INTO `genre` (`id_genre`, `name_genre`, `description_genre`, `status_genre`, `image_genre`) VALUES
('2fba55be8ef4694e17f3d78725f2090623134a34fe4bb4751ce2081fe782a2b6', 'Funk', 'Genre with strong rhythmic groove', 'ACT', 'https://th.bing.com/th/id/R.e74b1a815aa80010384e6139b6c73f82?rik=ZJ4RWtdlqR3IXQ&riu=http%3a%2f%2fliveforlivemusic.com%2fwp-content%2fuploads%2f2016%2f12%2fGeorgeClinton-BootsyCollins.jpg&ehk=0Qg3t1C9REwU0ARydcXpUf1R8Yo%2bNQHlungbz%2f8fcXM%3d&risl=&pid=Img'),
('3e284681b6953703e69052e6b42f540f50b1a6e63adc85bd5888c6919fa9624b', 'Jazz', 'Genre known for improvisation and swing rhythms', 'ACT', 'https://th.bing.com/th/id/OIP.OcBZMYVUYlAdMX1xdg2dtgAAAA?rs=1&pid=ImgDetMain'),
('4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'Pop', 'Popular music genre with catchy melodies and references pop culture', 'ACT', 'https://i.pinimg.com/originals/8b/08/1a/8b081a52e157562bf4be31403caadbfb.jpg'),
('5550f80de667506a37a21ab31f601c8cf1d259c2759ff40d63ca92e7a3d446df', 'Classical', 'Music genre with symphonic compositions', 'ACT', 'https://th.bing.com/th/id/R.97ce002e17b57d93a83cf246b8154a5e?rik=%2f3a9In0fGq%2fsxg&pid=ImgRaw&r=0'),
('701d021d08c54579f23343581e45b65ffb1150b2c99f94352fdac4b7036dbbd5', 'Country', 'Music genre from rural America its lead by Taylor Swift', 'ACT', 'https://th.bing.com/th/id/OIF.TSBSQaXlfKLgstsgHWHxqg?rs=1&pid=ImgDetMain'),
('7b90ccc95230f095dd56b57ea9cbdd4f64bd33f5fde6968201bd551a97ba1460', 'Hip Hop', 'Urban music genre with rap and beats', 'ACT', 'https://th.bing.com/th/id/OIP.AEkjMBLqs3ukPUZi_KL_swHaE6?rs=1&pid=ImgDetMain'),
('a284c4f1684aadafdf8d50fc232d831882ee957473e148922bb59dba21b5967b', 'Electronic', 'Music genre using electronic instruments', 'ACT', 'https://th.bing.com/th/id/R.45cb0a3b583e8d342157611383cabee9?rik=6hqkpiqn4oX3vg&pid=ImgRaw&r=0'),
('a87be8077f00caa60dc4522640674d48d898fc6ad747513b137c8754800b5532', 'Blues', 'Genre rooted in African American history', 'ACT', 'https://th.bing.com/th/id/OIP.sV7oBSuCWo56BHAJzuNTHAHaE5?rs=1&pid=ImgDetMain'),
('c9608139ab383ee3ca9840ead670871389b53ff00b9cc54702c053a67dba5d78', 'Reggae', 'Music genre with origins in Jamaica', 'ACT', 'https://th.bing.com/th/id/R.fe5af5e43743fec45c5e41af78496b3f?rik=aVahkeZ6Utj1Mw&riu=http%3a%2f%2fcalcioclown.files.wordpress.com%2f2011%2f03%2fmarihuana.jpeg&ehk=DMoypxXOErjvltSiQPkydpF6L9NyfH3202rrihlDIIM%3d&risl=&pid=ImgRaw&r=0'),
('f302f0ea1db5df02bef4e6520435b493640eff8cf840ac709d6b5e5f746b3f76', 'Rock', 'Music genre focusing on guitars and drums', 'ACT', 'https://th.bing.com/th/id/R.e130a0cfac46c80d9b930a412aae4790?rik=5BlVN3w0%2bUrNtQ&pid=ImgRaw&r=0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `highligths`
--

CREATE TABLE `highligths` (
  `highligths_id` varchar(500) NOT NULL,
  `highligths_starts_at` datetime DEFAULT NULL,
  `highligths_ends_at` datetime DEFAULT NULL,
  `highligths_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `highligthsplaylist`
--

CREATE TABLE `highligthsplaylist` (
  `highligths_id` varchar(255) NOT NULL,
  `playlist_id` varchar(255) NOT NULL,
  `highligths_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `log_cod` varchar(100) DEFAULT NULL,
  `log_description` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `log`
--

INSERT INTO `log` (`log_cod`, `log_description`) VALUES
('INI', 'INICIO DE SESION'),
('FAL', 'FALLO DE SESION'),
('CON', 'CONTRASEÑA INCORRECT'),
('CNA', 'Correo no tiene el f'),
('NPA', '¡Debe ingresar una c'),
('CI', 'CREDENCIAS INCORRECT'),
('DES', 'CUENTA NO ACTIVA'),
('COR', 'INTENTO INGRESAR COR'),
('LGO', 'CERRÓ SESION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lognonuser`
--

CREATE TABLE `lognonuser` (
  `id_logNonUser` varchar(500) NOT NULL,
  `log_date` datetime NOT NULL,
  `id_cookie` varchar(100) DEFAULT NULL,
  `log_cod` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `lognonuser`
--

INSERT INTO `lognonuser` (`id_logNonUser`, `log_date`, `id_cookie`, `log_cod`) VALUES
('id45ba160c7df400d96b1f6d2a7ed67927b97fa8e19dc31cd5f1af3c8f740a094c4c782337656466be3a0ef6a0e7329a031d3e702e0fcd208cfbc442f8bf50208b1010id', '2023-12-05 10:10:20', 'COOKIE45ba160c7df400d96b1f6d2a7ed67927b97fa8e19dc31cd5f1af3c8f740a094c4c782337656466be3a0ef6a0e7329a', 'CI'),
('id8c875bf62ac01cb650c1652a715cc36aab13b82e1de2979d680cd7f3b307080e3d6a6e39f9f8bc49578cf98c105863ccaf11aa9fbb95c7f43863a8fcb742ee130049id', '2023-12-05 00:49:00', 'COOKIE8c875bf62ac01cb650c1652a715cc36aab13b82e1de2979d680cd7f3b307080e3d6a6e39f9f8bc49578cf98c105863', 'CNA'),
('ide709efd521535d9e0dedd3532a760210e2e140e51635af4423ea478214d055aff5f32f2a1e7bfda598f48767fa1a0614e9e18a73d6e7534af82b52e8e448a1d30048id', '2023-12-05 00:48:56', 'COOKIEe709efd521535d9e0dedd3532a760210e2e140e51635af4423ea478214d055aff5f32f2a1e7bfda598f48767fa1a06', 'CNA'),
('idf6bc26e7871e88731e0c64fe910d2689162e598ac81f2e28c7fa8cfeb6f9f33a238e8b081560633d84d20f80e09a3c395bbf9054e185a67b85a5e5bf4953de741010id', '2023-12-05 10:10:27', 'COOKIEf6bc26e7871e88731e0c64fe910d2689162e598ac81f2e28c7fa8cfeb6f9f33a238e8b081560633d84d20f80e09a3c', 'CI'),
('idffd542c84ca9ffd721f6296739f62f6e51ebadacf147f6984f23de5fb3adb890c700ad1477af079b221d24f64a47ca09c7b0f7d52b784aaa6e7621acefbb0de30049id', '2023-12-05 00:49:09', 'COOKIEffd542c84ca9ffd721f6296739f62f6e51ebadacf147f6984f23de5fb3adb890c700ad1477af079b221d24f64a47ca', 'CI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loguser`
--

CREATE TABLE `loguser` (
  `user_cod` bigint(20) NOT NULL,
  `log_cod` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `loguser`
--

INSERT INTO `loguser` (`user_cod`, `log_cod`, `date`) VALUES
(0, 'INI', '2023-12-05 14:33:21'),
(0, 'LGO', '2023-12-05 21:38:04'),
(0, 'INI', '2023-12-05 21:38:10'),
(0, 'LGO', '2023-12-05 22:48:14'),
(0, 'INI', '2023-12-05 22:48:20'),
(0, 'LGO', '2023-12-06 00:20:18'),
(0, 'INI', '2023-12-06 00:23:19'),
(0, 'LGO', '2023-12-06 16:10:13'),
(0, 'INI', '2023-12-06 16:11:02'),
(0, 'LGO', '2023-12-06 16:24:10'),
(0, 'LGO', '2023-12-06 16:28:54'),
(0, 'INI', '2023-12-06 16:28:59'),
(0, 'LGO', '2023-12-06 22:21:40'),
(0, 'INI', '2023-12-06 22:21:48'),
(0, 'LGO', '2023-12-07 09:43:37'),
(0, 'INI', '2023-12-07 09:43:43'),
(0, 'LGO', '2023-12-07 10:09:06'),
(0, 'INI', '2023-12-07 10:09:11'),
(0, 'LGO', '2023-12-07 10:16:58'),
(0, 'LGO', '2023-12-07 10:24:34'),
(0, 'INI', '2023-12-07 10:24:40'),
(0, 'INI', '2023-12-07 10:52:09'),
(0, 'INI', '2023-12-07 11:09:16'),
(0, 'INI', '2023-12-07 11:19:03'),
(0, 'INI', '2023-12-07 11:33:40'),
(0, 'INI', '2023-12-07 11:37:48'),
(0, 'INI', '2023-12-07 11:42:49'),
(0, 'LGO', '2023-12-07 12:57:44'),
(0, 'INI', '2023-12-07 12:57:50'),
(0, 'INI', '2023-12-07 13:05:12'),
(0, 'INI', '2023-12-07 13:16:54'),
(0, 'INI', '2023-12-07 13:17:48'),
(0, 'LGO', '2023-12-07 15:12:50'),
(0, 'INI', '2023-12-07 15:13:45'),
(0, 'INI', '2023-12-07 16:33:50'),
(0, 'LGO', '2023-12-07 16:33:52'),
(0, 'INI', '2023-12-07 16:50:01'),
(0, 'LGO', '2023-12-07 16:54:26'),
(0, 'INI', '2023-12-07 16:59:00'),
(0, 'INI', '2023-12-07 18:05:19'),
(0, 'LGO', '2023-12-07 18:12:48'),
(0, 'INI', '2023-12-07 18:13:40'),
(0, 'LGO', '2023-12-07 18:13:48'),
(3, 'INI', '2023-12-05 00:55:07'),
(3, 'INI', '2023-12-05 01:14:18'),
(3, 'INI', '2023-12-05 09:56:14'),
(3, 'INI', '2023-12-05 09:57:04'),
(3, 'INI', '2023-12-05 09:57:45'),
(3, 'INI', '2023-12-05 09:59:19'),
(3, 'INI', '2023-12-05 10:00:44'),
(3, 'INI', '2023-12-05 10:01:20'),
(3, 'INI', '2023-12-05 10:02:45'),
(3, 'INI', '2023-12-05 10:04:25'),
(3, 'LGO', '2023-12-05 10:05:25'),
(3, 'INI', '2023-12-05 10:05:34'),
(3, 'LGO', '2023-12-05 10:05:37'),
(6353, 'INI', '2023-12-05 10:08:26'),
(6353, 'LGO', '2023-12-05 10:08:28'),
(6353, 'INI', '2023-12-05 10:10:39'),
(6353, 'LGO', '2023-12-05 10:11:21'),
(9735, 'INI', '2023-12-05 10:11:41'),
(9735, 'LGO', '2023-12-05 13:31:03'),
(9735, 'INI', '2023-12-05 13:31:08'),
(9735, 'LGO', '2023-12-05 13:45:25'),
(9735, 'INI', '2023-12-05 13:45:57'),
(9735, 'LGO', '2023-12-05 13:50:51'),
(9735, 'INI', '2023-12-05 13:52:08'),
(9735, 'LGO', '2023-12-05 13:52:13'),
(9735, 'INI', '2023-12-05 13:54:15'),
(9735, 'LGO', '2023-12-05 14:19:02'),
(9735, 'INI', '2023-12-05 14:20:31'),
(9735, 'LGO', '2023-12-05 14:32:52'),
(9735, 'INI', '2023-12-07 10:17:06'),
(9735, 'INI', '2023-12-07 18:14:14'),
(626827, 'INI', '2023-12-07 18:13:58'),
(626827, 'LGO', '2023-12-07 18:14:03'),
(9223372036854775807, 'INI', '2023-12-05 00:32:03'),
(9223372036854775807, 'INI', '2023-12-05 00:51:56'),
(9223372036854775807, 'INI', '2023-12-05 00:52:05'),
(9223372036854775807, 'INI', '2023-12-05 10:05:50'),
(9223372036854775807, 'LGO', '2023-12-05 10:05:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `offer`
--

CREATE TABLE `offer` (
  `id_offer` varchar(500) NOT NULL,
  `offer_description` varchar(500) DEFAULT NULL,
  `offer_starts_at` datetime DEFAULT NULL,
  `offer_ends_at` datetime DEFAULT NULL,
  `offer_status` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `offersubscription`
--

CREATE TABLE `offersubscription` (
  `id_offer` varchar(255) NOT NULL,
  `id_subscription` varchar(255) NOT NULL,
  `price_offer` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist`
--

CREATE TABLE `playlist` (
  `id_playlist` varchar(500) NOT NULL,
  `playlist_name` varchar(100) DEFAULT NULL,
  `playlist_description` varchar(100) DEFAULT NULL,
  `playlist_image` varchar(100) DEFAULT NULL,
  `playlist_create_at` datetime DEFAULT NULL,
  `playlist_status` varchar(5) DEFAULT NULL,
  `usercod` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlistsongs`
--

CREATE TABLE `playlistsongs` (
  `playlist_id` varchar(255) NOT NULL,
  `song_id` varchar(255) DEFAULT NULL,
  `playlistSong_added_at` datetime DEFAULT NULL,
  `playlistSong_status` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `popularity`
--

CREATE TABLE `popularity` (
  `id_popularity` varchar(255) NOT NULL,
  `id_object` varchar(255) NOT NULL,
  `dislike_count` double DEFAULT NULL,
  `like_count` double DEFAULT NULL,
  `percent_dislike` decimal(12,2) DEFAULT NULL,
  `percent_like` decimal(12,2) DEFAULT NULL,
  `type_object` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `productId` bigint(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productDescription` text NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productImgUrl` varchar(255) NOT NULL,
  `productStock` int(11) NOT NULL DEFAULT 0,
  `productStatus` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStock`, `productStatus`) VALUES
(2, 'Shawn Mendes Merch', 'Merchandise related to Shawn Mendes', 19.99, 'https://th.bing.com/th/id/OIP._ZMTM-synaaVZE9CaLkSfAHaHa?rs=1&pid=ImgDetMain.jpg', 45, 'ACT'),
(11, 'Ariana Grande Sweetener Deluxe Edition', 'Concert featuring Ariana Grande', 59.99, 'https://ae01.alicdn.com/kf/HTB1j4HHjbZnBKNjSZFhq6A.oXXae/TX065-Hot-New-Ariana-Grande-Sweetener-Album-2018-Cover-Music-Star-24x24-A3-A4-Poster-Art.jpg_640x640.jpg', 100, 'ACT'),
(222, 'Selena Gomez Merch', 'Merchandise related to Selena Gomez', 29.99, 'https://th.bing.com/th/id/R.00a36a23eff4dd86eb30758633d80089?rik=j4hhBjBT3VHPKA&pid=ImgRaw&r=0', 50, 'ACT'),
(82392, 'Ticket For Madonna World Tour', 'Madonna World Tour', 99.99, 'https://hdmusic.cc/uploads/posts/2019-11/1573645794_1514713173_folder.jpg', 100, 'ACT'),
(222323, 'Justin Bieber Tshirt', 'Concert featuring Justin Bieber', 79.99, 'https://ae01.alicdn.com/kf/HTB1tsoFbo_rK1Rjy0Fcq6zEvVXaf/Justin-Bieber-Fashion-Sports-Hip-Hop-3d-T-Shirts-Couple-Men-Women-T-shirt-Casual-Short.jpg', 75, 'ACT'),
(232324, 'Taylor Swift Merch', 'Merchandise related to Taylor Swift', 39.99, 'https://i.pinimg.com/originals/60/d9/cf/60d9cfc646881a1ceb3e70d67856934f.png', 80, 'ACT'),
(1212212, 'Beyoncé Formation World Tour DVD Set', 'DVD set featuring Beyoncé live in her Formation World Tour', 39.99, 'https://i.pinimg.com/originals/43/c5/10/43c5106da61768929f31d17333caafec.jpg', 120, 'ACT'),
(2324423, 'Lady Gaga Concert Shangai', 'Concert featuring Lady Gaga', 69.99, 'https://th.bing.com/th/id/R.0902814f2ccf03a7c99c800ac022766d?rik=f8ELSx3Yms3ZqQ&pid=ImgRaw&r=0', 95, 'ACT'),
(3456934, 'Post Malone LA Concert', 'Merchandise related to Post Malone', 34.99, 'https://www.musik-sammler.de/cover/1467500/1467499_1593264166.jpg', 55, 'ACT'),
(6343624, 'Ed Sheeran TSHIRT', 'Merchandise related to Ed Sheeran', 49.99, 'https://media.customon.com/unsafe/1200x1200/img.customon.com/img/10496446/32988,20,0,0,22,166.79415855355,225,41.602920723227,0,ef1c824045abde10c29dc76bb855fc35/merchantimagenew/ed-sheeran-toddler-t-shirt-green.jpg', 60, 'ACT'),
(6454645, 'Dua Lipa Future Nostalgia', 'Vinyl featuring Dua Lipa', 74.99, 'https://img.tmstor.es/tmmusic/61929-23f169a9903c4e39fe2d319e65b4841e.jpg', 110, 'ACT'),
(6473423, 'Ariana Grande Sweetener World Tour', 'Live concert tour featuring Ariana Grande in NYC', 99.99, 'https://i5.walmartimages.com/asr/4477b2b4-81f9-435e-8b94-ff19710c67ed_1.f1a895de8d4d230af12b871b351877c5.jpeg', 200, 'ACT'),
(23255624, 'Beyonce Concert', 'Concert featuring Beyonce', 89.99, 'https://th.bing.com/th/id/R.2e279c9234b55dcd432d190611c4b9ec?rik=qrATDUMpFsG05g&riu=http%3a%2f%2fi1.cdnds.net%2f13%2f50%2f618x800%2fmusic-beyonce-mrs-carter-world-tour-2014-poster.jpg&ehk=EW9smZC%2ffyAad6sgMbN8ehu2flHc%2fMr4kVI0O8Dtsek%3d&risl=&pid=ImgRaw', 120, 'ACT'),
(34367763, 'Dua Lipa Future Nostalgia Live CD', 'Live CD of Dua Lipa Future Nostalgia Tour', 19.99, 'https://th.bing.com/th/id/R.497702813a8e50000c4284b087e8a122?rik=2cApMvT6%2fnUB5g&pid=ImgRaw&r=0', 200, 'ACT'),
(35343434, 'Selena Gomez Rare Beauty Gift Set', 'Limited edition merchandise from Selena Gomez Rare Beauty collection', 49.99, 'https://www.sephora.es/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw42585f5f/images/hi-res/SKU/SKU_2383/550124_swatch.jpg', 200, 'ACT'),
(334130637, 'Paradise Edition', 'Lana Del Rey album - Paradise Edition', 399.99, 'https://th.bing.com/th/id/R.e9291d327d0b03c3df3380946fbfc37e?rik=NFcElVMwg8Yy3g&riu=http%3a%2f%2fcdn1.umg3.net%2f89%2ffiles%2f2014%2f06%2fLana-Del-Rey-Born-To-Die-Paradise-Edition-1500x1500-2012.png&ehk=g%2fgnP8d67UddtLVKY1bMja8%2bw07Fc3enG81kNzZwaxI%3d&r', 100, 'ACT'),
(678232323, 'Taylor Swift Folklore Album Vinyl', 'Limited edition vinyl record of Taylor Swift Folklore album', 29.99, 'https://i.pinimg.com/originals/25/4a/b2/254ab233d604c9918bf84b3ca825ca09.jpg', 80, 'ACT'),
(1014467096, 'Cry Baby', 'Melanie Martinez album - Cry Baby', 123.99, 'https://th.bing.com/th/id/OIP._QvEReXdOlGvJ_Bt01bv6AHaHY?rs=1&pid=ImgDetMain', 100, 'ACT'),
(1100869934, 'Wonderstruck', 'Taylor Swift perfume - Wonderstruck', 23.99, 'https://cdn.shopify.com/s/files/1/1180/3624/products/ae70c263b13d0c250455fe042da9c80b.jpeg?v=1618378530', 100, 'ACT'),
(2594922047, 'Light Stick', 'Blackpink merchandise - Light Stick', 234.90, 'https://cf.shopee.ph/file/870265f8eaa166b2568025e64369b686', 100, 'ACT'),
(3179506308, 'Miau Miau', 'Katy Perry perfume - Miau Miau', 13.99, 'https://i.pinimg.com/originals/3d/9b/db/3d9bdb0776a0245e18ed934ec0526e65.jpg', 100, 'ACT'),
(3436091619, 'Born This Way', 'Lady Gaga album - Born This Way', 150.99, 'https://th.bing.com/th/id/R.2dc2213aa7f2490c92a78e23de51872d?rik=sDUN3UU7HrPC%2bA&riu=http%3a%2f%2fi.huffpost.com%2fgen%2f267717%2fLADY-GAGA-BORN-THIS-WAY.jpg&ehk=rKkmboEfDpJxh7K81dnM5l2Fd2c5bckIsCOd2EyoyEw%3d&risl=&pid=ImgRaw&r=0', 100, 'ACT'),
(3552062132, 'TShirt', 'Lana Del Rey merchandise - TShirt', 23.99, 'https://cdn.shopify.com/s/files/1/0196/6479/7760/products/lana-del-rey-vintage-unisex-t-shirt-126241.jpg?v=1582295701', 100, 'ACT'),
(4069943878, 'K12', 'Melanie Martinez album - K12', 123.99, 'https://th.bing.com/th/id/OIP.7aQervkhKL_mPuFMIeQFgAHaHa?rs=1&pid=ImgDetMain', 100, 'ACT'),
(4321760725, 'MDNA WORLD SHANGHAI TICKET', 'Madonna concert ticket - MDNA WORLD SHANGHAI', 99.99, 'https://hdmusic.cc/uploads/posts/2019-11/1573645794_1514713173_folder.jpg', 100, 'ACT'),
(4546452323, 'Justin Bieber Purpose Tour Hoodie', 'Official merchandise from Justin Bieber Purpose Tour', 69.99, 'https://mir-s3-cdn-cf.behance.net/project_modules/disp/22b5ed36308611.5717421e1f523.jpg', 150, 'ACT'),
(5163857354, 'The Fame Signed', 'Lady Gaga album - The Fame Signed', 599.99, 'https://th.bing.com/th/id/R.eb6c4fc16c3c2519ea6703163fa3d66e?rik=2zruDU0kOF33AA&pid=ImgRaw&r=0', 100, 'ACT'),
(5369067718, 'Chromatica Ultra Deluxe', 'Lady Gaga album - Chromatica Ultra Deluxe', 99.99, 'https://th.bing.com/th/id/OIP.GRvuOiEQZrapGxSqdN0DvgHaHa?rs=1&pid=ImgDetMain', 100, 'ACT'),
(5483961641, 'MDNA WORLD PARIS TICKET', 'Madonna concert ticket - MDNA WORLD PARIS', 99.99, 'https://hdmusic.cc/uploads/posts/2019-11/1573645794_1514713173_folder.jpg', 100, 'ACT'),
(5808726778, 'Sweet Like Candy', 'Ariana Grande perfume - Sweet Like Candy', 123.99, 'https://th.bing.com/th/id/OIP.tVd4cxHx03tTfAc3ZlBM_QHaHa?rs=1&pid=ImgDetMain', 100, 'ACT'),
(6670186767, 'Rare Beauty Foundation', 'Selena Gomez makeup - Rare Beauty Foundation', 23.99, 'https://media.glamour.com/photos/5f62980d0fedb1c968fdacf4/1:1/w_2560%2Cc_limit/rare%252520beauty%252520highlighter%252520.png', 100, 'ACT'),
(7306318410, 'Portals', 'Melanie Martinez album - Portals', 123.99, 'https://th.bing.com/th/id/OIP.Q81yghKi4zMC6QysLdsQ5QHaHa?rs=1&pid=ImgDetMain', 100, 'ACT'),
(7441614556, 'REM FRAGANCE', 'Ariana Grande perfume - REM FRAGANCE', 123.99, 'https://th.bing.com/th/id/R.0348c6ba7417fbccc24b52cd73623ae9?rik=KMUpO5FaVpaTjA&pid=ImgRaw&r=0', 100, 'ACT'),
(8350262407, 'MDNA WORLD NYC TICKET', 'Madonna concert ticket - MDNA WORLD NYC', 99.99, 'https://hdmusic.cc/uploads/posts/2019-11/1573645794_1514713173_folder.jpg', 100, 'ACT'),
(9395692264, 'Trilogy', 'The Weeknd album - Trilogy', 299.99, 'https://i.pinimg.com/originals/1d/fa/d4/1dfad41d84c92d84077335e835b66bae.jpg', 100, 'ACT'),
(9689848702, 'MDNA WORLD BERLIN TICKET', 'Madonna concert ticket - MDNA WORLD BERLIN', 99.99, 'https://hdmusic.cc/uploads/posts/2019-11/1573645794_1514713173_folder.jpg', 100, 'ACT'),
(23452346878, 'Post Malone Hollywoods Bleeding Album Poster', 'Exclusive poster from Post Malone Hollywoods Bleeding album', 9.99, 'https://th.bing.com/th/id/R.d85e78019e2214c5f41846625acf8437?rik=Be2Nnzgg6g1oxg&pid=ImgRaw&r=0', 300, 'ACT'),
(232324232567, 'Shawn Mendes Signature Perfume', 'Exclusive perfume by Shawn Mendes with his signature scent', 79.99, 'https://www.parfimo.gr/data/cache/thumb_min500_max1000-min500_max1000-12/products/915240/1604302660/shawn-mendes-signature-eau-de-parfum-50-ml-336844.jpg', 70, 'ACT'),
(343672342326, 'Ed Sheeran Divide Tour T-shirt', 'Official T-shirt from Ed Sheeran Divide Tour', 34.99, 'https://dx72k0ec4onep.cloudfront.net/product/2702/1064104/NJYAXH-1500382474-1280x1280-ed-tiedye-1000.jpg', 110, 'ACT'),
(356899565344, 'Lady Gaga Enigma Live in Las Vegas', 'Live concert experience of Lady Gaga Enigma show in Las Vegas', 129.99, 'https://i.pinimg.com/originals/b1/31/c7/b131c74dcf847065a82039e3397b6ed4.jpg', 90, 'ACT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase`
--

CREATE TABLE `purchase` (
  `id_purchase` varchar(450) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `details` varchar(450) DEFAULT NULL,
  `payments` mediumtext DEFAULT NULL,
  `usercod` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `purchase`
--

INSERT INTO `purchase` (`id_purchase`, `purchase_date`, `total`, `details`, `payments`, `usercod`) VALUES
('085775179e5732d62264d1f96009fbe764c170a4d1b66ff974ef44b1a60e498011bf3d460490488606aaaaa1729a33e8b58ef75dd0766f86b7d81f76aa772ca31348purchase', '0000-00-00', 69.99, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"6YM41665K2167334K\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691978473\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"5PA54776TW989162U\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"80.49\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"80.49\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"4.24\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"76.25\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/5PA54776TW989162U\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/5PA54776TW989162U\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/6YM41665K2167334K\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T19:48:03Z\",\n                            \"update_time\": \"2023-12-07T19:48:03Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/6YM41665K2167334K\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1664\",\n        \"date\": \"Thu, 07 Dec 2023 19\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"df07631a883dc\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000df07631a883dc-0097fae5ba3f5d97-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('27188d08377664a53809e576e02742d2bed5b2b9e9933028e9a699e7adcc5b7f34c90825fc396d5e07086ea9e6060815c0f5894eeaa98e9af00a88125b3995931439purchase', '0000-00-00', 149.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"7RJ76888FL7266836\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691981588\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"9A649600KU8211206\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"172.48\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"172.48\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"8.75\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"163.73\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/9A649600KU8211206\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/9A649600KU8211206\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/7RJ76888FL7266836\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:39:57Z\",\n                            \"update_time\": \"2023-12-07T20:39:57Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/7RJ76888FL7266836\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"e03ba0fc90aad\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000e03ba0fc90aad-88928f8bba01567c-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('31fe036f3fe68a776acccf77204a0caef95beed67a002c33c0a2558002278ce35416ddac1fdcdc952493815fab80a60744dbbefe760f7e0be9c7f2ce1d2b5e921651purchase', '0000-00-00', 149.96, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"2L283350FU9767613\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691989483\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"7WA69470C54135533\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"172.46\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"172.46\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"8.75\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"163.71\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/7WA69470C54135533\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/7WA69470C54135533\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/2L283350FU9767613\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T22:51:50Z\",\n                            \"update_time\": \"2023-12-07T22:51:50Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/2L283350FU9767613\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 22\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"a7dc8fd562b3d\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000a7dc8fd562b3d-13948fbfbd71ba89-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('362241bc4665999d784797cfb04c5a1781d73d61dea013b8e794157b3de775228ce24828a08263bda7e3c4e0353d7696c7bc75f00ee3ee4515f47fc50bd881d31443purchase', '0000-00-00', 99.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"7F682089UW4975644\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691981802\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"6TD33338D9734812T\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"114.98\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"114.98\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"5.93\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"109.05\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/6TD33338D9734812T\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/6TD33338D9734812T\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/7F682089UW4975644\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:43:32Z\",\n                            \"update_time\": \"2023-12-07T20:43:32Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/7F682089UW4975644\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"d34da28672280\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000d34da28672280-72d053446fe21328-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('370b89c80d38d1608b38dc31e6a116512dfaadc1c7ba523863ba24f5ac946ac2b28264d7922f9baa7ad03957a4bf9514fa03f7cebb16e1e0c66ebcc383541f0b1345purchase', '0000-00-00', 29.99, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"1XG03846075426529\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691978309\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"1N903885F0727653K\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"34.49\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"34.49\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"1.99\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"32.50\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/1N903885F0727653K\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/1N903885F0727653K\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/1XG03846075426529\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T19:45:21Z\",\n                            \"update_time\": \"2023-12-07T19:45:21Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/1XG03846075426529\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1664\",\n        \"date\": \"Thu, 07 Dec 2023 19\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"0b45818c1e331\",\n        \"server-timing\": \"traceparent;desc=\\\"00-00000000000000000000b45818c1e331-f525e11675a13642-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('37273669936ffc3e79176b678eca4ddec1104787a772bc43812cb5fbc29b810a27f17e7adb59e524149b514c5dd40d2472234e678747d07c99959007363b2e7c1339purchase', '0000-00-00', 19.99, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"7LJ51099NH583031P\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691977984\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"5F535331G01840145\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"22.99\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"22.99\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"1.43\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"21.56\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/5F535331G01840145\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/5F535331G01840145\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/7LJ51099NH583031P\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T19:39:54Z\",\n                            \"update_time\": \"2023-12-07T19:39:54Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/7LJ51099NH583031P\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1664\",\n        \"date\": \"Thu, 07 Dec 2023 19\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"fee79c2c61a4f\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000fee79c2c61a4f-33887b62388ed8b3-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('487e45bbda9ec405a78827e1d51b61e8654d4eb37abc934aa81bda93b1c30c7643c4b6b0370f26b584fdb98c3dfec3dde07c8e673e9d052bb61cc272fc2cc2ff1501purchase', '0000-00-00', 49.99, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"84V13797U5958205N\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691982903\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"58H127258J0651812\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"57.49\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"57.49\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"3.12\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"54.37\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/58H127258J0651812\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/58H127258J0651812\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/84V13797U5958205N\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T21:01:52Z\",\n                            \"update_time\": \"2023-12-07T21:01:52Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/84V13797U5958205N\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1664\",\n        \"date\": \"Thu, 07 Dec 2023 21\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"b8c71a4afa73e\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000b8c71a4afa73e-be4b1dc375b59194-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('58458193fc6a82ae75e2abcbb0cd719555670a8aba1af8517cb7b7c08bd6a4bb2ad41fa5f6e10953af831eabfca4ed58fe413e4286e167bdf560ed28683b87781431purchase', '0000-00-00', 149.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"5EK06731SM706130B\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691981044\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"477276265D327484U\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"172.48\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"172.48\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"8.75\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"163.73\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/477276265D327484U\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/477276265D327484U\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/5EK06731SM706130B\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:31:07Z\",\n                            \"update_time\": \"2023-12-07T20:31:07Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/5EK06731SM706130B\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"6759e401d7dac\",\n        \"server-timing\": \"traceparent;desc=\\\"00-00000000000000000006759e401d7dac-720e7aecdf563764-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764');
INSERT INTO `purchase` (`id_purchase`, `purchase_date`, `total`, `details`, `payments`, `usercod`) VALUES
('645a336413d8121838e08929f62ea297d4fe888622b3d38a10565901952badfd98ef9cfd74e44db716628e68a76c8565ccd0b39e4ba96f2b5167e4aaa65c4e631807purchase', '0000-00-00', 283.96, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"0XJ88879GB715021L\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691994013\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"9C767897FG268135Y\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"326.56\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"326.56\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"16.30\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"310.26\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/9C767897FG268135Y\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/9C767897FG268135Y\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/0XJ88879GB715021L\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-08T00:07:27Z\",\n                            \"update_time\": \"2023-12-08T00:07:27Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/0XJ88879GB715021L\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1668\",\n        \"date\": \"Fri, 08 Dec 2023 00\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"14c502f513c23\",\n        \"server-timing\": \"traceparent;desc=\\\"00-000000000000000000014c502f513c23-a502915ea084936b-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'e5ac4f8c46a9cefbbe2640c8a35acc8f1b74a0b321e73ec8076b62b53857a80f'),
('6fddead054589ff0b6000fba77def147302dbb9521fb705c9f2548d2c55897e1c9121bf32809339cdb93b36a91013db2f93e2af1ca2259f56ef050906c44fe401509purchase', '0000-00-00', 49.99, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"5RB00313SF3839234\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691983380\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"52K93719K52760347\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"57.49\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"57.49\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"3.12\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"54.37\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/52K93719K52760347\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/52K93719K52760347\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/5RB00313SF3839234\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T21:09:52Z\",\n                            \"update_time\": \"2023-12-07T21:09:52Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/5RB00313SF3839234\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1664\",\n        \"date\": \"Thu, 07 Dec 2023 21\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"036609ee4d701\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000036609ee4d701-ab69c2459ff31cbe-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('7765fdc48daa05bd310650077c228a060c0be5db1bac0faba0a68704b7d2f9730e686ceaf31a7b47496e789b467d18635bbf5ad5c510cb278a659c1052846cb41457purchase', '0000-00-00', 109.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"83F93442KY117844B\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691982621\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"578818511G718582D\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"126.48\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"126.48\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"6.50\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"119.98\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/578818511G718582D\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/578818511G718582D\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/83F93442KY117844B\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:57:10Z\",\n                            \"update_time\": \"2023-12-07T20:57:10Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/83F93442KY117844B\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"337133862f68c\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000337133862f68c-d44d0e286db0ee89-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('825fe79a463957ebbef6bff5cb60aa35567f7b4441c54710ebbf638377b70a1f31c640e5c9e2aa8f560369c8033a276d7696b4ce979848c8823812eded378ca21458purchase', '0000-00-00', 109.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"36S12335V5662834V\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691982716\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"56306315RU4097338\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"126.48\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"126.48\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"6.50\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"119.98\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/56306315RU4097338\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/56306315RU4097338\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/36S12335V5662834V\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:58:46Z\",\n                            \"update_time\": \"2023-12-07T20:58:46Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/36S12335V5662834V\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"16941392bb576\",\n        \"server-timing\": \"traceparent;desc=\\\"00-000000000000000000016941392bb576-6d5f4d17018c05bd-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('827bsbml22mmlzxHMNSOn19384n,xiwsw', '2023-12-07', 200.00, 'Bought a lot', 'This is an example', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('83286ee5605bad7eb14138df6507862245ef92c2eb47e1e9f1b25543e66ddc4ecf1e7ce768cb46329bf601f96b14a0ff9c410c237c5744da2a21397d503b319d1512purchase', '0000-00-00', 49.99, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"135322260E839800X\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691983543\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"7US20534H06117354\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"57.49\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"57.49\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"3.12\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"54.37\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/7US20534H06117354\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/7US20534H06117354\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/135322260E839800X\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T21:12:33Z\",\n                            \"update_time\": \"2023-12-07T21:12:33Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/135322260E839800X\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1664\",\n        \"date\": \"Thu, 07 Dec 2023 21\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"6348b071e2097\",\n        \"server-timing\": \"traceparent;desc=\\\"00-00000000000000000006348b071e2097-bcae1f7bb70902d5-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('84b2e58cb9fe403e4526b90c32b23968d301e2e1af0ce8bef8f82c282cb17330da7967bdd0e7f3792dc883eeee4f3148d47d6bbb8831edc76025659ad8c7ba341437purchase', '0000-00-00', 149.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"6A5704222S767115E\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691981447\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"36374468FT348194F\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"172.48\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"172.48\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"8.75\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"163.73\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/36374468FT348194F\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/36374468FT348194F\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/6A5704222S767115E\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:37:36Z\",\n                            \"update_time\": \"2023-12-07T20:37:36Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/6A5704222S767115E\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"743cea41fe2e3\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000743cea41fe2e3-d703c85d47795ca3-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('89b6a24ba22f7c2ebb65dd107593c2e4c77562cfe07ffc1a896278cde2970cff5f054590b84e3a7a0e480e871d9cfe0f28e041b39c5343750f24cf8b12a8604a1349purchase', '0000-00-00', 159.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"1U0775450X629471R\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691978530\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"9PX67187BT042583U\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"183.98\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"183.98\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"9.32\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"174.66\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/9PX67187BT042583U\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/9PX67187BT042583U\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/1U0775450X629471R\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T19:49:01Z\",\n                            \"update_time\": \"2023-12-07T19:49:01Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/1U0775450X629471R\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 19\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"9700753197bbb\",\n        \"server-timing\": \"traceparent;desc=\\\"00-00000000000000000009700753197bbb-a4938e54bd2071cc-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('8f26508f74dac515755812bc401a0b12b41029d32887ef910b3af6bd47dccebca74c62ac0566828c96cf44f55d1ae723aac2cf0bab596bf9e0d524c3bc34bc541508purchase', '0000-00-00', 59.99, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"06N37543127220437\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691983324\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"07399703Y05551514\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"68.99\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"68.99\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"3.68\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"65.31\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/07399703Y05551514\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/07399703Y05551514\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/06N37543127220437\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T21:08:53Z\",\n                            \"update_time\": \"2023-12-07T21:08:53Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/06N37543127220437\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1664\",\n        \"date\": \"Thu, 07 Dec 2023 21\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"fb7eae61294db\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000fb7eae61294db-5e71244fae65de56-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764');
INSERT INTO `purchase` (`id_purchase`, `purchase_date`, `total`, `details`, `payments`, `usercod`) VALUES
('9d052718497c9037b112a69119cdd095bb5d70e1ccdf9c6bb485f6adaa922dc164de664ffad7870222c7a633ab1afc221d78358754c6f9bec59bbb086b73e2131451purchase', '0000-00-00', 109.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"80X21052K7115004X\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691982262\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"8NU95379CB1390421\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"126.48\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"126.48\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"6.50\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"119.98\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/8NU95379CB1390421\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/8NU95379CB1390421\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/80X21052K7115004X\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:51:11Z\",\n                            \"update_time\": \"2023-12-07T20:51:11Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/80X21052K7115004X\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"359a8c0c2c73a\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000359a8c0c2c73a-4e76751a5a11aba3-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('a2017959985343ad614def1aa9ed70f610f29aadb72f4e7f8df3829f10a2b9d1ae0cc21dbb59e4c8e17a6ca92d9f494564938a6991a45c59325a9ed6f1d148aa1346purchase', '0000-00-00', 69.99, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"8LF534878L742382J\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691978404\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"0LX90132LB508535U\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"80.49\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"80.49\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"4.24\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"76.25\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/0LX90132LB508535U\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/0LX90132LB508535U\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/8LF534878L742382J\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T19:46:54Z\",\n                            \"update_time\": \"2023-12-07T19:46:54Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/8LF534878L742382J\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1664\",\n        \"date\": \"Thu, 07 Dec 2023 19\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"9a36f1c81b7bb\",\n        \"server-timing\": \"traceparent;desc=\\\"00-00000000000000000009a36f1c81b7bb-cfc9394dada31119-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('bddb74e8e5f9d68ff4cda87e43c97d1cbd3dd01df4aad2c1f1e58573a5f2532ff26d062b6acc85df77ee9361b5cdb14033460a1d5cbde45235cf2625cc91ed991440purchase', '0000-00-00', 149.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"49J81168VU768232Y\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691981641\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"7VB13011YE804654T\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"172.48\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"172.48\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"8.75\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"163.73\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/7VB13011YE804654T\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/7VB13011YE804654T\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/49J81168VU768232Y\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:40:51Z\",\n                            \"update_time\": \"2023-12-07T20:40:51Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/49J81168VU768232Y\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"6ee0fd7aea7e6\",\n        \"server-timing\": \"traceparent;desc=\\\"00-00000000000000000006ee0fd7aea7e6-16264d38f1c03575-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('c2d0eaec0f2b46b7c5396a78f8c4883b72791056af4779c2d3d23722e90783c067092e7dca3a701baf0af315362b3dccc3f353bcd0a60e202a6063b40757b7d31432purchase', '0000-00-00', 149.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"61M80771Y9666242F\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691981123\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"2G867228YD6367746\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"172.48\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"172.48\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"8.75\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"163.73\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/2G867228YD6367746\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/2G867228YD6367746\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/61M80771Y9666242F\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:32:14Z\",\n                            \"update_time\": \"2023-12-07T20:32:14Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/61M80771Y9666242F\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"6093c3a2975e5\",\n        \"server-timing\": \"traceparent;desc=\\\"00-00000000000000000006093c3a2975e5-d37df5392a7346fe-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('cbf9d13460b9c6c7265b3f6acbbd07fd2a880054b88083b92c6112fb832c6871818f08a037299e20cbeb8b56b460c5a0e553772098818f7a1e02f98b38ff0fc71445purchase', '0000-00-00', 119.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"4CS18254SX831925G\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691981897\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"90J572653X3344730\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"137.98\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"137.98\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"7.06\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"130.92\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/90J572653X3344730\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/90J572653X3344730\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/4CS18254SX831925G\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:45:06Z\",\n                            \"update_time\": \"2023-12-07T20:45:06Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/4CS18254SX831925G\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"fb1a2a120708d\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000fb1a2a120708d-52052ba3510aacda-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('e55afcf4434e83d4ea84afff8848fd551e30a4c17049f6481abc778d9fd01d61fb79940fae5a6a6810c4e5b03fa8f39e463d0a1009b42dc161e2cdff53441a691514purchase', '0000-00-00', 109.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"0Y339688KS417584M\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691983656\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"7B343808K42791232\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"126.48\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"126.48\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"6.50\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"119.98\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/7B343808K42791232\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/7B343808K42791232\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/0Y339688KS417584M\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T21:14:25Z\",\n                            \"update_time\": \"2023-12-07T21:14:25Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/0Y339688KS417584M\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 21\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"f0b7e16a970f3\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000f0b7e16a970f3-7e543ce9e2724aac-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', '0b9273d8ebdfc9772df8e99268a05381b4bdd0dd7e9a75a4c8c7d32a1c58a52d'),
('ecda7bf6de736457c22584f0fed271ad6894c7850a9499655ef790d9c6b36071fa5f1f7d39e6d4001cbaf5537a31c716faee339bb429cc7d503c66e37a9c88d61439purchase', '0000-00-00', 149.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"19C4033630190422L\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691981549\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"5NX1732289656602N\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"172.48\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"172.48\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"8.75\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"163.73\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/5NX1732289656602N\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/5NX1732289656602N\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/19C4033630190422L\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:39:19Z\",\n                            \"update_time\": \"2023-12-07T20:39:19Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/19C4033630190422L\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"7588217da2a32\",\n        \"server-timing\": \"traceparent;desc=\\\"00-00000000000000000007588217da2a32-7fb410f956316172-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('f005d9f696e166f973ed373ae5584a10df0430b3c80e68d79a51fed8161a37e8c2a3a196232c3f04e80d42a24aef929b1492d48446241c5080450211dd225c6c1434purchase', '0000-00-00', 149.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"8WT835035V4648547\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691981228\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"51S53985EC607271M\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"172.48\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"172.48\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"8.75\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"163.73\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/51S53985EC607271M\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/51S53985EC607271M\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/8WT835035V4648547\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:33:59Z\",\n                            \"update_time\": \"2023-12-07T20:33:59Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/8WT835035V4648547\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"d45fac411be85\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000d45fac411be85-69609a632d664719-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764');
INSERT INTO `purchase` (`id_purchase`, `purchase_date`, `total`, `details`, `payments`, `usercod`) VALUES
('f287ed364175f8d84cbcc7239364660e7175079311c9384839ae76af27d60b00510ba68c79e9eee9453ba6500fca449043f0cdcd4346e438b92cc3dd436b042b0956purchase', '0000-00-00', 74.99, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"2T577227TB486551P\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691964584\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"99J09348VH996273K\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"86.24\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"86.24\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"4.53\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"81.71\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/99J09348VH996273K\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/99J09348VH996273K\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/2T577227TB486551P\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T15:56:33Z\",\n                            \"update_time\": \"2023-12-07T15:56:33Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/2T577227TB486551P\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1664\",\n        \"date\": \"Thu, 07 Dec 2023 15\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"e4f2b4f864772\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000e4f2b4f864772-010b766cb77a16c8-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('f682625e1442448c964932fa1ce847fe513777844999dbe0b98868ceed0e7de330ae81616430b479a6b8803506199433c6f428d0c0ff834b9df6bb86ee8cdc2d1459purchase', '0000-00-00', 109.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"0AL24787DX504454W\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691982767\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"17542401TD282144E\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"126.48\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"126.48\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"6.50\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"119.98\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/17542401TD282144E\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/17542401TD282144E\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/0AL24787DX504454W\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:59:37Z\",\n                            \"update_time\": \"2023-12-07T20:59:37Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/0AL24787DX504454W\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"d8bc070c1a5df\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000d8bc070c1a5df-1fd80ed435c1f372-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('fc154b53425fd772097eca03848ed398f45f84cfcbd8d65f0b81c01c85fd15482809d1fe45580e03bf791b871ff5e159775c379b4e30dcb49176238c49c7e9761436purchase', '0000-00-00', 149.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"4DV16190VJ902372H\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691981403\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"6UG316943T854430N\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"172.48\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"172.48\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"8.75\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"163.73\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/6UG316943T854430N\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/6UG316943T854430N\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/4DV16190VJ902372H\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:36:53Z\",\n                            \"update_time\": \"2023-12-07T20:36:53Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/4DV16190VJ902372H\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"a6349693d614a\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000a6349693d614a-e9a233afbef4f299-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764'),
('fc4c34a4cfa68c5f21f81857de5439d782a3836597305c197d818b757c53deb13c774ae61b487203717cfc0e1bf2aa4f5f3204f3c84f8a6c00b28ac9bea327611448purchase', '0000-00-00', 119.98, 'Purchase on skuull2canldy', '{\n    \"statusCode\": 201,\n    \"result\": {\n        \"id\": \"3HU5172234803283Y\",\n        \"status\": \"COMPLETED\",\n        \"payment_source\": {\n            \"paypal\": {\n                \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n                \"account_id\": \"RTVSADXQNY8N6\",\n                \"account_status\": \"VERIFIED\",\n                \"name\": {\n                    \"given_name\": \"John\",\n                    \"surname\": \"Doe\"\n                },\n                \"address\": {\n                    \"country_code\": \"HN\"\n                }\n            }\n        },\n        \"purchase_units\": [\n            {\n                \"reference_id\": \"test1691982105\",\n                \"shipping\": {\n                    \"name\": {\n                        \"full_name\": \"John Doe\"\n                    },\n                    \"address\": {\n                        \"address_line_1\": \"Free Trade Zone\",\n                        \"admin_area_2\": \"Tegucigalpa\",\n                        \"admin_area_1\": \"Tegucigalpa\",\n                        \"postal_code\": \"12345\",\n                        \"country_code\": \"HN\"\n                    }\n                },\n                \"payments\": {\n                    \"captures\": [\n                        {\n                            \"id\": \"53X34559825486729\",\n                            \"status\": \"COMPLETED\",\n                            \"amount\": {\n                                \"currency_code\": \"USD\",\n                                \"value\": \"137.98\"\n                            },\n                            \"final_capture\": true,\n                            \"seller_protection\": {\n                                \"status\": \"ELIGIBLE\",\n                                \"dispute_categories\": [\n                                    \"ITEM_NOT_RECEIVED\",\n                                    \"UNAUTHORIZED_TRANSACTION\"\n                                ]\n                            },\n                            \"seller_receivable_breakdown\": {\n                                \"gross_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"137.98\"\n                                },\n                                \"paypal_fee\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"7.06\"\n                                },\n                                \"net_amount\": {\n                                    \"currency_code\": \"USD\",\n                                    \"value\": \"130.92\"\n                                }\n                            },\n                            \"links\": [\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/53X34559825486729\",\n                                    \"rel\": \"self\",\n                                    \"method\": \"GET\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/53X34559825486729\\/refund\",\n                                    \"rel\": \"refund\",\n                                    \"method\": \"POST\"\n                                },\n                                {\n                                    \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/3HU5172234803283Y\",\n                                    \"rel\": \"up\",\n                                    \"method\": \"GET\"\n                                }\n                            ],\n                            \"create_time\": \"2023-12-07T20:48:36Z\",\n                            \"update_time\": \"2023-12-07T20:48:36Z\"\n                        }\n                    ]\n                }\n            }\n        ],\n        \"payer\": {\n            \"name\": {\n                \"given_name\": \"John\",\n                \"surname\": \"Doe\"\n            },\n            \"email_address\": \"sb-zjmxv22294736@personal.example.com\",\n            \"payer_id\": \"RTVSADXQNY8N6\",\n            \"address\": {\n                \"country_code\": \"HN\"\n            }\n        },\n        \"links\": [\n            {\n                \"href\": \"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/3HU5172234803283Y\",\n                \"rel\": \"self\",\n                \"method\": \"GET\"\n            }\n        ]\n    },\n    \"headers\": {\n        \"\": \"\",\n        \"content-type\": \"application\\/json\",\n        \"content-length\": \"1667\",\n        \"date\": \"Thu, 07 Dec 2023 20\",\n        \"access-control-expose-headers\": \"Server-Timing\",\n        \"application_id\": \"APP-80W284485P519543T\",\n        \"cache-control\": \"max-age=0, no-cache, no-store, must-revalidate\",\n        \"caller_acct_num\": \"T8QFSWQ29LCYJ\",\n        \"paypal-debug-id\": \"f5b12a5bb57d2\",\n        \"server-timing\": \"traceparent;desc=\\\"00-0000000000000000000f5b12a5bb57d2-25f5f485ea95fdca-01\\\"\",\n        \"vary\": \"Accept-Encoding\",\n        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\"\n    }\n}', 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchasedetail`
--

CREATE TABLE `purchasedetail` (
  `id_purchase` varchar(450) NOT NULL,
  `id_item_reference` varchar(450) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unitary_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `purchasedetail`
--

INSERT INTO `purchasedetail` (`id_purchase`, `id_item_reference`, `quantity`, `unitary_price`) VALUES
('085775179e5732d62264d1f96009fbe764c170a4d1b66ff974ef44b1a60e498011bf3d460490488606aaaaa1729a33e8b58ef75dd0766f86b7d81f76aa772ca31348purchase', '2324423', 1, 69.99),
('27188d08377664a53809e576e02742d2bed5b2b9e9933028e9a699e7adcc5b7f34c90825fc396d5e07086ea9e6060815c0f5894eeaa98e9af00a88125b3995931439purchase', '11', 1, 59.99),
('31fe036f3fe68a776acccf77204a0caef95beed67a002c33c0a2558002278ce35416ddac1fdcdc952493815fab80a60744dbbefe760f7e0be9c7f2ce1d2b5e921651purchase', '11', 1, 59.99),
('31fe036f3fe68a776acccf77204a0caef95beed67a002c33c0a2558002278ce35416ddac1fdcdc952493815fab80a60744dbbefe760f7e0be9c7f2ce1d2b5e921651purchase', '222', 3, 29.99),
('362241bc4665999d784797cfb04c5a1781d73d61dea013b8e794157b3de775228ce24828a08263bda7e3c4e0353d7696c7bc75f00ee3ee4515f47fc50bd881d31443purchase', '232324', 1, 39.99),
('370b89c80d38d1608b38dc31e6a116512dfaadc1c7ba523863ba24f5ac946ac2b28264d7922f9baa7ad03957a4bf9514fa03f7cebb16e1e0c66ebcc383541f0b1345purchase', '222', 1, 29.99),
('37273669936ffc3e79176b678eca4ddec1104787a772bc43812cb5fbc29b810a27f17e7adb59e524149b514c5dd40d2472234e678747d07c99959007363b2e7c1339purchase', '2', 1, 19.99),
('58458193fc6a82ae75e2abcbb0cd719555670a8aba1af8517cb7b7c08bd6a4bb2ad41fa5f6e10953af831eabfca4ed58fe413e4286e167bdf560ed28683b87781431purchase', '11', 1, 59.99),
('645a336413d8121838e08929f62ea297d4fe888622b3d38a10565901952badfd98ef9cfd74e44db716628e68a76c8565ccd0b39e4ba96f2b5167e4aaa65c4e631807purchase', '222', 1, 29.99),
('645a336413d8121838e08929f62ea297d4fe888622b3d38a10565901952badfd98ef9cfd74e44db716628e68a76c8565ccd0b39e4ba96f2b5167e4aaa65c4e631807purchase', '5808726778', 1, 123.99),
('645a336413d8121838e08929f62ea297d4fe888622b3d38a10565901952badfd98ef9cfd74e44db716628e68a76c8565ccd0b39e4ba96f2b5167e4aaa65c4e631807purchase', '6473423', 1, 99.99),
('7765fdc48daa05bd310650077c228a060c0be5db1bac0faba0a68704b7d2f9730e686ceaf31a7b47496e789b467d18635bbf5ad5c510cb278a659c1052846cb41457purchase', '11', 1, 59.99),
('825fe79a463957ebbef6bff5cb60aa35567f7b4441c54710ebbf638377b70a1f31c640e5c9e2aa8f560369c8033a276d7696b4ce979848c8823812eded378ca21458purchase', '11', 1, 59.99),
('84b2e58cb9fe403e4526b90c32b23968d301e2e1af0ce8bef8f82c282cb17330da7967bdd0e7f3792dc883eeee4f3148d47d6bbb8831edc76025659ad8c7ba341437purchase', '11', 1, 59.99),
('89b6a24ba22f7c2ebb65dd107593c2e4c77562cfe07ffc1a896278cde2970cff5f054590b84e3a7a0e480e871d9cfe0f28e041b39c5343750f24cf8b12a8604a1349purchase', '11', 1, 59.99),
('89b6a24ba22f7c2ebb65dd107593c2e4c77562cfe07ffc1a896278cde2970cff5f054590b84e3a7a0e480e871d9cfe0f28e041b39c5343750f24cf8b12a8604a1349purchase', '82392', 1, 99.99),
('9d052718497c9037b112a69119cdd095bb5d70e1ccdf9c6bb485f6adaa922dc164de664ffad7870222c7a633ab1afc221d78358754c6f9bec59bbb086b73e2131451purchase', '11', 1, 59.99),
('a2017959985343ad614def1aa9ed70f610f29aadb72f4e7f8df3829f10a2b9d1ae0cc21dbb59e4c8e17a6ca92d9f494564938a6991a45c59325a9ed6f1d148aa1346purchase', '4546452323', 1, 69.99),
('bddb74e8e5f9d68ff4cda87e43c97d1cbd3dd01df4aad2c1f1e58573a5f2532ff26d062b6acc85df77ee9361b5cdb14033460a1d5cbde45235cf2625cc91ed991440purchase', '11', 1, 59.99),
('c2d0eaec0f2b46b7c5396a78f8c4883b72791056af4779c2d3d23722e90783c067092e7dca3a701baf0af315362b3dccc3f353bcd0a60e202a6063b40757b7d31432purchase', '11', 1, 59.99),
('cbf9d13460b9c6c7265b3f6acbbd07fd2a880054b88083b92c6112fb832c6871818f08a037299e20cbeb8b56b460c5a0e553772098818f7a1e02f98b38ff0fc71445purchase', '2324423', 1, 69.99),
('e55afcf4434e83d4ea84afff8848fd551e30a4c17049f6481abc778d9fd01d61fb79940fae5a6a6810c4e5b03fa8f39e463d0a1009b42dc161e2cdff53441a691514purchase', '232324232567', 1, 79.99),
('ecda7bf6de736457c22584f0fed271ad6894c7850a9499655ef790d9c6b36071fa5f1f7d39e6d4001cbaf5537a31c716faee339bb429cc7d503c66e37a9c88d61439purchase', '11', 1, 59.99),
('f005d9f696e166f973ed373ae5584a10df0430b3c80e68d79a51fed8161a37e8c2a3a196232c3f04e80d42a24aef929b1492d48446241c5080450211dd225c6c1434purchase', '11', 1, 59.99),
('f287ed364175f8d84cbcc7239364660e7175079311c9384839ae76af27d60b00510ba68c79e9eee9453ba6500fca449043f0cdcd4346e438b92cc3dd436b042b0956purchase', '6454645', 1, 74.99),
('f682625e1442448c964932fa1ce847fe513777844999dbe0b98868ceed0e7de330ae81616430b479a6b8803506199433c6f428d0c0ff834b9df6bb86ee8cdc2d1459purchase', '11', 1, 59.99),
('fc154b53425fd772097eca03848ed398f45f84cfcbd8d65f0b81c01c85fd15482809d1fe45580e03bf791b871ff5e159775c379b4e30dcb49176238c49c7e9761436purchase', '11', 1, 59.99),
('fc4c34a4cfa68c5f21f81857de5439d782a3836597305c197d818b757c53deb13c774ae61b487203717cfc0e1bf2aa4f5f3204f3c84f8a6c00b28ac9bea327611448purchase', '2324423', 1, 69.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `rolescod` varchar(128) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`rolescod`, `rolesdsc`, `rolesest`) VALUES
('ADMIN', 'Administrador', 'ACT'),
('ART', 'Artista', 'ACT'),
('AUDIT', 'Auditor', 'ACT'),
('CLN', 'Cliente No Suscrito', 'ACT'),
('CLS', 'Cliente Suscrito', 'ACT'),
('DEV', 'Developer', 'ACT'),
('INV', 'INVESTOR', 'ACT'),
('OPADQ', 'Operador de Adquisiciones', 'ACT'),
('SOP', 'Soporte', 'ACT'),
('VEN', 'Vendor', 'ACT'),
('VIS', 'Visita', 'ACT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_usuarios`
--

CREATE TABLE `roles_usuarios` (
  `usercod` varchar(450) NOT NULL,
  `rolescod` varchar(128) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles_usuarios`
--

INSERT INTO `roles_usuarios` (`usercod`, `rolescod`, `roleuserest`, `roleuserfch`, `roleuserexp`) VALUES
('0b9273d8ebdfc9772df8e99268a05381b4bdd0dd7e9a75a4c8c7d32a1c58a52d', 'CLS', 'ACT', '2023-12-07 15:13:21', '2024-12-07 15:13:21'),
('3b61f317dd985b6d502b2b0a1b87ce33803253b7d17c253c95ef09bcb199035e', 'CLN', 'ACT', '2023-12-05 00:54:53', '2024-12-05 00:54:53'),
('6353d3a7c31d7173e20623d58ccdedf8e89fc20cb4abf49feac7a83fdb106bb4', 'CLN', 'ACT', '2023-12-04 23:35:52', '2024-12-04 23:35:52'),
('7846e66b3622270eecd785a623828e61aca13c84802526662cb8174d2b6e76a0', 'CLN', 'ACT', '2023-12-05 00:16:46', '2024-12-05 00:16:46'),
('9735cdb70a09d2c9aed017aa37cbc209ab5eb1874cfb1986bf0706851f17fd5d', 'CLN', 'ACT', '2023-12-04 14:52:31', '2024-12-04 14:52:31'),
('e5ac4f8c46a9cefbbe2640c8a35acc8f1b74a0b321e73ec8076b62b53857a80f', 'ADMIN', 'ACT', '2023-12-07 18:05:04', '2024-12-07 18:05:04'),
('f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764', 'ADMIN', 'ACT', '2023-12-06 16:56:20', '2024-12-06 16:56:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `song`
--

CREATE TABLE `song` (
  `id_song` varchar(500) NOT NULL,
  `title_song` varchar(500) DEFAULT NULL,
  `duration` decimal(12,2) NOT NULL,
  `id_genre` varchar(500) NOT NULL,
  `song_cover` varchar(500) DEFAULT NULL,
  `album_id` varchar(255) DEFAULT NULL,
  `status_song` varchar(5) DEFAULT NULL,
  `link_song` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `song`
--

INSERT INTO `song` (`id_song`, `title_song`, `duration`, `id_genre`, `song_cover`, `album_id`, `status_song`, `link_song`) VALUES
('07ba650329a2569440d3cea5553b37b40bd8becf165ceb07e4a7219bc77d58e6', 'LOSTBOY', 4.07, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.y1zDLjajfKPEZLoKqoBzVQAAAA?rs=1&pid=ImgDetMain', '6bcdc092dda4569f9eb9209eda3fb5876d42cdb3d5aa8cde792d6f5a4679d39c', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Blue%20Neighbourhood%20Troye%20Sivan%2F11%20LOST%20BOY.mp3?alt=media&token=d21d7093-a924-4202-8720-3ec0ba13375f'),
('18ea924d75457b7808382c097e067d46dd9be0dcea6c9f9644415c467df2babe', 'Set Fire to the Rain', 4.02, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://c1.staticflickr.com/7/6144/6011569137_f4db79f324_z.jpg', '6e9dac7b19d06868b4a47151812491f7c28b6fe3f5670c25bfa75a35cc5d1af6', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/21%20Adele%2F05%20Set%20Fire%20To%20The%20Rain.m4a?alt=media&token=1e0b9ccc-8b5d-464c-97f2-14fba8f69739'),
('196abae88effc4ab5d2f176d0579cf24bea90857c99d18cd074e9090ed7e8246', 'Hot n Cold', 3.40, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.I1GprgQbKLkCyq0zOecljAHaHa?rs=1&pid=ImgDetMain', '3975302118d61c4c7f6016783d502e1d16cbfc7b926a878608d7ebd23a298011', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/One%20Of%20The%20Boys%20Lana%20Del%20Rey%2F07%20Hot%20\'n\'%20Cold.m4a?alt=media&token=5323b1cc-f1b6-428a-b8ea-5615084d6dbd'),
('1f1303033bf97085320ee05498c8cb8f2ea3d8cba04baa069cb4e166126b1d58', 'I Kissed a Girl', 3.00, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.I1GprgQbKLkCyq0zOecljAHaHa?rs=1&pid=ImgDetMain', '3975302118d61c4c7f6016783d502e1d16cbfc7b926a878608d7ebd23a298011', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/One%20Of%20The%20Boys%20Lana%20Del%20Rey%2F02%20I%20Kissed%20a%20Girl.m4a?alt=media&token=7a739564-3fc2-4562-a10d-cece2824e07a'),
('243a20378bed1ddf08ba12f9a0ea54908d829cee193ac5d83ab8bbe869967283', 'DDU DU DDU DU REMIX', 3.11, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/R.b16159549fd6a2d98ea641482eb342c8?rik=Sq7pCASqxYPwBQ&pid=ImgRaw&r=0', '59036afa9cb6d33c3d2d0b3cc88324cce8bf8a8098c58e830707289f6f204618', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Kill%20This%20Love%20Blackpink%2F05%20-%20DDU-DU%20DDU-DU%20(Remix).mp3?alt=media&token=e001be65-e83a-4b0f-b9ca-00e3bc925fd5'),
('2fe77af4e696382ba4e35fc948244a964a29030887516813e38cef42fe6b6aa4', 'If You Can Afford Me', 3.18, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.I1GprgQbKLkCyq0zOecljAHaHa?rs=1&pid=ImgDetMain', '3975302118d61c4c7f6016783d502e1d16cbfc7b926a878608d7ebd23a298011', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/One%20Of%20The%20Boys%20Lana%20Del%20Rey%2F08%20If%20You%20Can%20Afford%20Me.m4a?alt=media&token=fcfba23f-e656-4729-bb4a-34acce63bdaf'),
('30cc1cb006f560be31de08160f80efe06635bd3efb8cb8745cf74d6ca8f6d921', 'Alejandro', 4.34, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://1.bp.blogspot.com/-eYOWrytExPI/X2RnPyy9JtI/AAAAAAAAQao/SjOtKNFCIjg66CS0yOu-l1l2OPVumSElwCLcBGAsYHQ/s2000/The+Fame+Monster+by+kupo.design+1.jpg', '0a993b87597245e6f85d8e155e4e9f0e7f463b147a919f6021d169dd9859736b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/The%20Fame%20Lady%20Gaga%2FAlejandro.m4a?alt=media&token=d6251b8f-1f72-456a-913b-93d0ea642b38'),
('3187959559981982ab363b396f193a8a39d401cf020c5218d2fa72ee79a8587c', 'WILD', 4.12, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.y1zDLjajfKPEZLoKqoBzVQAAAA?rs=1&pid=ImgDetMain', '6bcdc092dda4569f9eb9209eda3fb5876d42cdb3d5aa8cde792d6f5a4679d39c', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Blue%20Neighbourhood%20Troye%20Sivan%2F01%20WILD.mp3?alt=media&token=9ffa1b16-2f84-44e6-8249-a988f363c7e9'),
('3a241d59687b801ed1a519fd9acf1bad288e1cc9993b2d03a7974623483fa00a', 'Monster', 4.09, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://1.bp.blogspot.com/-eYOWrytExPI/X2RnPyy9JtI/AAAAAAAAQao/SjOtKNFCIjg66CS0yOu-l1l2OPVumSElwCLcBGAsYHQ/s2000/The+Fame+Monster+by+kupo.design+1.jpg', '0a993b87597245e6f85d8e155e4e9f0e7f463b147a919f6021d169dd9859736b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/The%20Fame%20Lady%20Gaga%2FMonster.m4a?alt=media&token=a2496ab7-9a3a-43a4-88f8-1bd2eb36b55f'),
('46c7b5713c98a3574f70cb5e0fd49080a43b4a555d57e8e8950895fbf6f38ff7', 'Hope Not', 3.11, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/R.b16159549fd6a2d98ea641482eb342c8?rik=Sq7pCASqxYPwBQ&pid=ImgRaw&r=0', '59036afa9cb6d33c3d2d0b3cc88324cce8bf8a8098c58e830707289f6f204618', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Kill%20This%20Love%20Blackpink%2F04%20-%20Hope%20Not.mp3?alt=media&token=ed90c6a9-fee8-4308-a39d-17a09a905e8d'),
('48b4beceeaea0f39111efed599f41235d60332d9f35679277af14b899d6eae34', 'FOOLS', 4.07, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.y1zDLjajfKPEZLoKqoBzVQAAAA?rs=1&pid=ImgDetMain', '6bcdc092dda4569f9eb9209eda3fb5876d42cdb3d5aa8cde792d6f5a4679d39c', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Blue%20Neighbourhood%20Troye%20Sivan%2F03%20FOOLS.mp3?alt=media&token=0ee73af0-94a2-4624-9f61-430c224b29a1'),
('48f9830a48121694f306a62d9132d92936b295924feb3f65e00aa1ac343475c1', 'Bad Romance', 4.54, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://1.bp.blogspot.com/-eYOWrytExPI/X2RnPyy9JtI/AAAAAAAAQao/SjOtKNFCIjg66CS0yOu-l1l2OPVumSElwCLcBGAsYHQ/s2000/The+Fame+Monster+by+kupo.design+1.jpg', '0a993b87597245e6f85d8e155e4e9f0e7f463b147a919f6021d169dd9859736b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/The%20Fame%20Lady%20Gaga%2FBad%20Romance.m4a?alt=media&token=3059ff4d-dbbd-4084-a6bf-64656c5a50be'),
('4f26dc5361ce9f7e099823ee6c226074520cc6a0eebab1c855f8251d5342196e', 'TALK ME DOWN', 4.17, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.y1zDLjajfKPEZLoKqoBzVQAAAA?rs=1&pid=ImgDetMain', '6bcdc092dda4569f9eb9209eda3fb5876d42cdb3d5aa8cde792d6f5a4679d39c', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Blue%20Neighbourhood%20Troye%20Sivan%2F07%20TALK%20ME%20DOWN.mp3?alt=media&token=05e9d866-0fed-431d-a883-bf4f27816317'),
('511533cac0743ea89d458f59989ea18a6efb71a1aee0cb422f0e13752663d5cc', 'Someone Like You', 4.45, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://c1.staticflickr.com/7/6144/6011569137_f4db79f324_z.jpg', '6e9dac7b19d06868b4a47151812491f7c28b6fe3f5670c25bfa75a35cc5d1af6', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/21%20Adele%2F11%20Someone%20Like%20You.m4a?alt=media&token=4562568c-16b1-42b0-b9be-82d116ba86b8'),
('53856b397e3436808801f2ae8ba81c8b1140423e7c2d3b6f133d1a762418f341', 'One of the Boys', 4.07, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.I1GprgQbKLkCyq0zOecljAHaHa?rs=1&pid=ImgDetMain', '3975302118d61c4c7f6016783d502e1d16cbfc7b926a878608d7ebd23a298011', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/One%20Of%20The%20Boys%20Lana%20Del%20Rey%2F01%20One%20of%20the%20Boys.m4a?alt=media&token=09f5edba-1c92-4104-81b8-011c0b896831'),
('5d5e326e7ce338e3d04db4758b5e84caab207e828c0e2316a794352c2cf4c981', 'Mannequin', 3.17, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.I1GprgQbKLkCyq0zOecljAHaHa?rs=1&pid=ImgDetMain', '3975302118d61c4c7f6016783d502e1d16cbfc7b926a878608d7ebd23a298011', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/One%20Of%20The%20Boys%20Lana%20Del%20Rey%2F05%20Mannequin.m4a?alt=media&token=fcf503c1-975c-4d19-99fe-d69f8ca1ae37'),
('5eeb68578a6cbacd458663c09371a8622d822b4716c3c06a3e934ef81fe4c86f', 'SUBURBIA', 3.54, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.y1zDLjajfKPEZLoKqoBzVQAAAA?rs=1&pid=ImgDetMain', '6bcdc092dda4569f9eb9209eda3fb5876d42cdb3d5aa8cde792d6f5a4679d39c', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Blue%20Neighbourhood%20Troye%20Sivan%2F13%20SUBURBIA.mp3?alt=media&token=d33bf50d-b370-4dde-ad24-e11a25dbcb3e'),
('76bf4065f61e3cba57f9c16076a0bde701553dfea7fa0ffb6ae77b71992abef2', 'Kill This Love', 3.11, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/R.b16159549fd6a2d98ea641482eb342c8?rik=Sq7pCASqxYPwBQ&pid=ImgRaw&r=0', '59036afa9cb6d33c3d2d0b3cc88324cce8bf8a8098c58e830707289f6f204618', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Kill%20This%20Love%20Blackpink%2F01%20-%20Kill%20This%20Love.mp3?alt=media&token=6e26694a-9712-4c4f-8996-350b03af5143'),
('77gwebjbwieibihe38h8euiwbdubdusd', 'Work', 4.23, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://media1.popsugar-assets.com/files/thumbor/Kxs8miFpnzcl9oszuw_KFdyro0o/fit-in/1200x630/filters:format_auto-!!-:strip_icc-!!-:fill-!white!-/2018/06/13/740/n/1922283/netimg2odaxH/i/Tom-Holland-Umbrella.jpg', 'c2d4913d8ef080d76d32d2def25d6a58cff39216c2fe708393d09c27992e27e8', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Unapologetic%20Rihanna%2Fy2mate.com%20-%20Rihanna%20%20Work%20Explicit%20Feat%20Drake%20TWO%20VIDEOS%20MIXED%20IN%20ONE.mp3?alt=media&token=52d1e0b9-316b-4b8f-984e-6ae5f840a6a7'),
('7cbae8ea4c10de006f7437f9020c8b3ca593b1d223c094e625a4c24dffbe6309', 'COOL', 3.22, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.y1zDLjajfKPEZLoKqoBzVQAAAA?rs=1&pid=ImgDetMain', '6bcdc092dda4569f9eb9209eda3fb5876d42cdb3d5aa8cde792d6f5a4679d39c', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Blue%20Neighbourhood%20Troye%20Sivan%2F08%20COOL.mp3?alt=media&token=bef14b35-cd26-46e4-92b3-9cff5a2b15fd'),
('8afb07590a775b70347b073cf25b770da7044f99dcfa2601e8c3c74699a2a2eb', 'Rolling in the Deep', 3.48, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://c1.staticflickr.com/7/6144/6011569137_f4db79f324_z.jpg', '6e9dac7b19d06868b4a47151812491f7c28b6fe3f5670c25bfa75a35cc5d1af6', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/21%20Adele%2F01%20Rolling%20In%20The%20Deep.m4a?alt=media&token=28dc60af-3594-492d-9dc8-431f8626c05f'),
('9fcf40cbb2786b6cb3effced2ccbbc7b6280f3e8ace668f537563fe2266b5e7c', 'EASE', 3.35, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.y1zDLjajfKPEZLoKqoBzVQAAAA?rs=1&pid=ImgDetMain', '6bcdc092dda4569f9eb9209eda3fb5876d42cdb3d5aa8cde792d6f5a4679d39c', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Blue%20Neighbourhood%20Troye%20Sivan%2F04%20EASE.mp3?alt=media&token=48b92268-1131-4578-86e2-f7faad54bc48'),
('b93cce456892620e422a35e2aae6c413b59d9c991f4237dccfffbad328a39ad7', 'Kick It', 3.11, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/R.b16159549fd6a2d98ea641482eb342c8?rik=Sq7pCASqxYPwBQ&pid=ImgRaw&r=0', '59036afa9cb6d33c3d2d0b3cc88324cce8bf8a8098c58e830707289f6f204618', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Kill%20This%20Love%20Blackpink%2F03%20-%20Kick%20It.mp3?alt=media&token=3bf57c6a-5e78-4839-b367-3d68ad2d9aef'),
('ba0a55745b76554b28e92f5c81b5f7c99a274b3272c6ac40d74ee1d7b6d6ff72', 'Dont Know What To Do', 3.21, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/R.b16159549fd6a2d98ea641482eb342c8?rik=Sq7pCASqxYPwBQ&pid=ImgRaw&r=0', '59036afa9cb6d33c3d2d0b3cc88324cce8bf8a8098c58e830707289f6f204618', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Kill%20This%20Love%20Blackpink%2F02%20-%20Don\'t%20Know%20What%20To%20Do.mp3?alt=media&token=659c5ae0-429d-41dd-9766-77abe7f3fd61'),
('d7c9fbb8d04da455c55ab01d6dd657c8c072eafb810ba73f9355d3b06fa0cd6e', 'Waking Up in Vegas', 3.19, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.I1GprgQbKLkCyq0zOecljAHaHa?rs=1&pid=ImgDetMain', '3975302118d61c4c7f6016783d502e1d16cbfc7b926a878608d7ebd23a298011', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/One%20Of%20The%20Boys%20Lana%20Del%20Rey%2F03%20Waking%20Up%20In%20Vegas.m4a?alt=media&token=df1ee069-b3d4-489b-a908-8c062637ae6e'),
('da2a9353eff64de716ffbbbbe0faaee39af4f426affa7867f503f6833c0f826e', 'Ur So Gay', 3.37, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.I1GprgQbKLkCyq0zOecljAHaHa?rs=1&pid=ImgDetMain', '3975302118d61c4c7f6016783d502e1d16cbfc7b926a878608d7ebd23a298011', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/One%20Of%20The%20Boys%20Lana%20Del%20Rey%2F06%20Ur%20So%20Gay.m4a?alt=media&token=47771ccf-4f69-4a00-bfb8-4790d6bc0df7'),
('f013187d91f087f459644662b843a258cb3ad99b8730ead964c99ea8dedb0fc9', 'Thinking of You', 4.06, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.I1GprgQbKLkCyq0zOecljAHaHa?rs=1&pid=ImgDetMain', '3975302118d61c4c7f6016783d502e1d16cbfc7b926a878608d7ebd23a298011', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/One%20Of%20The%20Boys%20Lana%20Del%20Rey%2F04%20Thinking%20of%20You.m4a?alt=media&token=c8bf25ec-4108-4a86-8723-36b164c95f89'),
('f805e3f3a7fbb3a4a254f44e4de0c607ff7001f4a78b207cf4d3001edfa66c4b', 'Rumors Has It', 3.43, 'a87be8077f00caa60dc4522640674d48d898fc6ad747513b137c8754800b5532', 'https://c1.staticflickr.com/7/6144/6011569137_f4db79f324_z.jpg', '6e9dac7b19d06868b4a47151812491f7c28b6fe3f5670c25bfa75a35cc5d1af6', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/21%20Adele%2F02%20Rumour%20Has%20It.m4a?alt=media&token=27a81db3-fc9d-429e-8896-d7914d408c96'),
('f86081de28dc01279746123f7a7ff54d543c987edab6a087c6c91fd7286c9ee8', 'Dance in the Dark', 4.48, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://1.bp.blogspot.com/-eYOWrytExPI/X2RnPyy9JtI/AAAAAAAAQao/SjOtKNFCIjg66CS0yOu-l1l2OPVumSElwCLcBGAsYHQ/s2000/The+Fame+Monster+by+kupo.design+1.jpg', '0a993b87597245e6f85d8e155e4e9f0e7f463b147a919f6021d169dd9859736b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/The%20Fame%20Lady%20Gaga%2FDance%20In%20the%20Dark.m4a?alt=media&token=a75ff0cb-1134-47f0-b9a9-2fa5b23dc8bf'),
('fa88f1cce536c72fc7181bbd561cb6791672205c9dd98d9060614b0ad5a29576', 'YOUTH', 3.05, '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad', 'https://th.bing.com/th/id/OIP.y1zDLjajfKPEZLoKqoBzVQAAAA?rs=1&pid=ImgDetMain', 'e0b9f1c88709d143c8c1dcefac53e75cd810cc54dbc35fe2bb8b561b7fab72ce', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Blue%20Neighbourhood%20Troye%20Sivan%2F10%20YOUTH.mp3?alt=media&token=1848903f-e5af-4240-887f-809c86d7a53f');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `songauthors`
--

CREATE TABLE `songauthors` (
  `artist_id` varchar(255) DEFAULT NULL,
  `song_id` varchar(255) DEFAULT NULL,
  `song_author_created_at` datetime DEFAULT NULL,
  `song_author_last_update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscription`
--

CREATE TABLE `subscription` (
  `id_subscription` varchar(400) NOT NULL,
  `subscription_description` varchar(255) DEFAULT NULL,
  `subscription_duration` int(11) DEFAULT NULL,
  `subscription_price` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `subscription`
--

INSERT INTO `subscription` (`id_subscription`, `subscription_description`, `subscription_duration`, `subscription_price`) VALUES
('0e35f6e9742e074dfd62e874de3c242c6d9b64c21bf9afbaf3d11f05579b4495', 'Basic', 30, 19.99),
('19c73a5cdf346d967e544a2838600bcc16a9fd39a52a4ba39f7351fcc6a65d4e', 'Professional', 30, 79.99),
('1d3981ba1e1892a87546666766b83d6a10a6341db303863a19fd63c2e90598e1', 'Artist', 30, 49.99),
('262b4ff6afdd7baafc6dbf8690c1d7fbb0e95cff4700306c9b76077b4cf6c000', 'Starter', 30, 29.99),
('3fbe5ed156f149939d9396e729af009070ccc54984b5bd8e088d86a72f8ac879', 'Enterprise', 30, 129.99),
('5a98505ed913859038c5c27056b95c5ccb54f43073887c548c0ec8c3a14765d5', 'Platinum', 30, 59.99),
('6249df4367d0a2e088c8eb1117ef59430f0d7dad4bf0fcf8a01d7f0415f4d511', 'Gold', 30, 89.99),
('76f68a75f01ed76f5a02ada71a3765a38ef2c45ba99106ee5a4bd5678d7bbdd0', 'Business', 30, 99.99),
('a0b43df06f52085e62ab592a6adc991e32fadfa13f51c7692ba1c1720b5663d2', 'Silver', 30, 69.99),
('de88c121a82a06352bf1aaceba20578356408a334ba046a1084d4e50da923c5e', 'Premium', 30, 49.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscriptionuser`
--

CREATE TABLE `subscriptionuser` (
  `usercod` varchar(255) NOT NULL,
  `id_subscription` varchar(255) NOT NULL,
  `purchase_date_subscription` datetime DEFAULT NULL,
  `purchase_date_end` datetime DEFAULT NULL,
  `status_subscription` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `subscriptionuser`
--

INSERT INTO `subscriptionuser` (`usercod`, `id_subscription`, `purchase_date_subscription`, `purchase_date_end`, `status_subscription`) VALUES
('0b9273d8ebdfc9772df8e99268a05381b4bdd0dd7e9a75a4c8c7d32a1c58a52d', '262b4ff6afdd7baafc6dbf8690c1d7fbb0e95cff4700306c9b76077b4cf6c000', '0000-00-00 00:00:00', '2023-12-08 00:00:00', 'ACT'),
('e5ac4f8c46a9cefbbe2640c8a35acc8f1b74a0b321e73ec8076b62b53857a80f', '262b4ff6afdd7baafc6dbf8690c1d7fbb0e95cff4700306c9b76077b4cf6c000', '0000-00-00 00:00:00', '2023-12-08 00:00:00', 'ACT'),
('f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764', '1d3981ba1e1892a87546666766b83d6a10a6341db303863a19fd63c2e90598e1', '0000-00-00 00:00:00', '2023-12-08 00:00:00', 'ACT');

--
-- Disparadores `subscriptionuser`
--
DELIMITER $$
CREATE TRIGGER `Subscription` AFTER INSERT ON `subscriptionuser` FOR EACH ROW BEGIN
    UPDATE roles_usuarios SET rolescod = 'CLS' where usercod = new.usercod;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `newSubUser` AFTER INSERT ON `subscriptionuser` FOR EACH ROW BEGIN
    UPDATE roles_usuarios SET rolescod = 'CLS' where usercod = new.usercod;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `newSubUserUpdate` AFTER UPDATE ON `subscriptionuser` FOR EACH ROW BEGIN
    UPDATE roles_usuarios SET rolescod = 'CLS' where usercod = new.usercod;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usercod` varchar(450) NOT NULL,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(5) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usercod`, `useremail`, `username`, `userpswd`, `userfching`, `userpswdest`, `userpswdexp`, `userest`, `useractcod`, `userpswdchg`, `usertipo`) VALUES
('0b9273d8ebdfc9772df8e99268a05381b4bdd0dd7e9a75a4c8c7d32a1c58a52d', 'ginger2@gmail.com', 'IndigoMightyRabbit151321M8ae', '$2y$10$zbMb4rRnKtzb/y0.onRIYe53nsWR96VPaBYtuyMK4QMhJ/Hnj3cBu', '2023-12-07 15:13:21', 'ACT', '2024-03-06 00:00:00', 'ACT', 'd5dba0ce382e6c259ba494001a92d80556fe53cde6f7f8e61e8fd51c36ce6f11', '2023-12-07 15:13:21', 'CLN'),
('2635b03adb0343ab9b6fbe16ea8a9c0baab542bafb45888823ed194eccc1b6ca', 'ing_betan@gmail.com', 'YellowFastWolf204545Me7a', '$2y$10$cY7m.DO3ri0PJw9gQIwjCuz7uU6sSk0mjWIYds9R2BUORcn6AzcG.', '2023-11-29 20:45:45', 'ACT', '2024-02-27 00:00:00', 'ACT', '6156dce94b0a25b562cdf6cbaf92211f74c7c643844cfcfd7fd52a8adc29bdb6', '2023-11-29 20:45:45', 'CLN'),
('31ce7c8c735a4a519653c2d239bd8a834b5b577056f8c6c9f6a859eb79e7e649', 'juanito@gmail.com', 'TenderEagle1108', '$2y$10$oKp1Hu.Gi6T16QGBvlrCc.LQdWGIvQhmj2UmEoR9p9UrW2Mq3.a7a', '2023-11-25 11:08:04', 'ACT', '2024-02-23 00:00:00', 'ACT', '5da7e398fb4077027b748f4e4eb312b9ef7f91c636c3df6244301c02a67bc4b1', '2023-11-25 11:08:04', 'CLN'),
('3b61f317dd985b6d502b2b0a1b87ce33803253b7d17c253c95ef09bcb199035e', 'juanito6@gmail.com', 'LimeCleverDog005453Z1', '$2y$10$adMqmcwZF5dEeNMZ9i7Thegh7RNvIosAIke59sduB0G4.IYfxtzYe', '2023-12-05 00:54:53', 'ACT', '2024-03-04 00:00:00', 'ACT', 'c01ef7c4e12713a25e33077f2a672acc76752b6afbfb93e4e05a445a8e97324d', '2023-12-05 00:54:53', 'CLN'),
('40dd9080b8bbfa27d84fe3feb77be06dd599ac246c6f0411e1f9094ab8005b0e', 'juanito2@gmail.com', 'GoldBraveLion134224zP4', '$2y$10$wisZ/KEk6dgl5.6PwEafjO2UBg.grtR6K3/9QzQGKtYLJs45/MvPy', '2023-11-25 13:42:24', 'ACT', '2024-02-23 00:00:00', 'ACT', 'e015fe1911807be4a5c94f90e0c404daa49f2b83b4b7ecd912985fab63fdf299', '2023-11-25 13:42:24', 'CLN'),
('626827faf35878c1792eef8f5e976f7da6aea68a3c892b32223c2a0c0f90fadf', 'juanito3@gmail.com', 'IndigoKindZebra154731@e4', '$2y$10$Nj9.Ww65P0D3Ut1SnIqXquumQd0l0DISGBQ6mwlGO4OqyXEo6.mK2', '2023-11-25 15:47:31', 'ACT', '2024-02-23 00:00:00', 'ACT', '8bf646abdf6fde864ac6883a0fcabf1328a62094253b76669e9e3bef8b7c721f', '2023-11-25 15:47:31', 'CLN'),
('6353d3a7c31d7173e20623d58ccdedf8e89fc20cb4abf49feac7a83fdb106bb4', 'juanito4@gmail.com', 'OliveAdventurousGiraffe233552Vs46', '$2y$10$UQjcFuuz6o.rUVYREEiS2eqhzR/Zp5s3iskjDdLvNRHsV/jGuRj1u', '2023-12-04 23:35:52', 'ACT', '2024-03-03 00:00:00', 'ACT', '0436c7647fbfb7924351b54d92e6f794427da587cb3c0b012972c338bc8c5c54', '2023-12-04 23:35:52', 'CLN'),
('7846e66b3622270eecd785a623828e61aca13c84802526662cb8174d2b6e76a0', 'juanito5@gmail.com', 'RedZealousZebra001646zP968d2c', '$2y$10$xGAx4gpLhKt1cAyxN.MIAu342N/R4KTh8jKVn1kZgV0pgOWNESNYC', '2023-12-05 00:16:46', 'ACT', '2024-03-04 00:00:00', 'ACT', '45eb9cccfbc23414878a3b9a6b9cd61baae8330b9211315f355061298f07b22b', '2023-12-05 00:16:46', 'CLN'),
('9735cdb70a09d2c9aed017aa37cbc209ab5eb1874cfb1986bf0706851f17fd5d', 'ing_betan2@gmail.com', 'YellowKindPanther145231Op80b72', '$2y$10$mdhaKTXKeI.d4c9dkOCZLulvI4HSb8JUcJXwQNAni8Wlumq8iI/om', '2023-12-04 14:52:31', 'ACT', '2024-03-03 00:00:00', 'ACT', 'db087db4b02874af9209d0e59c87ac399e9578831dc9ba16cfb5d5e8e4754ae4', '2023-12-04 14:52:31', 'CLN'),
('aliceinwonderland', 'alice@example.com', 'Alice Wonderland', 'P@ssw0rd3', '2023-11-03 00:00:00', 'ACT', '2024-11-03 00:00:00', 'ACT', 'activation_789', 'password_changed_3', 'NRM'),
('bobthebuilder', 'bob@example.com', 'Bob Builder', 'P@ssw0rd4', '2023-11-04 00:00:00', 'ACT', '2024-11-04 00:00:00', 'ACT', 'activation_abc', 'password_changed_4', 'NRM'),
('d5f6c38e492a93863b7c4143144931a6377c7b99904848f50eeeddf45b575708', 'jon.23ham0n@gmail.com', 'SilverTender$Hawk130739', '$2y$10$0Q0GV.gjqFE4Yt9J3ogzhu3ipv7xHSSRGRGKBqQ.WrkeqvqhxOpRG', '2023-11-25 13:07:39', 'ACT', '2024-02-23 00:00:00', 'ACT', '516fbf47a0726e84e7ecd3094e305c68558e3203047b0771e539d70294d5d3f1', '2023-11-25 13:07:39', 'CLN'),
('e5ac4f8c46a9cefbbe2640c8a35acc8f1b74a0b321e73ec8076b62b53857a80f', 'prueba2@gmail.com', 'RedBrightDolphin180504$5de3e4', '$2y$10$KBUdmZiR5OVTjNZhpBaCs.VLG/8./21ztlpA2canP413C7VD8mLsm', '2023-12-07 18:05:04', 'ACT', '2024-03-06 00:00:00', 'ACT', '2fbb8ab7855c7027f4efde6b2ad9320a8c382a2a287b82e579cf344cb3b69873', '2023-12-07 18:05:04', 'CLN'),
('f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764', 'ing_betan3@gmail.com', 'OliveBraveDolphin143309M92c', '$2y$10$7MVT4Wnvm2iNugWoUl.KQewa5cefCr.wzWaK1Bo4RcQwyq8W9Fap6', '2023-12-05 14:33:09', 'ACT', '2024-03-04 00:00:00', 'ACT', '672f74445ae0a062c7d74033fe451a7449ec135c78645feae6b15f83e8a87ec0', '2023-12-05 14:33:09', 'ADMIN'),
('janedoe', 'jane@example.com', 'Jane Doe', 'P@ssw0rd2', '2023-11-02 00:00:00', 'ACT', '2024-11-02 00:00:00', 'ACT', 'activation_456', 'password_changed_2', 'NRM'),
('johndoe', 'john@example.com', 'John Doe', 'P@ssw0rd1', '2023-11-01 00:00:00', 'ACT', '2024-11-01 00:00:00', 'ACT', 'activation_123', 'password_changed_1', 'NRM'),
('sarahconnor', 'sarah@example.com', 'Sarah Connor', 'P@ssw0rd5', '2023-11-05 00:00:00', 'ACT', '2024-11-05 00:00:00', 'ACT', 'activation_def', 'password_changed_5', 'NRM');

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `AutoRol` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
    INSERT INTO roles_usuarios (usercod, rolescod, roleuserest, roleuserfch, roleuserexp)
    VALUES (NEW.usercod, 'CLN', 'ACT', NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE `video` (
  `id_video` varchar(500) NOT NULL,
  `title_video` varchar(500) DEFAULT NULL,
  `description_video` varchar(500) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `video_cover` varchar(500) DEFAULT NULL,
  `artist_id` varchar(255) DEFAULT NULL,
  `status_video` varchar(5) DEFAULT NULL,
  `link_video` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `video`
--

INSERT INTO `video` (`id_video`, `title_video`, `description_video`, `duration`, `video_cover`, `artist_id`, `status_video`, `link_video`) VALUES
('283782hsasi2394hqws', 'Lana Del Rey Performs “Unchained Melody” LIVE | Christmas at Graceland | NBC', 'Lana Del Rey hits all the right notes with her version of the timeless ballad.', 420, 'https://66.media.tumblr.com/8d6a880264c9aeeb883a4d514cfa1fc1/tumblr_ot5as74xMK1ve9eiao1_1280.jpg', '0bf18fd271f7a7d9f4c52373a642986722acedcd9e03ef383a765994c8e83910', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Lana%20Del%20Rey%20Performs%20Unchained%20Melody%20LIVE%20%20Christmas%20at%20Graceland%20%20NBC_1080p.mp4?alt=media&token=2848447b-9032-4c60-9130-32dd54221bdb'),
('d14d1cb551064b87959ce062e49b8d4a', 'BAD ROMANCE DELUXE VIDEO', 'WORLD WAS TAKEN AWAY WHEN LADY GAGAS BAD ROMANCE BROKE UP THE SCENE, HERE WE SEE HERE IN A MORE INTIMATELY WAY, RAW, HOPELESS', 300, 'https://th.bing.com/th/id/OIP.MDtzspL9EC1B5grnJ36PbQHaHa?w=191&h=191&c=7&r=0&o=5&dpr=1.3&pid=1.7', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Lady%20Gaga%20%20Bad%20Romance%20Official%20Music%20Video_1080p.mp4?alt=media&token=d8684e6e-6e46-4d21-a025-75e6d3ce0bbc'),
('d14d1cb551064b87959ce062e49b8d4aASxc', 'BAD ROMANCE BEHIND SCENES', 'WORLD WAS TAKEN AWAY WHEN LADY GAGAS BAD ROMANCE BROKE UP THE SCENE, HERE WE SEE HERE IN A MORE INTIMATELY WAY, RAW, HOPELESS', 220, 'https://4.bp.blogspot.com/-qZfIoQOWFD0/UW23vWJrNDI/AAAAAAAALKI/e0e-OSs7G80/s0/Lady-Gaga-Bad-Romance-Music-Video-Screencaps-lady-gaga-19361986-1248-704.jpg', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Lady%20Gaga%20%20Bad%20Romance%20Official%20Behind%20the%20Scenes_480p.mp4?alt=media&token=b88931fc-a48e-433e-9ecd-fe9291eb0e23'),
('d14d1cb551064b87959ce062e49b8d4aASxSDDc', 'DUSSELDURF LADY GAGAS CONCERT', 'THIS IS LADY GAGAS DUSSELDURF CONCERT', 660, 'https://i.ytimg.com/vi/2N9OXjfsrps/hqdefault.jpg', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Lady%20Gaga%20%20Opening%20%20Bad%20Romance%20Chromatica%20Ball%20%20D%C3%BCsseldorf%202022_1080pFHR.mp4?alt=media&token=0aabaa00-c3f4-43c7-966c-a0474a3aa671'),
('d14d1cb551064b87959ce062e49b8d4SDSaASxNNSDDc', 'POKER FACE CONCERT EDITION', 'THIS IS LADY GAGAS DELUXE CONCERT AT NW HALL', 220, 'https://i.ytimg.com/vi/2N9OXjfsrps/hqdefault.jpg', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fvideoplayback.mp4?alt=media&token=4415cdef-1467-4d5c-9e79-4bcfab7f691d'),
('d14d1cb551064b87959ce062e49b8d4SSSDSaSDASxNNSDDc', 'ALEJANDRO UNCENSORED EDITION', 'WHAT CAN WE SAY ABOUT ALEJANDRO? HONESTLY WE ARE STILL SHOCKED SINCE 2010', 540, 'https://th.bing.com/th/id/R.e574ed855c89eff9fa3ba4a1a0abd72b?rik=grwtcKQxos60Eg&riu=http%3a%2f%2fimages4.fanpop.com%2fimage%2fphotos%2f19900000%2fAlejandro-lady-gaga-19977066-1238-798.jpg&ehk=bXhmNExLwiXAl6R3zcyVpMTJYbITDlo%2bX24SC%2b8wKF0%3d&risl=&pid=ImgRaw&r=0', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Lady%20Gaga%20%20Alejandro%20Official%20Music%20Video_720p.mp4?alt=media&token=8d817ed4-414b-4a7c-95f3-40193f3feb63'),
('d14d1cDFxb551064b87959ce062DSFXXe49b8d4SDSaSDASxNNSDDc', 'LADY GAGA JUDAS', 'WHAT CAN WE SAY ABOUT JUDAS? PROBABLY WE ARE IN LOVE TOO', 580, 'https://th.bing.com/th/id/R.647d24f015308a81abe8506754413b65?rik=m54Ls%2feCdLQjlA&riu=http%3a%2f%2fimages4.fanpop.com%2fimage%2fphotos%2f21800000%2fLady-Gaga-Judas-Music-Video-lady-gaga-21875940-1700-802.jpg&ehk=aIx76O%2fHA7rjJhL3xxvxxTxX9kB2UugegSrb9dS3ySc%3d&risl=&pid=ImgRaw&r=0', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Lady%20Gaga%20%20Judas%20Official%20Music%20Video_720p.mp4?alt=media&token=0828c702-3774-41ef-97f2-42591aa9193a'),
('d14SDd1cb551064b87959ce062DSSDSDFXXe49b8d4SDSaSDASxNNSDDc', 'LADY GAGA LOVEGAME', 'ARE YOU ON A MISSION?', 540, 'https://th.bing.com/th/id/R.92b3d6a72a5a3ba2626cccccd6487426?rik=oIZXuXTJpPwlyg&pid=ImgRaw&r=0', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Lady%20Gaga%20%20LoveGame%20Official%20Music%20Video_720p.mp4?alt=media&token=dab2e8d1-f760-4cea-b889-7be74d3f94d6'),
('d14SDd1cb551064b87959ce062DSSDSDFXXe49xb8d4SDSaSDSDSXXASxSDSdfDsxcsNNSDDc', 'RIHANNA MAN DOWN', 'HOW DANGEROUS CAN LOVE BE?', 360, 'https://th.bing.com/th/id/R.9d520f4d9f1b6f86974ee8397cada0ad?rik=n0Pfck36VjQSXQ&riu=http%3a%2f%2fimages4.fanpop.com%2fimage%2fphotos%2f22500000%2fRihanna-Man-Down-rihanna-22547563-1117-517.jpg&ehk=JDPoCeKFND%2fKL1wg3yBsjcYLqsUQUBi6lJdss0SdpmU%3d&risl=&pid=ImgRaw&r=0', 'c2d4913d8ef080d76d32d2def25d6a58cff39216c2fe708393d09c27992e27e8', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Rihanna%20%20Man%20Down_480p.mp4?alt=media&token=907fe815-8b76-4e71-96c3-58e01b1eb578'),
('d14SDd1cb551064b87959ce062DSSDSDFXXe49xDFb8d4SDSaSDASxSDSdfDsxcsNNSDDc', 'HUNG UP CONCERT DOCUMENTARY', 'TIMES GOES BY SO SLOWLY', 540, 'https://th.bing.com/th/id/OIP.O5iAboAkT6pMcTw6YHb24wHaEK?rs=1&pid=ImgDetMain', 'e5aaccbe1ebafbca5e9fd2794431862f', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Madonna%20%20Hung%20Up%20Live%20at%20the%202005%20MTV%20EMAs_720p.mp4?alt=media&token=76f5ad63-c8a4-475d-a2a5-49b1ba565379'),
('d14SDd1cb551064b87959ce062DSSDSDFXXe49xDFbCVBB8d4SDSaSDASxSDSdfDsxcX35bnsNNSDDc', 'VOGUE  CONCERT DOCUMENTARY', 'TIMES GOES BY SO SLOWLY', 500, 'https://th.bing.com/th/id/R.f33cadc676c4e558baf75058e90de44f?rik=pdF9223Ae2UGPA&pid=ImgRaw&r=0', 'e5aaccbe1ebafbca5e9fd2794431862f', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Madonna%20%20Vogue%20Official%20Video_480p.mp4?alt=media&token=3d276720-4187-4124-93df-05ab4e0679e7'),
('d14SDd1cb551064b87959ce062DSSDSDFXXe4fg439b8d4SDBNNAZ344SaSDASxSDSDsxcsNNSDDc', 'CHROMATICA DOCUMENTARY', 'EXPLORE LADY GAGA CHROMATICA IN A DEEPER WAY', 1320, 'https://i.pinimg.com/originals/f9/35/f7/f935f783bec66c0214bd3a99b09009a5.jpg', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20PROLOGUE%20Episode%201%20%20The%20Chromatica%20Ball%20Documentary_1080p.mp4?alt=media&token=a29c83cf-49d0-4101-9acf-d20b7c8f00e9');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`),
  ADD KEY `fk_artist` (`id_artist`),
  ADD KEY `fk_genre` (`id_genre`);

--
-- Indices de la tabla `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id_artist`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`bitacoracod`);

--
-- Indices de la tabla `carretilla`
--
ALTER TABLE `carretilla`
  ADD PRIMARY KEY (`usercod`,`productId`),
  ADD KEY `productId_idx` (`productId`);

--
-- Indices de la tabla `carretillaanon`
--
ALTER TABLE `carretillaanon`
  ADD PRIMARY KEY (`anoncod`,`productId`),
  ADD KEY `productIdx_id` (`productId`);

--
-- Indices de la tabla `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id_favorite`);

--
-- Indices de la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD PRIMARY KEY (`fncod`);

--
-- Indices de la tabla `funciones_roles`
--
ALTER TABLE `funciones_roles`
  ADD PRIMARY KEY (`rolescod`,`fncod`),
  ADD KEY `rol_funcion_key_idx` (`fncod`);

--
-- Indices de la tabla `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id_genre`);

--
-- Indices de la tabla `highligths`
--
ALTER TABLE `highligths`
  ADD PRIMARY KEY (`highligths_id`);

--
-- Indices de la tabla `highligthsplaylist`
--
ALTER TABLE `highligthsplaylist`
  ADD PRIMARY KEY (`highligths_id`,`playlist_id`);

--
-- Indices de la tabla `lognonuser`
--
ALTER TABLE `lognonuser`
  ADD PRIMARY KEY (`id_logNonUser`,`log_date`);

--
-- Indices de la tabla `loguser`
--
ALTER TABLE `loguser`
  ADD PRIMARY KEY (`user_cod`,`date`);

--
-- Indices de la tabla `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id_offer`);

--
-- Indices de la tabla `offersubscription`
--
ALTER TABLE `offersubscription`
  ADD PRIMARY KEY (`id_offer`,`id_subscription`);

--
-- Indices de la tabla `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id_playlist`);

--
-- Indices de la tabla `playlistsongs`
--
ALTER TABLE `playlistsongs`
  ADD PRIMARY KEY (`playlist_id`);

--
-- Indices de la tabla `popularity`
--
ALTER TABLE `popularity`
  ADD PRIMARY KEY (`id_popularity`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productId`);

--
-- Indices de la tabla `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id_purchase`),
  ADD KEY `fk_purchase_usercod` (`usercod`);

--
-- Indices de la tabla `purchasedetail`
--
ALTER TABLE `purchasedetail`
  ADD PRIMARY KEY (`id_purchase`,`id_item_reference`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rolescod`);

--
-- Indices de la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD PRIMARY KEY (`usercod`,`rolescod`),
  ADD KEY `rol_usuario_key_idx` (`rolescod`);

--
-- Indices de la tabla `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`id_song`);

--
-- Indices de la tabla `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id_subscription`);

--
-- Indices de la tabla `subscriptionuser`
--
ALTER TABLE `subscriptionuser`
  ADD PRIMARY KEY (`usercod`,`id_subscription`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usercod`),
  ADD UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  ADD KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id_video`),
  ADD KEY `fk_video_artist` (`artist_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `bitacoracod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `productId` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9223372036854775807;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `fk_artist` FOREIGN KEY (`id_artist`) REFERENCES `artist` (`id_artist`),
  ADD CONSTRAINT `fk_genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`);

--
-- Filtros para la tabla `carretilla`
--
ALTER TABLE `carretilla`
  ADD CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carretillaanon`
--
ALTER TABLE `carretillaanon`
  ADD CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `funciones_roles`
--
ALTER TABLE `funciones_roles`
  ADD CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `fk_purchase_usercod` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`);

--
-- Filtros para la tabla `purchasedetail`
--
ALTER TABLE `purchasedetail`
  ADD CONSTRAINT `fk_purchase_idpurchase` FOREIGN KEY (`id_purchase`) REFERENCES `purchase` (`id_purchase`),
  ADD CONSTRAINT `purchasedetail_ibfk_1` FOREIGN KEY (`id_purchase`) REFERENCES `purchase` (`id_purchase`);

--
-- Filtros para la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `fk_video_artist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id_artist`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
