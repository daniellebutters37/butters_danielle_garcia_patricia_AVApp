-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 11, 2019 at 10:06 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_video_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genre`
--

CREATE TABLE `tbl_genre` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_genre`
--

INSERT INTO `tbl_genre` (`genre_id`, `genre_name`) VALUES
(1, 'Drama'),
(2, 'Comedy'),
(3, 'Crime'),
(4, 'Romance'),
(5, 'Action'),
(6, 'Thriller'),
(7, 'Fantasy');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

CREATE TABLE `tbl_rating` (
  `rating_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `stars` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_rating`
--

INSERT INTO `tbl_rating` (`rating_id`, `video_id`, `user_id`, `stars`, `time`) VALUES
(2, 77, 3, 4, 1552159791),
(11, 78, 4, 1, 1552161082),
(15, 80, 5, 3, 1552331546);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` mediumint(8) NOT NULL,
  `user_fname` varchar(250) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `user_pass` varchar(250) NOT NULL,
  `user_email` varchar(250) NOT NULL,
  `user_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_ip` varchar(50) NOT NULL,
  `last_visit` varchar(12) NOT NULL,
  `account_lockout` int(11) NOT NULL,
  `user_access` tinyint(4) NOT NULL,
  `user_admin` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_fname`, `user_name`, `user_pass`, `user_email`, `user_date`, `user_ip`, `last_visit`, `account_lockout`, `user_access`, `user_admin`) VALUES
(4, 'Danielle', 'danielle', '81dc9bdb52d04dc20036dbd8313ed055', 'danielle@gmail.com', '2019-03-09 18:36:17', '::1', '1551908403', 0, 3, 1),
(5, 'Patsy', 'Patsy', '81dc9bdb52d04dc20036dbd8313ed055', 'patsy@gmail.com', '2019-03-11 21:51:43', '::1', '1551927402', 0, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_video`
--

CREATE TABLE `tbl_video` (
  `video_id` int(11) NOT NULL,
  `video_title` varchar(40) NOT NULL,
  `video_director` varchar(20) NOT NULL,
  `video_desc` text NOT NULL,
  `video_duration` time NOT NULL,
  `video_uploadDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `video_url` varchar(20) NOT NULL,
  `video_image` varchar(20) NOT NULL,
  `video_rating` smallint(5) NOT NULL,
  `video_age_rating` int(3) NOT NULL DEFAULT '1',
  `video_visits` smallint(10) NOT NULL,
  `video_year` year(4) NOT NULL,
  `video_type` varchar(10) NOT NULL DEFAULT 'movie'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_video`
--

INSERT INTO `tbl_video` (`video_id`, `video_title`, `video_director`, `video_desc`, `video_duration`, `video_uploadDate`, `video_url`, `video_image`, `video_rating`, `video_age_rating`, `video_visits`, `video_year`, `video_type`) VALUES
(76, 'Happy Gilmore', 'Dennis Dugan', 'All Happy Gilmore has ever wanted is to be a professional hockey player. But he soon discovers he may actually have a talent for playing an entirely different sport: golf. When his grandmother learns she is about to lose her home, Happy joins a golf tournament to try and win enough money to buy it for her. With his powerful driving skills and foulmouthed attitude, Happy becomes an unlikely golf hero -- much to the chagrin of the well-mannered golf professionals.', '01:33:00', '2019-03-07 23:07:18', 'happy_gilmore.mp4', 'happy_gilmore.jpg', 3, 2, 75, 1996, 'Movie'),
(77, 'Enemy', 'Denis Villeneuve', 'A mild-mannered college professor discovers a look-alike actor and delves into the other man\'s private affairs.', '01:35:00', '2019-03-07 23:07:16', 'enemy.mp4', 'enemy.jpg', 5, 1, 460, 2013, 'Movie'),
(78, 'The Lego Movie', 'Chris Miller', 'Emmet, an ordinary LEGO figurine who always follows the rules, is mistakenly identified as the Special -- an extraordinary being and the key to saving the world. He finds himself drafted into a fellowship of strangers who are on a mission to stop an evil tyrant\'s plans to conquer the world. Unfortunately for Emmet, he is hopelessly -- and hilariously -- unprepared for such a task, but he\'ll give it his all nonetheless.', '01:41:00', '2019-03-07 23:07:14', 'lego_movie.mp4', 'lego_movie.jpg', 5, 3, 579, 2014, 'Movie'),
(79, 'The Mask', 'Chuck Russell', 'When timid bank clerk Stanley Ipkiss discovers a magical mask containing the spirit of the Norse god Loki, his entire life changes. While wearing the mask, Ipkiss becomes a supernatural playboy exuding charm and confidence which allows him to catch the eye of local nightclub singer Tina Carlyle. Unfortunately, under the mask\'s influence, Ipkiss also robs a bank, which angers junior crime lord Dorian Tyrell, whose goons get blamed for the heist.', '01:41:00', '2019-03-07 23:07:10', 'mask.mp4', 'mask.jpg', 3, 2, 113, 1994, 'Movie'),
(80, 'Calvary', 'John McDonagh', 'An honest and good-hearted priest wrestles with a cynical, spiteful community after he receives a death threat from an unknown parishioner.', '01:42:00', '2019-03-07 23:07:07', 'calvary.mp4', 'calvary.jpg', 5, 1, 384, 2014, 'Movie'),
(81, 'What If', 'Michael Dowse', 'A medical-school dropout tries to hide his attraction to his new friend, a bubbly artist who already has a boyfriend.', '01:42:00', '2019-03-07 23:07:02', 'what_if.mp4', 'what_if.jpg', 3, 2, 97, 2013, 'Movie'),
(82, 'Dazed and Confused', 'Richard Linklater', 'This coming-of-age film follows the mayhem of group of rowdy teenagers in Austin, Texas, celebrating the last day of high school in 1976. The graduating class heads for a popular pool hall and joins an impromptu keg party, however star football player Randall \"Pink\" Floyd has promised to focus on the championship game and abstain from partying. Meanwhile, the incoming freshmen try to avoid being hazed by the seniors, most notably the sadistic bully Fred O’Bannion.', '01:43:00', '2019-03-07 23:07:00', 'dazed_confused.mp4', 'dazed_confused.jpg', 5, 2, 289, 1993, 'Movie'),
(83, 'Starred Up', 'David Mackenzie', 'An explosive teenager runs into his equally violent father after being switched to an adult prison from a facility for juveniles.', '01:46:00', '2019-03-07 23:06:58', 'starred_up.mp4', 'starred_up.jpg', 5, 1, 872, 2013, 'Movie'),
(84, 'The Adventures of TinTin', 'Steven Spielberg', 'While shopping at an outdoor market, young reporter Tintin, accompanied by his faithful dog, Snowy, buys a model of an old ship called the Unicorn. A shady character named Sakharine and later an American named Barnaby try to buy the model from him, but Tintin refuses. The lad discovers that the ship contains a clue about a hidden treasure, but before he can locate it, Tintin is kidnapped and given over to the custody of drunken Capt. Haddock.', '01:47:00', '2019-03-07 23:06:51', 'tintin.mp4', 'tintin.jpg', 3, 3, 225, 2011, 'Movie'),
(85, 'Black Swan', 'Darren Aronofsky', 'Nina is a ballerina whose passion for the dance rules every facet of her life. When the company\'s artistic director decides to replace his prima ballerina for their opening production of \"Swan Lake,\" Nina is his first choice. She has competition in newcomer Lily however. While Nina is perfect for the role of the White Swan, Lily personifies the Black Swan. As rivalry between the two dancers transforms into a twisted friendship, Nina\'s dark side begins to emerge.', '01:48:00', '2019-03-07 23:06:46', 'black_swan.mp4', 'black_swan.jpg', 4, 1, 418, 2010, 'Movie'),
(86, 'Children of Men', 'Alfonso Cuaron', 'When infertility threatens mankind with extinction and the last child born has perished, a disillusioned bureaucrat becomes the unlikely champion in the fight for the survival of Earth\'s population; He must face down his own demons and protect the planet\'s last remaining hope from danger.', '01:54:00', '2019-03-07 23:06:43', 'children_men.mp4', 'children_men.jpg', 5, 2, 532, 2006, 'Movie'),
(87, 'RocknRolla', 'Guy Ritchie', 'Small-time crooks One Two and Mumbles decide to legitimately invest in some prime real estate and find themselves out of their depth and in debt to old-school London gangster Lenny Cole. Cole himself is in the middle of a business deal with a Russian gangster, but when his accountant tips off One Two and Mumbles to the details of an upcoming big-money business transaction, the two scallywags swoop in and steal the cash.', '01:54:00', '2019-03-07 23:06:39', 'rocknrolla.mp4', 'rocknrolla.jpg', 3, 2, 621, 2008, 'Movie'),
(88, 'Blade Runner', 'Ridley Scott', 'Deckard is forced by the police Boss to continue his old job as Replicant Hunter. His assignment: eliminate four escaped Replicants from the colonies who have returned to Earth. Before starting the job, Deckard goes to the Tyrell Corporation and he meets Rachel, a Replicant girl he falls in love with.', '01:57:00', '2019-03-07 23:06:36', 'blade_runner.mp4', 'blade_runner.jpg', 5, 2, 779, 1982, 'Movie'),
(89, 'Room', 'Lenny Abrahamson', 'Held captive for years in an enclosed space, a woman and her young son finally gain their freedom, allowing the boy to experience the outside world for the first time.', '01:58:00', '2019-03-07 23:06:30', 'room.mp4', 'room.jpg', 5, 2, 572, 2015, 'Movie'),
(90, 'The Big Lebowski', 'The Coen Brothers', 'Jeff `The Dude\' Leboswki is mistaken for Jeffrey Lebowski, who is The Big Lebowski. Which explains why he\'s roughed up and has his precious rug peed on. In search of recompense, The Dude tracks down his namesake, who offers him a job. His wife has been kidnapped and he needs a reliable bagman. Aided and hindered by his pals Walter Sobchak, a Vietnam vet, and Donny, master of stupidity.', '01:59:00', '2019-03-07 23:06:25', 'big_lebowski.mp4', 'big_lebowski.jpg', 5, 2, 765, 1998, 'Movie'),
(91, 'Love and Mercy', 'Bill Pohlad', 'In the late 1960s, the Beach Boys\' Brian Wilson stops touring, produces \"Pet Sounds\" and begins to lose his grip on reality. By the 1980s, Wilson, under the sway of a controlling therapist, finds a savior in Melinda Ledbetter.', '02:01:00', '2019-03-07 23:06:20', 'love_mercy.mp4', 'love_mercy.jpg', 5, 2, 883, 2014, 'Movie'),
(92, 'E.T.', 'Steven Spielberg', 'After a gentle alien becomes stranded on Earth, the being is discovered and befriended by a young boy named Elliott. Bringing the extraterrestrial into his suburban California house, Elliott introduces E.T., as the alien is dubbed, and the children decide to keep its existence a secret.', '02:01:00', '2019-03-07 23:06:16', 'et.mp4', 'et.jpg', 5, 2, 903, 1982, 'Movie'),
(93, 'The Notebook', 'Nick Cassavetes', 'In 1940s South Carolina, mill worker Noah Calhoun and rich girl Allie are desperately in love. But her parents don\'t approve. When Noah goes off to serve in World War II, it seems to mark the end of their love affair. In the interim, Allie becomes involved with another man. But when Noah returns to their small town years later, on the cusp of Allie\'s marriage, it soon becomes clear that their romance is anything but over.', '02:04:00', '2019-03-07 23:06:10', 'notebook.mp4', 'notebook.jpg', 2, 2, 658, 2004, 'Movie'),
(94, 'Hannibal', 'Ridley Scott', 'Seven years have passed since Dr. Hannibal Lecter escaped from custody. The doctor is now at large in Europe. Mason Verger remembers Lecter too, and is obsessed with revenge. Verger was Dr. Lecter\'s sixth victim, and though horribly disfigured, has survived. Verger realizes that to draw the doctor into the open, he must use someone as bait: Clarice Starling.', '02:12:00', '2019-03-07 23:06:06', 'Hannibal.mp4', 'hannibal.jpg', 3, 1, 651, 2001, 'Movie'),
(95, 'Bridesmaids', 'Paul Feig', 'Annie is a single woman whose own life is a mess, but when she learns that her lifelong best friend, Lillian, is engaged, she has no choice but to serve as the maid of honor. Though lovelorn and almost penniless, Annie, nevertheless, winds her way through the strange and expensive rituals associated with her job as the bride\'s go-to gal. Determined to make things perfect, she gamely leads Lillian and the other bridesmaids down the wild road to the wedding.', '02:12:00', '2019-03-07 23:06:01', 'bridesmaids.mp4', 'bridesmaids.jpg', 5, 2, 686, 2011, 'Movie'),
(96, 'Donnie Darko', 'Richard Kelly', 'During the presidential election of 1988, a teenager named Donnie Darko sleepwalks out of his house one night and sees a giant, demonic-looking rabbit named Frank, who tells him the world will end in 28 days. When Donnie returns home, he finds that a jet engine has crashed into his bedroom. Is Donnie living in a parallel universe, is he suffering from mental illness - or will the world really end?', '02:14:00', '2019-03-07 23:05:58', 'donnie_darko.mp4', 'donnie_darko.jpg', 5, 1, 774, 2001, 'Movie'),
(97, 'Man on Fire', 'Tony Scott', 'In a Mexico City wracked by a recent wave of kidnappings, ex-CIA operative John Creasy reluctantly accepts a job as a bodyguard for 9-year-old Lupita, the daughter of wealthy businessman Samuel Ramos. Just as Creasy begins to develop a fondness for the young girl, a bloodthirsty gunman kidnaps her. Now, Creasy must pick off a succession of corrupt cops and criminals to reach his ultimate object of vengeance.', '02:27:00', '2019-03-07 23:05:55', 'man_fire.mp4', 'man_fire.jpg', 2, 2, 446, 2014, 'Movie'),
(98, 'The Blues Brothers', 'John Landis', 'After his release from prison, Jake reunites with his brother, Elwood -- collectively known as the \"Blues Brothers.\" Jake\'s first task is to save the orphanage the brothers grew up in from closing, by raising $5,000 to pay back taxes. The two are convinced they can earn the money by getting their old band back together.', '02:28:00', '2019-03-07 23:05:52', 'blues_brothers.mp4', 'blues_brothers.jpg', 3, 2, 286, 1980, 'Movie'),
(99, 'Fight Club', 'David Fincher', '\r\nA depressed man suffering from insomnia meets a strange soap salesman named Tyler Durden and soon finds himself living in his squalid house after his perfect apartment is destroyed. The two bored men form an underground club with strict rules and fight other men who are fed up with their mundane lives. Their perfect partnership frays when Marla, a fellow support group crasher, attracts Tyler\'s attention.', '02:31:00', '2019-03-07 23:05:49', 'fight_club.mp4', 'fight_club.jpg', 4, 1, 713, 1999, 'Movie'),
(100, 'Pulp Fiction', 'Quentin Tarantino', 'Vincent Vega and Jules Winnfield are hitmen with a penchant for philosophical discussions. In this ultra-hip, multi-strand crime movie, their storyline is interwoven with those of their boss, gangster Marsellus Wallace.', '02:58:00', '2019-03-07 23:05:47', 'pulp_fiction.mp4', 'pulp_fiction.jpg', 5, 1, 901, 1994, 'Movie'),
(101, 'Friends', 'Marta Kauffman', 'Follows the personal and professional lives of six twenty to thirty-something-year-old friends living in Manhattan. Rachel Green, Ross Geller, Monica Geller, Joey Tribbiani, Chandler Bing and Phoebe Buffay are six 20 something year-olds, living off of one another in the heart of New York City.', '00:00:00', '2019-03-10 22:52:05', 'friends.mp4', 'friends.jpg', 4, 2, 1, 1994, 'TV Show'),
(102, 'Black Mirror', 'Charlie Brooker', 'A British science fiction anthology television series. It examines modern society, particularly with regard to the unanticipated consequences of new technologies. Episodes are standalone, usually set in an alternative present or the near future, often with a dark and satirical tone, though some are more experimental and lighter.', '00:00:00', '2019-03-07 22:36:22', 'black_mirror.mp4', 'black_mirror.jpg', 5, 1, 1, 2011, 'TV Show'),
(103, 'Bob\'s Burgers', 'Loren Bouchard', 'Bob\'s Burgers centers on the Belcher family (consists of Bob, Linda, Tina, Gene and Louise) who own a hamburger restaurant. ... Bob Belcher, a father with bad luck, runs his Burger restaurant with his three mischievous children and his wife, Linda.', '00:00:00', '2019-03-07 23:05:35', 'bob_burgers.mp4', 'bob_burgers.jpg', 4, 3, 1, 2012, 'TV Show'),
(104, 'Game of Thrones', 'David Benioff', 'A Game of Thrones takes place over the course of one year on or near the fictional continent of Westeros. The story begins when King Robert visits the northern castle Winterfell to ask Ned Stark to be his right-hand assistant, or Hand of the King.', '00:00:00', '2019-03-07 23:05:39', 'game_thrones.mp4', 'game_thrones.jpg', 5, 1, 1, 2011, 'TV Show');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_video_genre`
--

CREATE TABLE `tbl_video_genre` (
  `video_genre_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_video_genre`
--

INSERT INTO `tbl_video_genre` (`video_genre_id`, `video_id`, `genre_id`) VALUES
(1, 76, 2),
(2, 77, 6),
(3, 78, 2),
(4, 79, 5),
(5, 80, 1),
(6, 81, 4),
(7, 82, 2),
(8, 83, 1),
(9, 84, 5),
(10, 85, 1),
(11, 86, 1),
(12, 87, 3),
(13, 88, 7),
(14, 89, 1),
(15, 90, 2),
(16, 91, 1),
(17, 92, 5),
(18, 93, 4),
(19, 94, 6),
(20, 95, 2),
(21, 96, 1),
(22, 97, 3),
(23, 98, 2),
(24, 99, 5),
(25, 100, 5),
(26, 101, 2),
(27, 102, 5),
(28, 103, 2),
(29, 104, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_genre`
--
ALTER TABLE `tbl_genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_video`
--
ALTER TABLE `tbl_video`
  ADD PRIMARY KEY (`video_id`);

--
-- Indexes for table `tbl_video_genre`
--
ALTER TABLE `tbl_video_genre`
  ADD PRIMARY KEY (`video_genre_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_genre`
--
ALTER TABLE `tbl_genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_video`
--
ALTER TABLE `tbl_video`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `tbl_video_genre`
--
ALTER TABLE `tbl_video_genre`
  MODIFY `video_genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
