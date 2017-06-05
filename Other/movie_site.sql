-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-06-05 09:59:16
-- 服务器版本： 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_site`
--

-- --------------------------------------------------------

--
-- 表的结构 `t_level`
--

DROP TABLE IF EXISTS `t_level`;
CREATE TABLE IF NOT EXISTS `t_level` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL,
  `min_words` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_mail`
--

DROP TABLE IF EXISTS `t_mail`;
CREATE TABLE IF NOT EXISTS `t_mail` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `umail` varchar(100) NOT NULL,
  `vertify_code` varchar(6) DEFAULT NULL,
  `last_request_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `umail` (`umail`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_message`
--

DROP TABLE IF EXISTS `t_message`;
CREATE TABLE IF NOT EXISTS `t_message` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user_sender_id` int(11) NOT NULL,
  `user_receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'new',
  `post_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_movie_cate`
--

DROP TABLE IF EXISTS `t_movie_cate`;
CREATE TABLE IF NOT EXISTS `t_movie_cate` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL DEFAULT '',
  `access_pwd` varchar(50) NOT NULL DEFAULT '',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uname` (`cate_name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_movie_cate`
--

INSERT INTO `t_movie_cate` (`uid`, `cate_name`, `display_name`, `access_pwd`, `is_active`, `create_time`) VALUES
(1, '科幻', '	 科幻', '', 1, '2017-06-02 19:18:48'),
(2, '喜剧', '	 喜剧', '', 1, '2017-06-02 19:19:09'),
(3, '', '未分类', '', 1, '2017-06-02 19:21:37'),
(4, '火车', '火车', '', 0, '2017-06-02 19:23:07');

-- --------------------------------------------------------

--
-- 表的结构 `t_movie_info`
--

DROP TABLE IF EXISTS `t_movie_info`;
CREATE TABLE IF NOT EXISTS `t_movie_info` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `GUID` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `rank` float NOT NULL DEFAULT '0',
  `authors` varchar(200) DEFAULT NULL,
  `src_root` varchar(200) NOT NULL,
  `cover` varchar(200) NOT NULL,
  `src_path` varchar(200) NOT NULL,
  `categorys` varchar(200) DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT '1',
  `discount` int(11) NOT NULL DEFAULT '0',
  `description` text,
  `meta_key` text,
  `meta_desc` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_movie_info`
--

INSERT INTO `t_movie_info` (`uid`, `GUID`, `user_id`, `title`, `rank`, `authors`, `src_root`, `cover`, `src_path`, `categorys`, `price`, `discount`, `description`, `meta_key`, `meta_desc`, `is_active`, `create_time`, `update_time`) VALUES
(1, '479d4ea271204159b130c025944c562c', 1, 'X战警：T启.X-Men.Apocalypse.2016.TC720P.X264.AAC.English.CHS.Mp4Ba.mp4', 0, NULL, 'http://10.8.145.150:8082', '/X战警-天启/cover.png', '/X战警-天启/X战警：T启.X-Men.Apocalypse.2016.TC720P.X264.AAC.English.CHS.Mp4Ba.mp4', NULL, 4, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(2, 'c41a0221bdc34b708467bc539574e74e', 1, '云中行走.The.Walk.2015.1080p.WEBRip.x264.AAC2.0-FGT.mp4', 0, NULL, 'http://10.8.145.150:8082', '/云中行走/cover.png', '/云中行走/The.Walk.2015.1080p.WEBRip.x264.AAC2.0-FGT.mp4', NULL, 4, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(3, '3c9ae9a76445408d95b4ac45ca0ff7bf', 1, '你的名字.720p.HD中字.mp4', 0, NULL, 'http://10.8.145.150:8082', '/你的名字/cover.png', '/你的名字/你的名字.720p.HD中字.mp4', NULL, 2, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(4, '43e032c02bfb42b680e2f25640ee7247', 1, '僵尸肖恩BD中英双字[电影天堂www.dy2018.com].rmvb', 0, NULL, 'http://10.8.145.150:8082', '/僵尸肖恩/cover.png', '/僵尸肖恩/僵尸肖恩BD中英双字[电影天堂www.dy2018.com].rmvb', NULL, 1, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(5, '6ad2957907d24983bdede0b41c694637', 1, '刺客信条.720p.HD.mp4', 0, NULL, 'http://10.8.145.150:8082', '/刺客信条/cover.png', '/刺客信条/刺客信条.720p.HD.mp4', NULL, 2, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(6, 'c20e72f9f41145b2a200bc80ef6922ea', 1, '另一个地球.Another.Earth.2011.720p.BluRay.x264.DTS-WiKi.mkv', 0, NULL, 'http://10.8.145.150:8082', '/另一个地球/cover.png', '/另一个地球/Another.Earth.2011.720p.BluRay.x264.DTS-WiKi.mkv', NULL, 1, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(7, '9f261e4918f949aeb9b1e4cd4a55f6c4', 1, '复仇者联盟2：奥创纪元.BD1280超清国英双语特效中英双字.mp4', 0, NULL, 'http://10.8.145.150:8082', '/复仇者联盟2/cover.png', '/复仇者联盟2/复仇者联盟2：奥创纪元.BD1280超清国英双语特效中英双字.mp4', NULL, 4, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(8, '75cd5a766a514b92bfa85e37e5b3708b', 1, '大鱼海棠.HD1280.mp4', 0, NULL, 'http://10.8.145.150:8082', '/大鱼海棠/cover.png', '/大鱼海棠/大鱼海棠.HD1280.mp4', NULL, 2, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(9, '1c1f669582b04b64ad334179d8d2a2e3', 1, '寄生兽.Parasyte.2014.HD1080P.x264.日语中文字幕.rarbt.mp4', 0, NULL, 'http://10.8.145.150:8082', '/寄生兽/cover.png', '/寄生兽/寄生兽.Parasyte.2014.HD1080P.x264.日语中文字幕.rarbt.mp4', NULL, 3, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(10, '49c5ea2dc23d4c249e2df7c3a6dd5a22', 1, '[惊变28周]28.Weeks.Later.2007.bluray.x264.720P.AC3-CMCT.mkv', 0, NULL, 'http://10.8.145.150:8082', '/惊变28周/cover.png', '/惊变28周/[惊变28周]28.Weeks.Later.2007.bluray.x264.720P.AC3-CMCT.mkv', NULL, 3, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(11, 'aa3e94bbbcbb4c08bd6dc8f2603d82cb', 1, '摔跤吧!爸爸.720p.HD完美中字.mp4', 0, NULL, 'http://10.8.145.150:8082', '/摔跤吧爸爸/cover.png', '/摔跤吧爸爸/摔跤吧.爸爸.Dangal.2016.Hindi.HDRip.1080p.x264.AC3.5.1-中文字幕-RARBT.mp4', NULL, 3, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(12, 'a884e902af65410abc625389c5743d47', 1, '无名女尸.The.Autopsy.of.Jane.Doe.2016.mkv', 0, NULL, 'http://10.8.145.150:8082', '/无名女尸/cover.png', '/无名女尸/The.Autopsy.of.Jane.Doe.2016.mkv', NULL, 3, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(13, '0e69773b52ef4518b5af91d8d9bc0337', 1, '死侍.HD1280高清中英双字.mp4', 0, NULL, 'http://10.8.145.150:8082', '/死侍/cover.png', '/死侍/死侍.HD1280高清中英双字.mp4', NULL, 2, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(14, '340f637bb20d4c44b502466bafee327a', 1, '血战钢锯岭.Hacksaw.Ridge.2016.1080p.WEB-DL.DD5.1.H264-中英双字-RARBT.mp4', 0, NULL, 'http://10.8.145.150:8082', '/血战钢锯岭/cover.png', '/血战钢锯岭/血战钢锯岭.Hacksaw.Ridge.2016.1080p.WEB-DL.DD5.1.H264-中英双字-RARBT.mp4', NULL, 3, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(15, 'a5621dace3e9440caa008d0b6632ed0c', 1, '[辩护人]The.Attorney.2013.BluRay.720p.x264.AC3-CnSCG.mkv', 0, NULL, 'http://10.8.145.150:8082', '/辩护人/cover.png', '/辩护人/[辩护人]The.Attorney.2013.BluRay.720p.x264.AC3-CnSCG.mkv', NULL, 4, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(16, '756dfabb1ffe4e0bbde324c146cd01de', 1, '这个杀手不太冷 Leon.1994.BluRay.720p.x264.AC3-WOFEI.mkv', 0, NULL, 'http://10.8.145.150:8082', '/这个杀手不太冷/cover.png', '/这个杀手不太冷/这个杀手不太冷 Leon.1994.BluRay.720p.x264.AC3-WOFEI.mkv', NULL, 3, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(17, 'a4ee55c578a745dca0db837079611806', 1, '釜山行.mp4', 0, NULL, 'http://10.8.145.150:8082', '/釜山行/cover.png', '/釜山行/釜山行.mp4', NULL, 3, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(18, 'e1b07181cca24d4d85aa65ccae626fe2', 1, '银河护卫队IMAX版.720p.国英双语.BD中英.mp4', 0, NULL, 'http://10.8.145.150:8082', '/银河护卫队/cover.png', '/银河护卫队/银河护卫队IMAX版.720p.国英双语.BD中英.mp4', NULL, 3, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(19, '572c81537b9443838c8d5b80c655c306', 1, '长城.720p.HD.mp4', 0, NULL, 'http://10.8.145.150:8082', '/长城/cover.png', '/长城/长城.720p.HD.mp4', NULL, 2, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(20, 'c99724647a8b4861b96b63036cdc1192', 1, '降临.Arrival.2016.1080p.BluRay.x264-中英双字-RARBT.mp4', 0, NULL, 'http://10.8.145.150:8082', '/降临/cover.png', '/降临/降临.Arrival.2016.1080p.BluRay.x264-中英双字-RARBT.mp4', NULL, 4, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09'),
(21, '1abe7dc03c14494194d7af54869662f8', 1, '隔山有眼.The.Hills.Have.Eyes.2006.UNRATED.720p.BRRip.XviD.AC3-RARBG.avi', 0, NULL, 'http://10.8.145.150:8082', '/隔山有眼/cover.png', '/隔山有眼/The.Hills.Have.Eyes.2006.UNRATED.720p.BRRip.XviD.AC3-RARBG.avi', NULL, 4, 0, NULL, NULL, NULL, 1, '2017-06-04 03:13:09', '2017-06-04 03:13:09');

-- --------------------------------------------------------

--
-- 表的结构 `t_propose`
--

DROP TABLE IF EXISTS `t_propose`;
CREATE TABLE IF NOT EXISTS `t_propose` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `tag` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `post_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_purchase_token`
--

DROP TABLE IF EXISTS `t_purchase_token`;
CREATE TABLE IF NOT EXISTS `t_purchase_token` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uorder` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `token` varchar(32) NOT NULL,
  `purchase_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  KEY `fk_movie_purchase` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_user`
--

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE IF NOT EXISTS `t_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `umail_id` int(11) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `user_level` int(11) NOT NULL DEFAULT '1',
  `pocket` int(11) NOT NULL DEFAULT '50',
  `reg_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `session_key` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `umail_id` (`umail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_watch_record`
--

DROP TABLE IF EXISTS `t_watch_record`;
CREATE TABLE IF NOT EXISTS `t_watch_record` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `last_read_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
