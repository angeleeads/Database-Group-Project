DROP DATABASE IF EXISTS `sql_3rb`;
CREATE DATABASE `sql_3rb`; 
USE `sql_3rb`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;


CREATE TABLE `leagues` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `leagues` VALUES ('Premier League');
INSERT INTO `leagues` VALUES ('Süper League');
INSERT INTO `leagues` VALUES ("Sudi Pro League");
INSERT INTO `leagues` VALUES ("LaLiga");
INSERT INTO `leagues` VALUES ("BundesLeaguea");
INSERT INTO `leagues` VALUES ("Serie A");
INSERT INTO `leagues` VALUES ("League 1");
INSERT INTO `leagues` VALUES ("Leaguea Portugal");
INSERT INTO `leagues` VALUES ("Championship");
INSERT INTO `leagues` VALUES ("Jupiler Pro League");
INSERT INTO `leagues` VALUES ("Eredivisie");
INSERT INTO `leagues` VALUES ("MLS");
INSERT INTO `leagues` VALUES ("Hindistan");
INSERT INTO `leagues` VALUES ("Brezilya");
INSERT INTO `leagues` VALUES ("Other");

CREATE TABLE `teams` (
  `name` varchar(100) NOT NULL,
  `league` varchar(50) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `FK_team_league_idx` (`league`),
  CONSTRAINT `FK_team_league` FOREIGN KEY (`league`) REFERENCES `leagues` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `teams` VALUES ('Porto',"LaLiga");
INSERT INTO `teams` VALUES ('BVB',"BundesLeaguea");
INSERT INTO `teams` VALUES ('Roma',"Serie A");
INSERT INTO `teams` VALUES ('Liverpool','Premier League');
INSERT INTO `teams` VALUES ('Beşiktaş','Süper League');
INSERT INTO `teams` VALUES ('Barcelona',"LaLiga");
INSERT INTO `teams` VALUES ('Fenerbahçe','Süper League');
INSERT INTO `teams` VALUES ('Inter',"Serie A");
INSERT INTO `teams` VALUES ('Sporting CP',"Leaguea Portugal");
INSERT INTO `teams` VALUES ('Al-Ettifaq',"Sudi Pro League");
INSERT INTO `teams` VALUES ('Al-Ittihad',"Sudi Pro League");
INSERT INTO `teams` VALUES ('Leverkusen',"BundesLeaguea");
INSERT INTO `teams` VALUES ('Real Madrid',"LaLiga");
INSERT INTO `teams` VALUES ('Arsenal','Premier League');
INSERT INTO `teams` VALUES ('Real Sociedad',"LaLiga");
INSERT INTO `teams` VALUES ('Tottenham','Premier League');
INSERT INTO `teams` VALUES ('Galatasaray','Süper League');
INSERT INTO `teams` VALUES ('MUN','Premier League');
INSERT INTO `teams` VALUES ('Al-Nassr',"Sudi Pro League");
INSERT INTO `teams` VALUES ('Arouca',"Leaguea Portugal");
INSERT INTO `teams` VALUES ('Karagümrük','Süper League');
INSERT INTO `teams` VALUES ('Samsunspor','Süper League');
INSERT INTO `teams` VALUES ('Man City','Premier League');
INSERT INTO `teams` VALUES ('Fulham','Premier League');
INSERT INTO `teams` VALUES ('Everton','Premier League');
INSERT INTO `teams` VALUES ('Nottingham Forest','Premier League');
INSERT INTO `teams` VALUES ('Chelsea','Premier League');
INSERT INTO `teams` VALUES ('Aston Villa','Premier League');
INSERT INTO `teams` VALUES ('West Ham','Premier League');
INSERT INTO `teams` VALUES ('Newcastle','Premier League');
INSERT INTO `teams` VALUES ('Brighton','Premier League');
INSERT INTO `teams` VALUES ('Bournemouth','Premier League');
INSERT INTO `teams` VALUES ('Crystal Palace','Premier League');
INSERT INTO `teams` VALUES ('Wolves','Premier League');
INSERT INTO `teams` VALUES ('Brentford','Premier League');
INSERT INTO `teams` VALUES ('Burnley','Premier League');
INSERT INTO `teams` VALUES ('Sheffield United','Premier League');
INSERT INTO `teams` VALUES ('Luton Town','Premier League');
INSERT INTO `teams` VALUES ('Southampton','Championship');
INSERT INTO `teams` VALUES ('Toronto FC','MLS');
INSERT INTO `teams` VALUES ('Other',"Other");

CREATE TABLE `players` (
  `name` varchar(100) NOT NULL,
  `team` varchar(100) NOT NULL,
  `position` varchar(3) default null,
  PRIMARY KEY (`name`,`team`),
  KEY `FK_team_idx` (`team`),
  CONSTRAINT `FK_team` FOREIGN KEY (`team`) REFERENCES `teams` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `players` VALUES ('Mehdi Taremi',"Porto","ST");
INSERT INTO `players` VALUES ('Altay Bayındır',"MUN","GK");
INSERT INTO `players` VALUES ("Salih Özcan","BVB","MF");
INSERT INTO `players` VALUES ('Marco Reus',"BVB","MF");
INSERT INTO `players` VALUES ('Zeki Çelik',"Roma","RB");
INSERT INTO `players` VALUES ('Joel Matip',"Liverpool","STP");
INSERT INTO `players` VALUES ('Ante Rebic',"Beşiktaş","ST");
INSERT INTO `players` VALUES ('Milot Rashica',"Beşiktaş","RW");
INSERT INTO `players` VALUES ('Gedson Fernandes',"Beşiktaş","MF");
INSERT INTO `players` VALUES ('Eric Bailly',"Beşiktaş","STP");
INSERT INTO `players` VALUES ('İlkay Gündoğan',"Barcelona","MF");
INSERT INTO `players` VALUES ('Joshua King',"Fenerbahçe","ST");
INSERT INTO `players` VALUES ('Karim Benzema',"Al-Ittihad","ST");
INSERT INTO `players` VALUES ('Emre Can',"BVB","MF");
INSERT INTO `players` VALUES ('Stefan de Vrij',"Inter","STP");
INSERT INTO `players` VALUES ('Sebastian Coates',"Sporting CP","STP");
INSERT INTO `players` VALUES ('Talisca',"Al-Nassr","MF");
INSERT INTO `players` VALUES ('Georginio Wijnaldum',"Al-Ettifaq","MF");
INSERT INTO `players` VALUES ('Robert Andrich',"Leverkusen","MF");
INSERT INTO `players` VALUES ('Cengiz Ünder',"Fenerbahçe","RW");
INSERT INTO `players` VALUES ('Livakoviç',"Fenerbahçe","GK");
INSERT INTO `players` VALUES ('Dusan Tadic',"Fenerbahçe","LW");
INSERT INTO `players` VALUES ('Arda Güler',"Real Madrid","MF");
INSERT INTO `players` VALUES ('Thomas Partey',"Arsenal","MF");
INSERT INTO `players` VALUES ('Alex Remiro',"Real Sociedad","GK");
INSERT INTO `players` VALUES ('Heung-min Son',"Tottenham","LW");
INSERT INTO `players` VALUES ('Mauro Icardi',"Galatasaray","ST");
INSERT INTO `players` VALUES ('Lucas Torreira',"Galatasaray","DMF");
INSERT INTO `players` VALUES ('Angelino',"Galatasaray","LB");
INSERT INTO `players` VALUES ('Hakim Ziyech',"Galatasaray","RW");
INSERT INTO `players` VALUES ('Sascha Boey',"Galatasaray","RB");
INSERT INTO `players` VALUES ('Abdülkerim Bardakçı',"Galatasaray","STP");
INSERT INTO `players` VALUES ('Alex Oxlade-Chamberlain',"Beşiktaş","MF");
INSERT INTO `players` VALUES ('Kerem Atakan Kesgin',"Karagümrük","MF");
INSERT INTO `players` VALUES ('Necip Uysal',"Beşiktaş","MF");
INSERT INTO `players` VALUES ('Tayfur Bingöl',"Beşiktaş","MF");
INSERT INTO `players` VALUES ('Onur Bulut',"Beşiktaş","MF");
INSERT INTO `players` VALUES ('Javi Montero',"Arouca","STP");
INSERT INTO `players` VALUES ('Omar Colley',"Beşiktaş","STP");
INSERT INTO `players` VALUES ('Umut Nayir',"Fenerbahçe","ST");
INSERT INTO `players` VALUES ('Alexander Djiku',"Fenerbahçe","STP");
INSERT INTO `players` VALUES ('Burak Elmaz',"Fenerbahçe","ST");
INSERT INTO `players` VALUES ('Mert Müldür',"Fenerbahçe","RB");
INSERT INTO `players` VALUES ('Serdar Aziz',"Fenerbahçe","STP");
INSERT INTO `players` VALUES ('Halil Dervişoğlu',"Galatasaray","RW");
INSERT INTO `players` VALUES ('Taylan Antalyalı',"Samsunspor","MF");
INSERT INTO `players` VALUES ('Kaan Ayhan',"Galatasaray","STP");
INSERT INTO `players` VALUES ('Kazımcan Karataş',"Galatasaray","STP");
INSERT INTO `players` VALUES ('Davinson Sanchez',"Galatasaray","STP");
INSERT INTO `players` VALUES ('Erling Haaland',"Man City","ST");
INSERT INTO `players` VALUES ('Casemiro',"MUN","DMF");
INSERT INTO `players` VALUES ('Martin Odegaard',"Arsenal","MF");
INSERT INTO `players` VALUES ('Virgil van Dijk',"Liverpool",'STP');
INSERT INTO `players` VALUES ('Bruno Guimaraes',"Newcastle","MF");
INSERT INTO `players` VALUES ('Pervis Estupinan',"Brighton",'LB');
INSERT INTO `players` VALUES ('Pau Torres',"Aston Villa",'STP');
INSERT INTO `players` VALUES ('Joao Palhinha',"Fulham",'DF');
INSERT INTO `players` VALUES ('Jordan Pickford',"Everton",'GK');
INSERT INTO `players` VALUES ('Ibrahim Sangare',"Nottingham Forest","DMF");
INSERT INTO `players` VALUES ('Christopher Nkunku',"Chelsea","MF");
INSERT INTO `players` VALUES ('Sandro Tonali',"Newcastle","DMF");
INSERT INTO `players` VALUES ('Moussa Diaby',"Aston Villa","RW");
INSERT INTO `players` VALUES ('Ruben Dias',"Man City",'STP');
INSERT INTO `players` VALUES ('Bruno Fernandes',"MUN","MF");
INSERT INTO `players` VALUES ('Bukayo Saka',"Arsenal","RW");
INSERT INTO `players` VALUES ('Cristian Romero',"Tottenham","STP");
INSERT INTO `players` VALUES ('Reece James',"Chelsea","RB");
INSERT INTO `players` VALUES ('Edson Alvarez',"West Ham","DMF");
INSERT INTO `players` VALUES ('Mohamed Salah',"Liverpool","RW");
INSERT INTO `players` VALUES ('Declan Rice',"Arsenal","DMF");
INSERT INTO `players` VALUES ('Marcus Rashford',"MUN","LW");
INSERT INTO `players` VALUES ('Arnaut Danjuma',"Everton","LW");
INSERT INTO `players` VALUES ('Mohammed Kudus',"West Ham","MF");
INSERT INTO `players` VALUES ('Marc Guehi',"Crystal Palace","STP");
INSERT INTO `players` VALUES ('Odysseas Vlachodimos',"Nottingham Forest","GK");
INSERT INTO `players` VALUES ('Gonzalo Montiel',"Nottingham Forest","RB");
INSERT INTO `players` VALUES ('Luis Sinisterra',"Bournemouth","LW");
INSERT INTO `players` VALUES ('Nayef Aguerd',"West Ham","STP");
INSERT INTO `players` VALUES ('Matheus Cunha',"Wolves","ST");
INSERT INTO `players` VALUES ('Kaoru Mitoma',"Brighton","RW");
INSERT INTO `players` VALUES ('Ethan Pinnock',"Brentford","STP");
INSERT INTO `players` VALUES ('Jordan Beyer',"Burnley","RB");
INSERT INTO `players` VALUES ('Tyler Adams',"Bournemouth","DMF");
INSERT INTO `players` VALUES ('Zeki Amdouni',"Burnley","RW");
INSERT INTO `players` VALUES ('Kevin De Bruyne',"Man City","MF");
INSERT INTO `players` VALUES ('Pedro Neto',"Wolves","RW");
INSERT INTO `players` VALUES ('Issa Diop',"Fulham","STP");
INSERT INTO `players` VALUES ('Justin Kluivert',"Bournemouth","LW");
INSERT INTO `players` VALUES ('Anel Ahmedhodzic',"Sheffield United","STP");
INSERT INTO `players` VALUES ('Marvelous Nakamba',"Luton Town","DMF");
INSERT INTO `players` VALUES ('Jose Sa',"Wolves","GK");
INSERT INTO `players` VALUES ('Pierre-Emile Hojbjerg',"Tottenham","DMF");
INSERT INTO `players` VALUES ('Emiliano Martinez',"Aston Villa","GK");
INSERT INTO `players` VALUES ('Darwin Nunez',"Liverpool","ST");
INSERT INTO `players` VALUES ('Albert Sambi Lokonga',"Luton Town","MF");
INSERT INTO `players` VALUES ('Ansu Fati',"Brighton","LW");
INSERT INTO `players` VALUES ('Thomas Strakosha',"Brentford","GK");
INSERT INTO `players` VALUES ('Vini Souza',"Sheffield United","DMF");
INSERT INTO `players` VALUES ('Sven Botman',"Newcastle","STP");
INSERT INTO `players` VALUES ('Enzo Fernandez',"Chelsea","MF");
INSERT INTO `players` VALUES ('Mikkel Damsgaard',"Brentford","LW");
INSERT INTO `players` VALUES ('Cameron Archer',"Sheffield United","ST");
INSERT INTO `players` VALUES ('Josh Cullen',"Burnley","MF");
INSERT INTO `players` VALUES ('Thomas Kaminski',"Luton Town","GK");
INSERT INTO `players` VALUES ('Beto',"Everton","GK");
INSERT INTO `players` VALUES ('Timothy Castagne',"Fulham","RB");
INSERT INTO `players` VALUES ('Joachim Andersen',"Crystal Palace","STP");
INSERT INTO `players` VALUES ('Eberechi Eze',"Crystal Palace","MF");
INSERT INTO `players` VALUES ('Ryan Fraser',"Southampton","LW");




CREATE TABLE `drafters` (
  `name` varchar(50) NOT NULL,
  `channel_url` varchar(100) default NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `drafters` VALUES ('Onur',"https://www.youtube.com/@OnurOnline");
INSERT INTO `drafters` VALUES ('Ugur', "https://www.youtube.com/@UKarakullukcu");
INSERT INTO `drafters` VALUES ("Arden", "https://www.youtube.com/@ardenpapazyan");
INSERT INTO `drafters` VALUES ("Other", default);





CREATE TABLE `draft_info` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_name` varchar(100) NOT NULL,
  `video_date` date NOT NULL,
  `draft_type` ENUM("Draft","Transfer","Çark","Açık","Diğer") ,
  `video_channel` varchar(50) NOT NULL,
  `budget-limit` int(12) DEFAULT NULL,
  `League-condition` varchar(100) DEFAULT NULL,
  `draft-condition` varchar(100) DEFAULT NULL,
  `league` varchar(100) default "Premier League",
  PRIMARY KEY (`video_id`),
  KEY `FK_video_channel_idx` (`video_channel`),
  KEY `FK_league_idx` (`league`),
  CONSTRAINT `FK_video_channel` FOREIGN KEY (`video_channel`) REFERENCES `drafters` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_league` FOREIGN KEY (`league`) REFERENCES `leagues` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `draft_info` VALUES (1,"FC 24 ÜÇLÜ REBUILD LİGİ BAŞLADI! // ÜÇ BÜYÜKLER TRANSFER REBUILD","2023-10-23","Transfer","Arden",100000000,default,default,"Süper League");
INSERT INTO `draft_info` VALUES (2,"Premier League Her Takımdan 1 Oyuncu! | Üçlü Rebuild Ligi","2023-10-25","Draft","Ugur",default,"Premier League","Her Takımdan Bir Oyuncu",default);
INSERT INTO `draft_info` VALUES (3,"HER FUTBOLCU İÇİN AÇIK ARTTIRMA // FC 24 ÜÇLÜ REBUILD // FC 24 3LÜ REBUILD","2023-10-27","Açık","Onur",default,default,default,default);
INSERT INTO `draft_info` VALUES (4,"FC 24 OVERALL ÇARKI YAPTIK! // ÜÇLÜ REBUILD LİGİ","2023-10-30","Çark","Arden",default,default,default,default);
INSERT INTO `draft_info` VALUES (5,"1 Milyar Euro'ya Şampiyonlar Ligi... FC 24 Üçlü Rebuild","2023-11-01","Transfer","Uğur",1000000000,default,default,default);
INSERT INTO `draft_info` VALUES (6,"LA LİGA HER TAKIMDAN 1 OYUNCU ÜÇLÜ REBUILD // FC 24 ÜÇLÜ REBUILD //","2023-11-03","Draft","Onur",default,default,default,"LaLiga");
INSERT INTO `draft_info` VALUES (7,"BAŞ HARF - SON HARF CHALLENGE! // FC 24 ÜÇLÜ REBUILD LİGİ","2023-11-13","Draft","Arden",default,default,default,default);
INSERT INTO `draft_info` VALUES (8,"6 Diziliş Banlı! Yasaklı League Çarkı Üçlü Rebuild","2023-11-15","Çark","Ugur",default,default,default,default);
INSERT INTO `draft_info` VALUES (9,"1 MİLYAR EURO BÜTÇE REBUILD // EA FC 24 KARİYER MODU","2023-11-15","Çark","Ugur",1000000000,default,default,"Serie A");

ALTER TABLE `draft_info`
ADD COLUMN `url` VARCHAR(255) DEFAULT NULL;


UPDATE `draft_info`
SET `url` = 'https://youtu.be/cup7owuO7DE?si=ovdaYcNJuUbFnEfw'
WHERE `video_id` = 1;

UPDATE `draft_info`
SET `url` = 'https://youtu.be/mHStbcrmXFE?si=yTy2peqgAcrmVWrr'
WHERE `video_id` = 2;

UPDATE `draft_info`
SET `url` = 'https://youtu.be/nHyGAQczIkM?si=Ay5_EFtSD2Iia3tp'
WHERE `video_id` = 3;

UPDATE `draft_info`
SET `url` = 'https://youtu.be/zM27WfvoVHM?si=yhlIy5BHs11eaROJ'
WHERE `video_id` = 4;

UPDATE `draft_info`
SET `url` = 'https://youtu.be/H3H-34vGDtw?si=cwq8kD4rgo8lZKLa'
WHERE `video_id` = 5;

UPDATE `draft_info`
SET `url` = 'https://youtu.be/rsF-4KCVB9g?si=6-B7RNJrSeht0blc'
WHERE `video_id` = 6;

UPDATE `draft_info`
SET `url` = 'https://youtu.be/Qt3AUTaL4_Q?si=IrDJlGyDMmGmSNy4'
WHERE `video_id` = 7;

UPDATE `draft_info`
SET `url` = 'https://youtu.be/sWY0U-G6Ni4?si=k-FTSOCI2cFOxhWE'
WHERE `video_id` = 8;

UPDATE `draft_info`
SET `url` = 'https://youtu.be/6x-UZeBCtR0?si=UXfrJUcUTRoOh0Xe'
WHERE `video_id` = 9;

CREATE TABLE `draft_result` (
  `video_id` int(11) NOT NULL,
  `video_winner` varchar(50) NOT NULL,
  `video_2nd` varchar(50) NOT NULL,
  `video_3rd` varchar(50) NOT NULL,
  `Ugur_Total_P` int(6) NOT NULL,
  `Arden_Total_P` int(6) NOT NULL,
  `Onur_Total_P` int(6) NOT NULL,
  `Ugur_League_Order` int(6) NOT NULL,
  `Arden_League_Order` int(6) NOT NULL,
  `Onur_League_Order` int(6) NOT NULL,
  `Ugur_LeagueP` int(6) NOT NULL,
  `Arden_LeagueP` int(6) NOT NULL,
  `Onur_LeagueP` int(6) NOT NULL,
  `Ugur_LeagueG` int(6) NOT NULL,
  `Arden_LeagueG` int(6) NOT NULL,
  `Onur_LeagueG` int(6) NOT NULL,
  `Ugur_Ave` int(6) NOT NULL,
  `Arden_Ave` int(6) NOT NULL,
  `Onur_Ave` int(6) NOT NULL,
  `Ugur_ŞL` ENUM(
    'ŞL Şampiyon', 'ŞL Final', 'ŞL Yarı', 'ŞL Çeyrek', 'ŞL Grup',
    'Uefa Şampiyon', 'Uefa Final', 'Uefa Yarı', 'Uefa Çeyrek', 'Uefa 16',
    'Konferans Şampiyon', 'Konferans Final', 'Konferans Yarı', 'Konferans Çeyrek', 'Konferans 16',
    'Yok'
  ) NOT NULL,
  `Arden_ŞL` ENUM(
    'ŞL Şampiyon', 'ŞL Final', 'ŞL Yarı', 'ŞL Çeyrek', 'ŞL Grup',
    'Uefa Şampiyon', 'Uefa Final', 'Uefa Yarı', 'Uefa Çeyrek', 'Uefa 16',
    'Konferans Şampiyon', 'Konferans Final', 'Konferans Yarı', 'Konferans Çeyrek', 'Konferans 16',
    'Yok'
  ) NOT NULL,
  `Onur_ŞL` ENUM(
    'ŞL Şampiyon', 'ŞL Final', 'ŞL Yarı', 'ŞL Çeyrek', 'ŞL Grup',
    'Uefa Şampiyon', 'Uefa Final', 'Uefa Yarı', 'Uefa Çeyrek', 'Uefa 16',
    'Konferans Şampiyon', 'Konferans Final', 'Konferans Yarı', 'Konferans Çeyrek', 'Konferans 16',
    'Yok'
  ) NOT NULL,
  `Ugur_Cup-1` ENUM("Cup Şampiyon","Cup Final","Cup Yarı","Cup Çeyrek","Other","Yok") NOT NULL,
  `Arden_Cup-1` ENUM("Cup Şampiyon","Cup Final","Cup Yarı","Cup Çeyrek","Other","Yok") NOT NULL,
  `Onur_Cup-1` ENUM("Cup Şampiyon","Cup Final","Cup Yarı","Cup Çeyrek","Other","Yok") NOT NULL,
  `Ugur_Cup-2` ENUM("Cup Şampiyon","Cup Final","Cup Yarı","Cup Çeyrek","Other","Yok") DEFAULT "Yok",
  `Arden_Cup-2` ENUM("Cup Şampiyon","Cup Final","Cup Yarı","Cup Çeyrek","Other","Yok") DEFAULT "Yok",
  `Onur_Cup-2` ENUM("Cup Şampiyon","Cup Final","Cup Yarı","Cup Çeyrek","Other","Yok") DEFAULT "Yok",
  `EU_Grup_1_Ugur`  bool DEFAULT FALSE, 
  `EU_Grup_1_Arden`  bool DEFAULT FALSE, 
  `EU_Grup_1_Onur`  bool DEFAULT FALSE,
  `EU_1_Ugur` bool DEFAULT FALSE, /* 1.'ye elenme puanı */ 
  `EU_1_Arden`  bool DEFAULT FALSE, 
  `EU_1_Onur`  bool DEFAULT FALSE,
  `3RL_League_Ugur` int(3) NOT NULL,
  `3RL_League_Arden` int(3) NOT NULL,
  `3RL_League_Onur` int(3) NOT NULL,
  `Other_Ugur` int(5) default 0,
  `Other_Arden` int(5) default 0,
  `Other_Onur` int(5) default 0,
  PRIMARY KEY (`video_id`),
  KEY `FK_video_idx` (`video_id`),
  KEY `FK_winner_idx` (`video_winner`),
  KEY `FK_2nd_idx` (`video_2nd`),
  KEY `FK_3rd_idx` (`video_3rd`),
  CONSTRAINT `FK_video_id` FOREIGN KEY (`video_id`) REFERENCES `draft_info` (`video_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_winner` FOREIGN KEY (`video_winner`) REFERENCES `drafters` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_2nd` FOREIGN KEY (`video_2nd`) REFERENCES `drafters` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_3rd` FOREIGN KEY (`video_3rd`) REFERENCES `drafters` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `draft_result` VALUES (1,"Ugur","Onur","Arden",748,538,711,1,1,1,96,87,89,29,26,28,57,45,52,"ŞL Grup","ŞL Grup","Uefa 16","Cup Şampiyon","Cup Şampiyon","Yok",default,default,default,default,default,default,default,default,default,1,3,2,0,0,0);
INSERT INTO `draft_result` VALUES (2,"Onur","Arden","Ugur",116,323,865,7,5,1,59,68,84,16,18,24,5,25,43,"Yok","ŞL Grup","Uefa Yarı","Yok","Cup Yarı","Cup Final","Yok","Yok","Cup Şampiyon",default,default,default,default,default,default,3,2,1,0,0,0);
INSERT INTO `draft_result` VALUES (3,"Arden","Onur","Ugur",530,639,632,2,1,1,80,84,84,23,25,26,32,46,44,"ŞL Çeyrek","ŞL Grup","ŞL Grup","Yok","Yok","Yok","Yok","Yok","Yok",default,default,TRUE,TRUE,default,default,3,1,2,0,0,0);
INSERT INTO `draft_result` VALUES (4,"Onur","Ugur","Arden",658,254,1090,12,6,1,46,59,83,12,15,25,-2,13,42,"ŞL Yarı","ŞL Grup","ŞL Şampiyon","Cup Şampiyon","Yok","Yok","Cup Yarı","Yok","Yok",TRUE,default,default,default,default,default,3,2,1,25,0,0);
INSERT INTO `draft_result` VALUES (5,"Ugur","Onur","Arden",735,306,655,2,4,3,79,73,73,23,21,20,35,28,30,"ŞL Çeyrek","ŞL Grup","ŞL Final","Cup Yarı","Yok","Yok","Cup Şampiyon","Yok","Cup Yarı",TRUE,default,TRUE,default,default,default,1,3,2,0,0,0);
INSERT INTO `draft_result` VALUES (6,"Ugur","Onur","Arden",604,336,362,3,3,4,83,75,73,25,22,22,35,30,27,"ŞL Çeyrek","ŞL Grup","ŞL Grup","Cup Şampiyon","Yok","Yok","Yok","Yok","Yok",default,default,default,default,True,default,1,2,3,0,0,0);
INSERT INTO `draft_result` VALUES (7,"Onur","Arden","Ugur",485,735,1159,2,1,1,81,86,88,24,26,26,38,39,40,"ŞL Grup","ŞL Çeyrek","ŞL Şampiyon","Cup Şampiyon","Yok","Yok","Cup Yarı","Yok","Yok",default,true,true,default,default,default,3,2,1,0,0,0);
INSERT INTO `draft_result` VALUES (8,"Arden","Onur","Ugur",889,1196,930,2,1,2,82,84,79,25,26,23,33,37,33,"ŞL Şampiyon","ŞL Şampiyon","ŞL Şampiyon","Yok","Yok","Yok","Yok","Yok","Cup Yarı",true,true,default,default,default,default,2,1,3,0,0,0);
INSERT INTO `draft_result` VALUES (9,"Arden","Ugur","Onur",796,918,508,1,1,3,95,89,78,29,26,24,62,47,42,"Uefa Yarı","ŞL Yarı","ŞL Yarı","Cup Final","Cup Şampiyon","Cup Şampiyon","Yok","Yok","Yok",default,true,true,default,default,default,1,2,3,0,25,0);

CREATE TABLE `player_stats` (
  `player_name` varchar(100) NOT NULL,
  `drafter_name` varchar(50) NOT NULL,
  `video_id` int(11) NOT NULL ,
  `Total_Goal` tinyint(4) DEFAULT NULL,
  `Total_Assist` tinyint(4) DEFAULT NULL,
  `Total_CS` tinyint(4) DEFAULT NULL,
  `Total_Match` tinyint(4) DEFAULT NULL,
  `League_Goal` tinyint(4) DEFAULT NULL,
  `League_Assist` tinyint(4) DEFAULT NULL,
  `League_CS` tinyint(4) DEFAULT NULL,
  `EU_Goal` tinyint(4) DEFAULT NULL,
  `EU_Assist` tinyint(4) DEFAULT NULL,
  `EU_CS` tinyint(4) DEFAULT NULL,
  `Cup_Goal` tinyint(4) DEFAULT NULL,
  `Cup_Assist` tinyint(4) DEFAULT NULL,
  `Cup_CS` tinyint(4) DEFAULT NULL,
  `Goal_King` int(5) DEFAULT 0,
  `Assist_King` int(5) DEFAULT 0,
  `CS_King` int(5) DEFAULT 0,
  `EU_Goal_King` int(5) DEFAULT 0,
  `EU_Assist_King` int(5) DEFAULT 0,
  `EU_CS_King` int(5) DEFAULT 0,
  `3RB_Goal_King` int(5) DEFAULT 0,
  `3RB_Assist_King` int(5) DEFAULT 0,
  `3RB_CS_King` int(5) DEFAULT 0,
  `Best_Performance` int(5) DEFAULT 0,
  `Best_Best_Performance` int(5) DEFAULT 0,
  `Performance_king` int(5) DEFAULT 0,
  `Other_Point` int(5) DEFAULT 0,
  `Total Point` int(5) DEFAULT 0,
  `selected?` bool default true,
  `bet_amount` int(6) DEFAULT NULL,
  `money_spent` int(15) DEFAULT NULL,
  `drafted_order` int(4) DEFAULT NULL,
  `overall` tinyint(5) default NULL,
  PRIMARY KEY (`player_name`,`drafter_name`,`video_id`),
  KEY `FK_player_name_idx` (`player_name`),
  KEY `FK_drafter_name_idx` (`drafter_name`),
  KEY `FK_video_idx` (`video_id`),
  CONSTRAINT `FK_player_name` FOREIGN KEY (`player_name`) REFERENCES `players` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_drafter_name` FOREIGN KEY (`drafter_name`) REFERENCES `drafters` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_video` FOREIGN KEY (`video_id`) REFERENCES `draft_info` (`video_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*INSERT INTO `player_stats` VALUES ("Mehdi Taremi","Onur",1,default,default,default,default,default,default,default,default,default,default,default,default,default,default,default,default,default,default,default,default,default,default);
*/

ALTER TABLE `player_stats`
DROP COLUMN `Total Point`;


ALTER TABLE `player_stats`
ADD COLUMN `Total Point` int(5) AS (
  `Goal_King` + `Assist_King` + `CS_King` +
  `EU_Goal_King` + `EU_Assist_King` + `EU_CS_King` +
  `3RB_Goal_King` + `3RB_Assist_King` + `3RB_CS_King` +
  `Best_Performance` + `Best_Best_Performance` + `Performance_king` +
  `Other_Point`
) STORED;





-- 2nd video
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Mehdi Taremi", "Onur", 1, 35,15,16,50,29,11,4,default,TRUE, 24500000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`, `League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`, `money_spent`) VALUES ("Altay Bayındır", "Onur", 1, 0,0,16,50,0,0,14,0,0,default,TRUE, 9700000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Marco Reus", "Onur", 1, 13,6,6,45,default,default,default,default,TRUE, 13500000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Zeki Çelik", "Onur", 1, 2,2,12,45,default,default,default,default,TRUE, 8000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Joel Matip", "Onur", 1, 3,0,13,39,default,default,default,default,TRUE, 10800000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Salih Özcan", "Onur", 1, 4,7,16,45,default,default,default,default,TRUE, 16800000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Ante Rebic", "Onur", 1, 14,4,10,49,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Milot Rashica", "Onur", 1, 14,6,12,45,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Gedson Fernandes", "Onur", 1, 10,8,13,44,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Eric Bailly", "Onur", 1, 0,0,8,32,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Alex Oxlade-Chamberlain", "Onur", 1, 8,4,10,33,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Kerem Atakan Kesgin", "Onur", 1, 3,5,5,22,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Necip Uysal", "Onur", 1, 1,0,2,13,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Tayfur Bingöl", "Onur", 1, 1,0,4,13,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Onur Bulut", "Onur", 1, 1,3,3,13,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Javi Montero", "Onur", 1, 0,0,1,5,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Omar Colley", "Onur", 1, 0,1,10,31,default,default,default,default,FALSE, default);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Karim Benzema", "Ugur", 1, 34,11,14,51,25,10,default,default,TRUE, 50300000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Dusan Tadic", "Ugur", 1, 23,9,13,48,13,7,6,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Umut Nayir", "Ugur", 1, 15,0,13,43,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Georginio Wijnaldum", "Ugur", 1, 2,6,14,46,default,5,default,default,TRUE, 11500000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`, `money_spent`) VALUES ("Livakoviç", "Ugur", 1, 0,3,16,31,0,0,12,0,0,1,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("İlkay Gündoğan", "Ugur", 1, 8,6,12,50,default,default,default,default,TRUE, 51200000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Robert Andrich", "Ugur", 1, 8,5,12,46,default,default,default,default,TRUE, 33500000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Talisca", "Ugur", 1, 3,2,9,44,default,default,default,default,TRUE, 11100000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Sebastian Coates", "Ugur", 1, 2,0,13,41,default,default,default,default,TRUE, 12800000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Emre Can", "Ugur", 1, 2,3,14,49,default,default,default,default,TRUE, 32000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Cengiz Ünder", "Ugur", 1, 9,2,6,44,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Alexander Djiku", "Ugur", 1, 1,3,9,35,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Burak Elmaz", "Ugur", 1, 0,1,1,16,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Mert Müldür", "Ugur", 1, 0,0,1,12,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Stefan de Vrij", "Ugur", 1, 0,1,9,35,default,default,default,default,TRUE, 19700000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Serdar Aziz", "Ugur", 1, 2,0,0,25,default,default,default,default,FALSE, default);


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Heung-min Son", "Arden", 1, 29,8,11,47,25,default,default,default,TRUE, 45000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Mauro Icardi", "Arden", 1, 24,4,7,52,19,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Angelino", "Arden", 1, 17,12,11,51,default,8,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Lucas Torreira", "Arden", 1, 2,9,12,50,default,6,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("İlkay Gündoğan", "Arden", 1, 6,9,12,45,default,6,default,default,TRUE, 49000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Alex Remiro", "Arden", 1, 0,1,9,35,default,default,8,default,default,TRUE, 40491967);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Hakim Ziyech", "Arden", 1, 11,6,8,53,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Halil Dervişoğlu", "Arden", 1, 10,3,2,32,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Taylan Antalyalı", "Arden", 1, 4,1,8,29,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Emre Can", "Arden", 1, 3,1,10,45,default,default,default,default,TRUE, 32000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Thomas Partey", "Arden", 1, 5,4,11,51,default,default,default,default,TRUE, 34900000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Abdülkerim Bardakçı", "Arden", 1, 1,2,11,46,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Kaan Ayhan", "Arden", 1, 0,0,1,11,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Sascha Boey", "Arden", 1, 1,3,15,53,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Kazımcan Karataş", "Arden", 1, 1,0,2,5,default,default,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `money_spent`) VALUES ("Davinson Sánchez", "Arden", 1, 0,0,1,25,default,default,default,default,FALSE, default);


UPDATE `player_stats` SET `Best_Performance` = 37 , `Goal_King` = 20 WHERE (`player_name` = "Heung-min Son" AND `drafter_name` = "Arden" AND `video_id` = 1);
UPDATE `player_stats` SET `Best_Performance` = 45, `3RB_Goal_King` = 25  WHERE  (`player_name` = "Karim Benzema" AND `drafter_name` = "Ugur" AND `video_id` = 1);
UPDATE `player_stats` SET `Best_Performance` = 50 , `Goal_King` = 20, `Best_Best_Performance` = 25, `3RB_Goal_King` = 50, `3RB_Assist_King` = 50  WHERE (`player_name` = "Mehdi Taremi" AND `drafter_name` = "Onur" AND `video_id` = 1);
UPDATE `player_stats` SET `3RB_Assist_King` = 25  WHERE (`player_name` = "Angelino" AND `drafter_name` = "Arden" AND `video_id` = 1);
UPDATE `player_stats` SET `3RB_CS_King` = 50  WHERE (`player_name` = "Altay Bayındır" AND `drafter_name` = "Onur" AND `video_id` = 1);
UPDATE `player_stats` SET `3RB_CS_King` = 50  WHERE (`player_name` = "Livakoviç" AND `drafter_name` = "Ugur" AND `video_id` = 1);



INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Mohamed Salah", "Ugur", 2, 17 , 9 , default , default , 16 , 7 ,default,default,TRUE, 7);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Christopher Nkunku", "Ugur", 2, 10,7,default,default,10,7,default,default,TRUE, 1);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Bruno Fernandes", "Ugur", 2, 8 , 6 , default , default , 8 , 6 ,default,2,TRUE, 5);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Odysseas Vlachodimos", "Ugur", 2, default , default , 5 , default , default , default ,4, default,default,TRUE, 9);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`, `drafted_order`) VALUES ("Thomas Kaminski", "Ugur", 2, default , default , default , default , default , default ,default, default,default,1,TRUE, 17);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Beto", "Ugur", 2, 9 , 1 , default , default , 9 , 1 ,default,default,TRUE, 18);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Moussa Diaby", "Ugur", 2, 5 , 3 , default , default , 5 , 3 ,default,default,TRUE, 3);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Joachim Andersen", "Ugur", 2, 2 , 0 , default , default , 2 , 0 ,default,default,TRUE, 20);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Cristian Romero", "Ugur", 2, 2 , default , default , default , 2 , 0 ,default,default,TRUE,6);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Cameron Archer", "Ugur", 2, 2 , default , default , default , 2 , 0 ,default,default,TRUE, 15);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Sandro Tonali", "Ugur", 2, 2 , 3 , default , default , 2 , 3 ,default,default,TRUE,2);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Ruben Dias", "Ugur", 2, 1 , 0 , default , default , 1 , 0 ,default,default,TRUE, 4);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Nayef Aguerd", "Ugur", 2, 1 , 0 , default , default , 1 , 0 ,default,default,TRUE, 10);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Kaoru Mitoma", "Ugur", 2, 1 , 0 , default , default , 1 , 0 ,default,default,TRUE, 11);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Declan Rice", "Ugur", 2, 1 , 3 , default , default , 1 , 3 ,default,default,TRUE,8);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Erling Haaland", "Arden", 2, 32 , 3 , default , 38 , 24 , 2 ,3,1,TRUE,1);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Mohammed Kudus", "Arden", 2, 19 , 5 , default , 38 , 17 , 4 ,2,1,TRUE, 9);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Eberechi Eze", "Arden", 2, 10 , 6 , default , 32 , 10 , 6 ,default,default,TRUE, 11);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Arnaut Danjuma", "Arden", 2, 8 , 3 , default , 35 , 8 , 3 ,default,default,TRUE, 8);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Pierre-Emile Hojbjerg", "Arden", 2, 4 , 1 , default , 33 , 4 , 1 ,default,default,TRUE, 19);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Casemiro", "Arden", 2, 3 , default , default , 33 , 3 , 0 ,default,default,TRUE, 2);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Bruno Guimaraes", "Arden", 2, 3 , 6 , default , 37 , 3 , 5 ,0,1,TRUE, 5);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Martin Odegaard", "Arden", 2, 3 , 8 , default , 32 , 2 , 5 ,1,0,TRUE, 3);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Emiliano Martinez", "Arden", 2, default , default , 8 , default , default , default ,default,default,TRUE, 3);


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Heung-min Son", "Onur", 2, 30 , 13 , 22 , 65 , 17 , 6 ,4,3,TRUE, 1);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Marcus Rashford", "Onur", 2, 26 , 7 , 14 , 54 , 18 , default ,default,default,TRUE, 8);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Kevin De Bruyne", "Onur", 2, 15 , 14 , 26 , 65 , default , 10 ,default,default,TRUE, 13);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_CS`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ('Jordan Pickford', "Onur", 2, 0 , 2 , 23 , 65 , default , default ,16,default,default,TRUE, 4);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Darwin Nunez", "Onur", 2, 22 , 3 , default , default , default , default ,default,default,TRUE, 14);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Ansu Fati", "Onur", 2, 8 , 0 , 7 , 26 , default , default ,default,default,TRUE, 16);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ('Bukayo Saka', "Onur", 2, 8 , 7 , 20 , 59 , default , default ,default,default,TRUE, 6);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Enzo Fernandez", "Onur", 2, 3 , 8 , 23 , 69 , default , default ,default,default,TRUE, 20);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Matheus Cunha", "Onur", 2, 3 , 1 , 6 , 25 , default , default ,default,default,TRUE, 11);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Ibrahim Sangare", "Onur", 2, 3 , 3 , 8 , 39 , default , default ,default,default,TRUE, 5);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Ryan Fraser", "Onur", 2, 3 , 0 , 3 , 8 , default , default ,default,default,FALSE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Pau Torres", "Onur", 2, 2 , 1 , 21 , 61 , default , default ,default,default,TRUE, 2);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Edson Alvarez", "Onur", 2, 2 , 1 , 19 , 63 , default , default ,default,default,TRUE, 7);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Marc Guehi", "Onur", 2, 0 , 0 , 9 , 47 , default , default ,default,default,TRUE, 9);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `drafted_order`) VALUES ("Jordan Beyer", "Onur", 2, 0 , 1 , 5 , 23 , default , default ,default,default,TRUE, 12);


UPDATE `player_stats` SET `Best_Performance` = 43 , `Best_Best_Performance` = 25 , `3RB_Goal_King` = 25   WHERE (`player_name` = "Heung-min Son" AND `drafter_name` = "Onur" AND `video_id` = 2);
UPDATE `player_stats` SET `Best_Performance` = 35, `3RB_Goal_King` = 50  WHERE  (`player_name` = "Erling Haaland" AND `drafter_name` = "Arden" AND `video_id` = 2);
UPDATE `player_stats` SET `3RB_Assist_King` = 50  WHERE (`player_name` = "Kevin De Bruyne" AND `drafter_name` = "Onur" AND `video_id` = 2);
UPDATE `player_stats` SET `Best_Performance` = 26 , `3RB_Assist_King` = 25  WHERE (`player_name` = "Mohamed Salah" AND `drafter_name` = "Ugur" AND `video_id` = 2);
UPDATE `player_stats` SET `3RB_CS_King` = 25  WHERE (`player_name` = "Emiliano Martinez" AND `drafter_name` = "Arden" AND `video_id` = 2);
UPDATE `player_stats` SET `3RB_CS_King` = 50, `CS_King` = 20  WHERE (`player_name` = "Jordan Pickford" AND `drafter_name` = "Onur" AND `video_id` = 2);




-- 3rd video

/*video 3*/

INSERT INTO `teams` VALUES ('Paris','League 1');
INSERT INTO `teams` VALUES ('Rennes','League 1');
INSERT INTO `teams` VALUES ('Lens','League 1');
INSERT INTO `teams` VALUES ('Napoli','Serie A');
INSERT INTO `teams` VALUES ('Sassuolo','Serie A');
INSERT INTO `teams` VALUES ('Atalanta','Serie A');
INSERT INTO `teams` VALUES ('Dortmund','BundesLeaguea');
INSERT INTO `teams` VALUES ('Bayern','BundesLeaguea');
INSERT INTO `teams` VALUES ('Al-Hilal','Sudi Pro League');
INSERT INTO `teams` VALUES ('Portimonense','Leaguea Portugal');
INSERT INTO `teams` VALUES ('RB Leipzig','BundesLeaguea');
INSERT INTO `teams` VALUES ('Girona','LaLiga');
INSERT INTO `teams` VALUES ('Villarreal','LaLiga');
INSERT INTO `teams` VALUES ("KAA Gent",'Jupiler Pro League');

INSERT INTO `players` VALUES ("Khvicha Kvaratskhelia","Napoli","LW");
INSERT INTO `players` VALUES ('Randal Kolo Muani',"Paris","ST");
INSERT INTO `players` VALUES ('Gregor Kobel',"Dortmund","GK");
INSERT INTO `players` VALUES ('Eder Militao',"Real Madrid","STP");
INSERT INTO `players` VALUES ('Noussair Mazraoui',"Bayern","RB");
INSERT INTO `players` VALUES ('Lisandro Martinez',"MUN","STP");
INSERT INTO `players` VALUES ('Domenico Berardi',"Sassuolo","RW");
INSERT INTO `players` VALUES ('Jonas Hofmann',"Leverkusen","MF");
INSERT INTO `players` VALUES ('Stanislav Lobotka',"Napoli","MF");
INSERT INTO `players` VALUES ('Alejandro Balde',"Barcelona","LB");
INSERT INTO `players` VALUES ('Alejo Veliz',"Tottenham","RW");
INSERT INTO `players` VALUES ('Eduardo Camavinga',"Real Madrid","MF");
INSERT INTO `players` VALUES ('Filipe Relvas',"Portimonense","MF");

INSERT INTO `players` VALUES ('John Stones',"Man City","STP");
INSERT INTO `players` VALUES ('Giovanni Di Lorenzo',"Napoli","RB");
INSERT INTO `players` VALUES ('Vinicius Junior',"Real Madrid","LW");
INSERT INTO `players` VALUES ('Aaron Ramsdale',"Arsenal","GK");
INSERT INTO `players` VALUES ('Ruben Neves',"Al-Hilal","MF");
INSERT INTO `players` VALUES ('Frank Anguissa',"Napoli","MF");
INSERT INTO `players` VALUES ('Alessandro Bastoni',"Inter","STP");
INSERT INTO `players` VALUES ('Luke Shaw',"MUN","LB");
INSERT INTO `players` VALUES ('Lois Openda',"RB Leipzig","ST");
INSERT INTO `players` VALUES ('Viktor Tsygankov',"Girona","RW");
INSERT INTO `players` VALUES ('Evan Ferguson',"Brighton","ST");
INSERT INTO `players` VALUES ('Giorgio Scalvini',"Atalanta","MF");

INSERT INTO `players` VALUES ('Min-jae Kim',"Bayern","STP");
INSERT INTO `players` VALUES ('Victor Osimhen',"Napoli","ST");
INSERT INTO `players` VALUES ('Federico Valverde',"Real Madrid","MF");
INSERT INTO `players` VALUES ('Ousmane Dembele',"Paris","RW");
INSERT INTO `players` VALUES ('Alejandro Grimaldo',"Leverkusen","LB");
INSERT INTO `players` VALUES ('Martin Terrier',"Rennes","LW");
INSERT INTO `players` VALUES ('Guglielmo Vicario',"Tottenham","GK");
INSERT INTO `players` VALUES ('Bart Verbruggen',"Brighton","GK");
INSERT INTO `players` VALUES ('Kevin Danso',"Lens","STP");
INSERT INTO `players` VALUES ('Ousmane Diomande',"Sporting CP","STP");
INSERT INTO `players` VALUES ('Juan Foyth',"Villarreal","STP");
INSERT INTO `players` VALUES ('Kristoffer Ajer',"Villarreal","STP");
INSERT INTO `players` VALUES ('Tarik Tissoudali',"KAA Gent","ST");

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Randal Kolo Muani", "Arden", 3, 32 , 7 , 12 , 49 , 25 , default , default, default,TRUE, 150);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Khvicha Kvaratskhelia", "Arden", 3, 20 , 8 , 14 , 50 , 19 , default , default, default,TRUE, 170);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Jonas Hofmann", "Arden", 3, 11 , 10 , 11 , 50 , default , 9 , default, default,FALSE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Stanislav Lobotka", "Arden", 3, 8 , 10 , 12 , 49 , default , 8 , default, default,FALSE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Gregor Kobel", "Arden", 3, 0 , 0 , 11 , 50 , 0 , 0 , 10, default, default,TRUE, 200);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Domenico Berardi", "Arden", 3, 14 , 6 , 16 , 50 , default , default , default, default,TRUE, 94);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Alejandro Balde", "Arden", 3, 6 , 10 , 14 , 49 , default , default , default, default,FALSE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Noussair Mazraoui", "Arden", 3, 8 , 1 , 10 , 49 , default , default , default, default,TRUE, 30);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Lisandro Martinez", "Arden", 3, 3 , 1 , 11, 47, default , default , default, default,TRUE, 156);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Alejo Veliz", "Arden", 3, 3 , 0 , 0 , 19, default , 0 , default, default,FALSE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Eduardo Camavinga", "Arden", 3, 1 , 3 , 11, 45, default , default , default, default,FALSE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Eder Militao", "Arden", 3, 0 , 0 , 10 , 48 , 0 , 0 , default, default,TRUE, 200);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Filipe Relvas", "Arden", 3, 1 , 1 , 2 , 26 , default , default , default, default,FALSE, 0);

UPDATE `player_stats` SET `Best_Performance` = 39 , `3RB_Goal_King` = 25, `Goal_King` = 20   WHERE (`player_name` = "Randal Kolo Muani" AND `drafter_name` = "Arden" AND `video_id` = 3);
UPDATE `player_stats` SET  `3RB_CS_King` = 25   WHERE (`player_name` = "Gregor Kobel" AND `drafter_name` = "Arden" AND `video_id` = 3);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Loïs Openda", "Onur", 3, 31 , 2 , 14 , 49 , 24 , default , 5, default,FALSE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Vinicius Junior", "Onur", 3, 23 , 11 , 11 , 49 , 18 , 8 , default, default,TRUE, 201);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ('Bruno Guimaraes', "Onur", 3, 6 , 10 , 13 , 48 , default , 8 , default, default,FALSE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Viktor Tsygankov", "Onur", 3, 13 , 7 , 12 , 50 , default , 7 , default, default,FALSE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Luke Shaw", "Onur", 3, 1 , 8 , 14 , default , default , 6 , default, default,TRUE, 1);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`, `bet_amount`) VALUES ("Aaron Ramsdale", "Onur", 3, 0 , 1 , 13 , 50 , 0 , default , 11,default, default,2,TRUE, 90);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Martin Odegaard", "Onur", 3, 14 , 11 , 12 , 50 , default , default , default, 4,TRUE, 1);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("John Stones", "Onur", 3, 2 , 1 , 11 , 48 , default , default , default, default,TRUE, 101);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Giovanni Di Lorenzo", "Onur", 3, default , default , default , default , default , default , default, default,TRUE, 91);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Ruben Neves", "Onur", 3, default , default , default , default , default , default , default, default,TRUE, 95);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Frank Anguissa", "Onur", 3, default , default , default , default , default , default , default, default,FALSE, 1);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Alessandro Bastoni", "Onur", 3, 2 , 1 , 12 , 48 , League_Goal , League_Assist , default, default,TRUE, 85);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Giorgio Scalvini", "Onur", 3, 0 , 0 , 3 , 23 , 0 , 0 , 0, 0,FALSE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Evan Ferguson", "Onur", 3, 3 , 0 , 0 , 11 , default , default , default, default,FALSE, 0);


UPDATE `player_stats` SET `CS_King` = 20 , `3RB_CS_King` = 50 WHERE (`player_name` = "Aaron Ramsdale" AND `drafter_name` = "Onur" AND `video_id` = 3);
UPDATE `player_stats` SET `Best_Performance` = 34, `3RB_Assist_King` = 13   WHERE (`player_name` = "Vinicius Junior" AND `drafter_name` = "Onur" AND `video_id` = 3);
UPDATE `player_stats` SET  `3RB_Assist_King` = 12  WHERE (`player_name` = "Martin Odegaard" AND `drafter_name` = "Onur" AND `video_id` = 3);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Victor Osimhen", "Ugur", 3, 37 , 5 , 8 , 53 , 25 , default , 8, default,TRUE, 250);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Federico Valverde", "Ugur", 3, 22 , 13 , 9 , 53 , 16 , 9 , 5, default,TRUE, 153);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Alejandro Grimaldo", "Ugur", 3, 4 , 9 , 9 , 48 , default , 9 , default, default,TRUE, 50);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Martin Terrier", "Onur", 3, 13 , 8 , 9 , 50 , default , 7 , default, default,TRUE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Guglielmo Vicario", "Ugur", 3, 0 , 0 , 4 , 37 , default , default , 4,default, default,TRUE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Bart Verbruggen", "Ugur", 3, 0 , 0 , 5 , 16 , default , default , default, default,TRUE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Min-jae Kim", "Ugur", 3, 2 , 1 , 9 , 53 , default , default , default, default,TRUE, 95);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Ousmane Dembele", "Ugur", 3, 2 , 2 , 3 , 19 , default , default , default, default,TRUE, 140);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Christopher Nkunku", "Ugur", 3, 12 , 9 , 9 , 51 , default , default , default, default,TRUE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Sandro Tonali", "Ugur", 3, 2 , 8 , 10 , 53 , default , default , default, default,TRUE, 169);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Kevin Danso", "Onur", 3, 2 , 1 , 8 , 52 , default , default , default, default,TRUE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Ousmane Diomande", "Onur", 3, 0 , 0 , 5 , 30 , default , default , default, default,TRUE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Juan Foyth", "Onur", 3, 2 , 1 , 4 , 38 , default , default , default, default,TRUE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Kristoffer Ajer", "Onur", 3, 0 , 0 , 3 , 31 , default , default , default, default,TRUE, 0);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `bet_amount`) VALUES ("Tarik Tissoudali", "Onur", 3, 5 , 1 , 1 , 15 , default , default , default, default,TRUE, 0);

UPDATE `player_stats` SET `Best_Performance` = 42 , `Best_Best_Performance` = 25 , `3RB_Goal_King` = 50  WHERE (`player_name` = "Victor Osimhen" AND `drafter_name` = "Ugur" AND `video_id` = 3);
UPDATE `player_stats` SET  `3RB_Assist_King` = 50  WHERE (`player_name` = "Federico Valverde" AND `drafter_name` = "Ugur" AND `video_id` = 3);



-- video 4

/*INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) VALUES ("Lautaro Martínez", "Ugur", 4 , Total_Goal, Total_Assist, Total_CS , Total_Match , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);*/
/*INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) VALUES ("Lautaro Martínez", "Ugur", 4 , Total_Goal, Total_Assist, Total_CS , Total_Match , League_Goal , League_Assist ,League_CS , EU_Goal , EU_Assist , EU_CS, TRUE);*/

INSERT IGNORE INTO `teams` VALUES ("OGC Nizza",'League 1');
INSERT IGNORE INTO `teams` VALUES ("Monaco",'League 1');
INSERT IGNORE INTO `teams` VALUES ("Benfica",'Leaguea Portugal');
INSERT IGNORE INTO `teams` VALUES ("OGC Nice",'League 1');
INSERT IGNORE INTO `teams` VALUES ("BK Hacken",'Other');
INSERT IGNORE INTO `teams` VALUES ("Juventus",'Serie A');

INSERT  INTO `players` VALUES ('Lautaro Martinez', "Inter", "ST");
INSERT  INTO `players` VALUES ('Khephren Thuram', "OGC Nizza", "MF");
INSERT  INTO `players` VALUES ('Goncalo Ramos', "Paris", "ST");
INSERT  INTO `players` VALUES ('Pedri', "Barcelona", "MF");
INSERT  INTO `players` VALUES ('Karim Adeyemi', "Dortmund", "ST");
INSERT  INTO `players` VALUES ('Nicolas Dominguez', "Nottingham Forest", "MF");
INSERT  INTO `players` VALUES ('Folarin Balogun', "Monaco", "ST");
INSERT  INTO `players` VALUES ('Noni Madueke', "Chelsea", "RW");
INSERT  INTO `players` VALUES ('Wilfried Singo', "Monaco", "RB");
INSERT  INTO `players` VALUES ('Jules Kounde', "Barcelona", "STP");
INSERT  INTO `players` VALUES ('Nico Schlotterbeck', "Dortmund", "STP" );
INSERT  INTO `players` VALUES ('Antonio Silva',"Benfica","STP");
INSERT  INTO `players` VALUES ('Marcin Bulka',"OGC Nice","GK");
INSERT INTO `players` VALUES ('Mohamed Camara',"Monaco","MF");
INSERT INTO `players` VALUES ('Ferdi Kadıoğlu',"Fenerbahçe","LB");



INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Lautaro Martinez", "Ugur", 4 , 29, 10, 12 , 61 , 12 , default , 9 , 5 , TRUE,87);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Khephren Thuram", "Ugur", 4 , 15, 19, 12 , 61 , default , 13 , default , default , TRUE, 79);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`, `overall`) VALUES ("Aaron Ramsdale", "Ugur", 4 , 0, 1, 11 , 56 , default , default ,default , default , default, 4, TRUE,84);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Pedri", "Ugur", 4 , 12, 12, 12 , 61 , default , default , default , default , TRUE, 86);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Goncalo Ramos", "Ugur", 4 , 20, 0, 10 , 53 , default , default , default , default , TRUE, 80);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Karim Adeyemi", "Ugur", 4 , 8, 3, 11 , 50 , default , default , default , default , TRUE, 80);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Nicolas Dominguez", "Ugur", 4 , 4, 3, 7 , 41 , default , default , default , default , TRUE, 77);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Folarin Balogun", "Ugur", 4 , 13, 3, 2 , 35 , default , default , default , default , TRUE, 79);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Noni Madueke", "Ugur", 4 , 3, 1, 7 , 55 , default , default , default , default , TRUE, 77);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Arda Güler", "Ugur", 4 , 3, 4, 1 , 50 , default , default , default , default , TRUE, 77 );
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Wilfried Singo", "Ugur", 4 , 3, 2, 2 , 38 , default , default , default , default , TRUE, 76);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Jules Kounde", "Ugur", 4 , 0, 0, 10 , 59 , default , default , default , default , TRUE, 85);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Nico Schlotterbeck", "Ugur", 4 , 2, 1, 8 , 55 , default , default , default , default , TRUE, 83);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Antonio Silva", "Ugur", 4 , 0, 3, 13 , 61 , default , default , default , default , TRUE,78);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Marcin Bulka", "Ugur", 4 , 0, 0, 1 , 6 , default , default , default , default , TRUE,76);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Mohamed Camara", "Ugur", 4 , 2, 2, 5 , 41 , default , default , default , default , TRUE, 78);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Ferdi Kadıoğlu", "Ugur", 4 , 0, 2, 3 , 38 , default , default , default , default , TRUE,77);





UPDATE `player_stats` SET `Best_Performance` = 39  ,`EU_Goal_King` = 40  , `3RB_Goal_King` = 25 WHERE (`player_name` = "Lautaro Martinez" AND `drafter_name` = "Ugur" AND `video_id` = 4);
UPDATE `player_stats` SET   `Assist_King` = 10   , `3RB_Assist_King` = 50  WHERE (`player_name` = "Khephren Thuram" AND `drafter_name` = "Ugur" AND `video_id` = 4);
UPDATE `player_stats` SET `EU_CS_King` = 40, `3RB_CS_King` = 50   WHERE (`player_name` = "Aaron Ramsdale" AND `drafter_name` = "Ugur" AND `video_id` = 4);


INSERT  INTO `players` VALUES ('Rasmus Hojlund', "MUN", "ST");
INSERT  INTO `players` VALUES ('Joao Felix', "Barcelona", "LW");
INSERT  INTO `players` VALUES ('Gavi', "Barcelona", "MF");
INSERT  INTO `players` VALUES ('Momodou Lamin Sonko', "BK Hacken", "MF");


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Rasmus Hojlund", "Arden", 4 , 17, 4, Total_CS , Total_Match , 15 , 3 , default , default , TRUE,77);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Joao Felix", "Arden", 4 , 17 , 15, Total_CS , Total_Match , 14 , 8 , 3 , default , TRUE,81);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Marcus Rashford", "Arden", 4 , 22, 6, Total_CS , Total_Match , 13 , 5 , 5 , 0 , TRUE, 85);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`, `League_CS`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Alex Remiro", "Arden", 4 , 0, 0, 9 , Total_Match , 0 ,0 , 7 , default , default , TRUE, 84);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Gavi", "Arden", 4 , 6, 4, Total_CS , Total_Match , 4 , 6 , 4 , default , TRUE, 83);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Momodou Lamin Sonko", "Arden", 4 , 2, Total_Assist, Total_CS , Total_Match , 1 , League_Assist , default , default , TRUE, 60);


UPDATE `player_stats` SET `Best_Performance` = 32   , `3RB_Assist_King` = 25  WHERE (`player_name` = "Joao Felix" AND `drafter_name` = "Arden" AND `video_id` = 4);
UPDATE `player_stats` SET `3RB_CS_King` = 25   WHERE (`player_name` = "Alex Remiro" AND `drafter_name` = "Arden" AND `video_id` = 4);

INSERT  INTO `players` VALUES ('Xavi Simons', "RB Leipzig", "MF");
INSERT  INTO `players` VALUES ('Ronald Araujo', "Barcelona", "STP");
INSERT  INTO `players` VALUES ('Ferran Torres', "Barcelona", "LW");
INSERT  INTO `players` VALUES ('William Saliba', "Barcelona", "STP");
INSERT  INTO `players` VALUES ('Warren Zaire-Emery', "Paris", "MF");
INSERT  INTO `players` VALUES ('Rodrygo', "Real Madrid", "RW");
INSERT  INTO `players` VALUES ('Fabio Miretti', "Juventus", "MF");
INSERT  INTO `players` VALUES ('Nicolo Barella', "Inter", "MF");
INSERT  INTO `players` VALUES ('Sergej Milinkovic-Savic', "Al-Hilal", "MF");
INSERT  INTO `players` VALUES ('Youssoufa Moukoko', "Dortmund", "ST");
INSERT  INTO `players` VALUES ('Andre Onana', "MUN", "GK");



INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Erling Haaland", "Onur", 4 , 38, 7, 13 , 54 , 30 , default , 8 , 3 , TRUE,91);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Rodrygo", "Onur", 4 , 25, 14, 12 , 54 , 16 , 11 , 8 , 3 , TRUE,85);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Ferran Torres", "Onur", 4 , 15, 11, 10 , 49, default , 10 , default , default , TRUE,82);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Sergej Milinkovic-Savic", "Onur", 4 , 4, 8, 15 , 53 , default , 6 , default , default , TRUE,86);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Odysseas Vlachodimos", "Onur", 4 , 0, 0, 8 , 23 , 0 , 0 , 8, 0 , 0 , TRUE,81);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`, `overall`) VALUES ("Andre Onana", "Onur", 4 , 0, 0, 6 , 31 , 0 , 0 , 0 , 0 ,2,TRUE,84);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Alessandro Bastoni", "Onur", 4 , 2, 1, 14 , 54 , default , default , default , default , TRUE,85);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("William Saliba", "Onur", 4 , 0, 2, 14 , 46 , default , default , default , default , TRUE,84);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Ronald Araujo", "Onur", 4 , 0, 1, 10 , 51 , default , default , default , default , TRUE, 86);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Giorgio Scalvini", "Onur", 4 , 1, 0, 5 , 34 , default , default , default , default , TRUE, 75);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Eduardo Camavinga", "Onur", 4 , 0, 6, 13 , 52 , default , default , default , default , TRUE, 82);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Warren Zaire-Emery", "Onur", 4 , 0, 1, 0 , 13 , default , default , default , default , TRUE,77);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Ousmane Diomande", "Onur", 4 , 0, 0, 0 , 33 , default , default , default , default , TRUE,76);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Xavi Simons", "Onur", 4 , 0, 0, 0 , 21 , default , default , default , default , TRUE,80);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Youssoufa Moukoko", "Onur", 4 , 0, 1, 0 , 3 , default , default , default , default , TRUE,77);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Fabio Miretti", "Onur", 4 , 0, 0, 1 , 4 , default , default , default , default , TRUE,75);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Darwin Nunez", "Onur", 4 , 17, 4, 14 , 54 , default , default , default , default , TRUE,82);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`, `overall`) VALUES ("Nicolo Barella", "Onur", 4 , 5, 6, 14 , 54 , default , default , default , default , TRUE,86);


UPDATE `player_stats` SET `Best_Performance` = 45, `Best_Best_Performance` = 25, `3RB_Goal_King` = 50   WHERE (`player_name` = "Erling Haaland" AND `drafter_name` = "Onur" AND `video_id` = 4);
UPDATE `player_stats` SET  `Assist_King` = 20    WHERE (`player_name` = "Rodrygo" AND `drafter_name` = "Onur" AND `video_id` = 4);






-- 5th

START TRANSACTION;
INSERT IGNORE INTO `teams` VALUES ("Milan",'Serie A');

INSERT IGNORE INTO `players` VALUES ('Ryan Giles', "Luton Town", "LB");
INSERT IGNORE INTO `players` VALUES ('Fikayo Tomori', "Milan", "STP");
INSERT  IGNORE INTO `players` VALUES ('Kylian Mbappe', "Paris", "ST");
INSERT  INTO `players` VALUES ('Mads Andersen', "Luton Town", "STP");
INSERT  INTO `players` VALUES ('Tom Lockyer', "Luton Town", "STP");
INSERT  INTO `players` VALUES ('Mikel Oyarzabal', "Real Sociedad", "LW");
INSERT  INTO `players` VALUES ('Hakan Çalhanoğlu', "Inter", "MF");
INSERT  INTO `players` VALUES ('Jacob Brown', "Luton Town", "ST");
INSERT  INTO `players` VALUES ('Chiedozie Ogbene', "Luton Town", "RW");
INSERT  INTO `players` VALUES ('Luke Berry', "Luton Town", "MF");
INSERT  INTO `players` VALUES ('Frenkie de Jong', "Barcelona", "MF");

INSERT INTO teams VALUES ('Almeria', 'LaLiga');
INSERT INTO teams VALUES ('Athletic Bilbao', 'LaLiga');
INSERT INTO teams VALUES ('Cadiz', 'LaLiga');
INSERT INTO teams VALUES ('Celta Vigo', 'LaLiga');
INSERT INTO teams VALUES ('Granada', 'LaLiga');
INSERT INTO teams VALUES ('Getafe', 'LaLiga');
INSERT INTO teams VALUES ('Mallorca', 'LaLiga');
INSERT INTO teams VALUES ('Osasuna', 'LaLiga');
INSERT INTO teams VALUES ('Rayo Vallecano', 'LaLiga');
INSERT INTO teams VALUES ('Real Betis', 'LaLiga');
INSERT INTO teams VALUES ('Sevilla', 'LaLiga');
INSERT INTO teams VALUES ('Valencia', 'LaLiga');
INSERT INTO teams VALUES ('Deportivo', 'LaLiga');
INSERT INTO teams VALUES ('Las Palmas', 'LaLiga');

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`, `money_spent`) 
VALUES ("Gregor Kobel", "Arden", 5 , 0, 0, 10 , 54 , 0 , 0 , default , 0 , 0 , default, TRUE,100000000);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Kylian Mbappe", "Arden", 5 , 34, 6, 10 , 54 , 25 , 8 , default , default , TRUE, 156500000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Marcus Rashford", "Arden", 5 , 17, 3, 3 , 54 , default , default , default , default , TRUE, 69200000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Mehdi Taremi", "Arden", 5 , 12, 9, 9 , 53 , default , 9 , default , default , TRUE, 30000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Frenkie de Jong", "Arden", 5 , 7, 11, 9 , 51 , default , 6 , default , default , TRUE,122500000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Fikayo Tomori", "Arden", 5 , 1, 0, 8 , 48 , default , default , default , default , TRUE,64100000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Ryan Giles", "Arden", 5 , 2, 0, 0 , 16 , default , default , default , default , TRUE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Tom Lockyer", "Arden", 5 , 0, 0, 3 , 17 , default , default , default , default , TRUE,default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Mads Andersen", "Arden", 5 , 0, 0, 1 , 9 , default , default , default , default , TRUE,default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Mikel Oyarzabal", "Arden", 5 , 10, 3, 11 , 48 , default , default , default , default , TRUE,48700000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Hakan Çalhanoğlu", "Arden", 5 , 3, 3, 7 , 47 , default , default , default , default , TRUE,69200000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Jacob Brown", "Arden", 5 , 3, 1, 2 , 31 , default , default , default , default , TRUE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Chiedozie Ogbene", "Arden", 5 , 3, 2, 0 , 25 , default , default , default , default , TRUE, default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Luke Berry", "Arden", 5 , 3, 1, 0 , 3 , default , default , default , default , TRUE, default);

UPDATE `player_stats` SET  `Best_Performance` = 40 , `Goal_King` = 20, `3RB_Goal_King` = 25    WHERE (`player_name` = "Kylian Mbappe" AND `drafter_name` = "Arden" AND `video_id` = 5);
UPDATE `player_stats` SET  `Assist_King` = 20    WHERE (`player_name` = "Mehdi Taremi" AND `drafter_name` = "Arden" AND `video_id` =5);
UPDATE `player_stats` SET  `3RB_Assist_King` = 25  WHERE (`player_name` = "Frenkie de Jong" AND `drafter_name` = "Arden" AND `video_id` =5);
INSERT IGNORE INTO `teams` VALUES ("Atletico Madrid",'LaLiga');
INSERT IGNORE INTO `teams` VALUES ("Lazio",'Serie A');
INSERT IGNORE INTO `teams` VALUES ("Juventus",'Serie A');

INSERT  INTO `players` VALUES ('Antoine Griezmann', "Atletico Madrid", "ST");
INSERT  INTO `players` VALUES ('Mikel Merino', "Real Sociedad", "MF");
INSERT  INTO `players` VALUES ('Lukas Klostermann', "RB Leipzig", "STP");
INSERT  INTO `players` VALUES ('Alex Meret', "Napoli", "GK");
INSERT  INTO `players` VALUES ('Felipe Anderson', "Lazio", "RW");
INSERT  INTO `players` VALUES ('Federico Chiesa', "Juventus", "LW");

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`, `money_spent`) 
VALUES ("Alex Meret", "Ugur", 5 , 0, 0, 19 , 58 , 0 , 0 , 11 , 0 , 0 , 3, TRUE,27000000);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Kylian Mbappe", "Ugur", 5 , 39, 7, 18 , 59 , 24 , default , 7 , default , TRUE,153000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Antoine Griezmann", "Ugur", 5 , 23, 8, 15 , 48 , 14 , default , default , default , TRUE, 82700000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Mikel Merino", "Ugur", 5 , 13, 11, 14 , 55 , default , default , default , default , TRUE,52500000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Casemiro", "Ugur", 5 , 3, 1, 18 , 58 , default , default , default , default , TRUE, 71100000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Lukas Klostermann", "Ugur", 5 , 0, 0, 1 , 15 , default , default , default , default , TRUE,14100000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Min-jae Kim", "Ugur", 5 , 1, 0, 16 , 55 , default , default , default , default , TRUE, 47000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Kevin Danso", "Ugur", 5 , 1, 1, 6 , 46 , default , default , default , default , TRUE,47500000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Ronald Araujo", "Ugur", 5 , 0, 2, 12 , 45 , default , default , default , default , TRUE,100000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Felipe Anderson", "Ugur", 5 , 1, 0, 3 , 15 , default , default , default , default , TRUE,19000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Rodrygo", "Ugur", 5 , 16, 7, 18 , 54 , default , default , default , default , TRUE, 96400000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Federico Chiesa", "Ugur", 5 , 12, 4, 18 , default , default , default , default , default , TRUE, 55000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Mehdi Taremi", "Ugur", 5 , 9, 4, 5 , 24 , default , default , default , default , TRUE, 25000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Declan Rice", "Ugur", 5 , 2, 6, 18 , 52 , default , default , default , default , TRUE, 70600000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Bruno Guimaraes", "Ugur", 5 , 2, 11, 16 , 55 , default , default , default , default , TRUE, 64100000);

UPDATE `player_stats` SET `EU_Assist_King` = 40, `3RB_Assist_King` = 12 WHERE (`player_name` = "Bruno Guimaraes" AND `drafter_name` = "Ugur" AND `video_id` = 5);
UPDATE `player_stats` SET `Best_Performance`=46 , `3RB_Goal_King` = 50, `Best_Best_Performance`=25 WHERE (`player_name` = "Kylian Mbappe" AND `drafter_name` = "Ugur" AND `video_id` = 5);
UPDATE `player_stats` SET  `3RB_Assist_King` = 13 WHERE (`player_name` = "Mikel Merino" AND `drafter_name` = "Ugur" AND `video_id` = 5);
UPDATE `player_stats` SET  `3RB_CS_King` = 50 WHERE (`player_name` = "Alex Meret" AND `drafter_name` = "Ugur" AND `video_id` = 5);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`, `money_spent`) 
VALUES ("Alex Remiro", "Onur", 5 , 0, 0, 12 , 60 , 0 , 0 , 6 , 0 , 0 , 3, TRUE,44900000);

INSERT IGNORE INTO `teams` VALUES ("SC Braga",'Leaguea Portugal');

INSERT  INTO `players` VALUES ('Raphael Guerreiro', "Bayern", "LB");
INSERT  INTO `players` VALUES ('Willi Orban', "Bayern", "STP");
INSERT  INTO `players` VALUES ('Al-Musrati', "SC Braga", "MF");


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Mehdi Taremi", "Onur", 5 , 28, 7, 12 , 56 , 20 , default , 7 , default , TRUE, 26590000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Kylian Mbappe", "Onur", 5 , 29, 13, 13 , 59 , default , 9 , 7 , default , TRUE, 153000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Raphael Guerreiro", "Onur", 5 , 7, 12, 13 , 56 , default , 8 , default , default , TRUE, 32000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("John Stones", "Onur", 5 , 1, 4, 11 , 53 , default , default , default , default , TRUE, 55000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Willi Orban", "Onur", 5 , 2, 1, 2 , 36 , default , default , default , default , TRUE, 32300000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Alessandro Bastoni", "Onur", 5 , 3, 1, 7 , 39 , default , default , default , default , TRUE, 103100000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("William Saliba", "Onur", 5 , 0, 0, 7 , 44 , default , default , default , default , TRUE,72000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Ryan Giles", "Onur", 5 , 0, 0, 0 , 8 , default , default , default , default , TRUE,default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Rodrygo", "Onur", 5 , 16, 6, 6 , 48 , default , default , default , default , TRUE, 114500000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Bruno Guimaraes", "Onur", 5 , 8, 5, 11 , 54 , default , default , default , default , TRUE, 70700000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("İlkay Gündoğan", "Onur", 5 , 14, 3, 12 , 51 , default , default , default , default , TRUE, 59500000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Felipe Anderson", "Onur", 5 , 3, 2, 8 , 21 , default , default , default , default , TRUE, 21000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Al-Musrati", "Onur", 5 , 2, 5, 3 , 30 , default , default , default , default , TRUE, 30000000);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?` , `money_spent`) 
VALUES ("Casemiro", "Onur", 5 , 3, 3, 8 , 55 , default , default , default , default , TRUE, 77000000);


UPDATE `player_stats` SET `Best_Performance`=42, `3RB_Assist_King` = 50  WHERE (`player_name` = "Kylian Mbappe" AND `drafter_name` = "Onur" AND `video_id` = 5);
UPDATE `player_stats` SET  `3RB_CS_King` = 25  WHERE (`player_name` = "Alex Remiro" AND `drafter_name` = "Onur" AND `video_id` = 5);


-- Check for errors, if any error occurs then ROLLBACK, otherwise COMMIT
COMMIT;


-- 6th video

/*INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) 
VALUES ("Lautaro Martínez", "Ugur", 4 , Total_Goal, Total_Assist, Total_CS , Total_Match , League_Goal , League_Assist ,League_CS , EU_Goal , EU_Assist , EU_CS, TRUE);*/
/*INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Lautaro Martínez", "Ugur", 4 , Total_Goal, Total_Assist, Total_CS , Total_Match , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);*/




START TRANSACTION;
INSERT  INTO `players` VALUES ('Unai Simon', "Athletic Bilbao", "GK");
INSERT  INTO `players` VALUES ('Stole Dimitrievski', "Rayo Vallecano", "GK");
INSERT  INTO `players` VALUES ('Iddrisu Baba', "Almería", "MF");
INSERT  INTO `players` VALUES ('Jose Gaya', "Valencia", "LB");
INSERT  INTO `players` VALUES ('Fali', "Cadiz", "STP");
INSERT  INTO `players` VALUES ('Vedat Muriqi', "Mallorca", "ST");
INSERT  INTO `players` VALUES ('Nabil Fekir', "Real Betis", "MF");
INSERT  INTO `players` VALUES ('Youssef En-Nesyri', "Sevilla", "ST");
INSERT  INTO `players` VALUES ('Alejandro Catena', "Osasuna", "STP");
INSERT  INTO `players` VALUES ('Mauro Arambarri ', "Getafe", "MF");
INSERT  INTO `players` VALUES ('Dani Parejo', "Villarreal", "MF");
INSERT  INTO `players` VALUES ('Renato Tapia', "Celta Vigo",  "MF");
INSERT  INTO `players` VALUES ('Cesar Montes', "Almeria", "STP");
INSERT  INTO `players` VALUES ('Oscar Melendo', "Granada", "MF");
INSERT  INTO `players` VALUES ('Jonathan Viera', "Las Palmas", "MF");
INSERT  INTO `players` VALUES ('Ruben Duarte', "Deportivo", "LB");


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Unai Simon", "Arden", 6 , 0, 0, 5 , 32 , 0 , 0 ,5 , 0 , 0 , 0 , TRUE,7);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Stole Dimitrievski", "Arden", 6 , 0, 0, 5 , 15 , 0 , 0 ,4 , 0 , 0 , 1, TRUE,13);


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Vinicius Junior", "Arden", 6 , 23, 8, 10 , 47 , 19 , 6 , default , default , TRUE,20);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Antoine Griezmann", "Arden", 6 , 21, 8, 10 , 47 , 15 , 7 , 6 , default , TRUE,1  );
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Viktor Tsygankov", "Arden", 6 , 15, 4, 9 , 46 , 13 , default , default , default , TRUE,3);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Jose Gaya", "Arden", 6 , 0, 0, 0 , 18 , default , default , default , default , TRUE,6);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Mikel Merino", "Arden", 6 , 1, 2, 5 , 41 , default , default , default , default , TRUE,2);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Fali", "Arden", 6 , 2, 1, 8 , 33 , default , default , default , default , TRUE,19);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Cesar Montes", "Arden", 6 , 0, 1, 3 , 22 , default , default , default , default , TRUE,15);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Alejandro Catena", "Arden", 6 , 0, 1, 5 , 26 , default , default , default , default , TRUE,9);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Ruben Duarte", "Arden", 6 , 0, 0, 7 , 21 , default , default , default , default , TRUE,18);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Mauro Arambarri ", "Arden", 6 , 0, 0, 3 , 23 , default , default , default , default , TRUE,10);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Renato Tapia", "Arden", 6 , 0, 2, 5 , 32 , default , default , default , default , TRUE,14);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Iddrisu Baba", "Arden", 6 , 0, 3, 8 , 32 , default , default , default , default , TRUE,default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Ronald Araujo", "Arden", 6 , 1, 1, 4 , 40 , default , default , default , default , TRUE,4);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Nabil Fekir", "Arden", 6 , 1, 2, 3 , 31 , default , default , default , default , TRUE,5);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Dani Parejo", "Arden", 6 , 8, 4, 8 , 37 , default , default , default , default , TRUE,11);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Jonathan Viera", "Arden", 6 , 0, 3, 8 , 31 , default , default , default , default , TRUE,17);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Oscar Melendo", "Arden", 6 , 1, 2, 3 , 18 , default , default , default , default , TRUE,16);



UPDATE `player_stats` SET  `Best_Performance` = 31 ,  `3RB_Goal_king` = 25
WHERE (`player_name` = "Vinicius Junior" AND `drafter_name` = "Arden" AND `video_id` = 6);



INSERT  INTO `players` VALUES ('Enes Ünal', "Getafe", "ST");
INSERT  INTO `players` VALUES ('David Garcia', "Osasuna", "STP");
INSERT  INTO `players` VALUES ('Marcos Acuna', "Sevilla", "LB");
INSERT  INTO `players` VALUES ('Aleix Garcia', "Girona", "MF");
INSERT  INTO `players` VALUES ('Jose Maria Gimenez', "Atletico Madrid", "STP");
INSERT  INTO `players` VALUES ('Rodri Sanchez', "Real Betis", "MF");
INSERT INTO `players` VALUES ('Oihan Sancet', "Athletic Bilbao", "MF");
INSERT INTO `players` VALUES ('Fran Beltran', "Celta Vigo", "MF");
INSERT INTO `players` VALUES ('Edgar Gonzalez', "Almeria", "MF");
INSERT INTO `players` VALUES ('Andre Almeida', "Valencia", "RB");
INSERT INTO `players` VALUES ('Jose Copete', "Mallorca", "STP");
INSERT INTO `players` VALUES ('Alberto Moleiro', "Las Palmas", "MF");
INSERT INTO `players` VALUES ('Wilson Manafa', "Granada", "RB");

INSERT INTO `players` VALUES ('Alvaro García', "Rayo Vallecano", "MF");
INSERT INTO `players` VALUES ('Andoni Gorosabel', "Deportivo", "RB");
INSERT INTO `players` VALUES ('David Gil', "Cadiz", "GK");


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Alex Remiro", "Onur", 6 , 0, 0, 12 , 45 , 0 , 0 ,11 , 0 , 0 , 1 , TRUE,2);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("David Gil", "Onur", 6 , 0, 0, 0 , 2 , default , default , default , default , TRUE,21);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Enes Ünal", "Onur", 6 , 22, 4, 11 , 47 , 20 , default , default , default , TRUE,4);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Rodrygo", "Onur", 6 , 23, 13, 11 , 47 , 17 , 11 , 6 , default , TRUE,5);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Alvaro García", "Onur", 6 , 15, 6, 10 , 41 , default , default , 5 , default , TRUE,19);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Alberto Moleiro", "Onur", 6 , 7, 3, 9 , 35 , default , default , default , default , TRUE,16);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Oihan Sancet", "Onur", 6 , 6, 6, 13 , 47 , default , default , default , default , TRUE,11);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Frenkie De Jong", "Onur", 6 , 4, 7, 11 , 45 , default , default , default , default , TRUE,18);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Andre Almeida", "Onur", 6 , 3, 3, 2 , 29 , default , default , default , EU_Assist , TRUE,14);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Marcos Acuna", "Onur", 6 , 2, 1, 10 , 46 , default , default , default , default , TRUE,3);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Edgar Gonzalez", "Onur", 6 , 2, 0, 10 , 38 , default , default , default , default , TRUE,13);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Rodri Sanchez", "Onur", 6 , 1, 1, 1 , 18 , default , default , default , default , TRUE,10);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("Jose Maria Gimenez", "Onur", 6 , 0, 0, 8 , 46 , default , default , default , default , TRUE,9);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`,`drafted_order`) 
VALUES ("David Garcia", "Onur", 6 , 0, 1, 7 , 39 , default , default , default , default , TRUE,1);


UPDATE `player_stats` SET  `Best_Performance` = 36 , `3RB_Assist_King` = 50  ,  `3RB_Goal_king` = 25
WHERE (`player_name` = "Rodrygo" AND `drafter_name` = "Onur" AND `video_id` = 6);
UPDATE `player_stats` SET  `3RB_CS_king` = 50
WHERE (`player_name` = "Alex Remiro" AND `drafter_name` = "Onur" AND `video_id` = 6);


INSERT INTO `players` VALUES ('Robert Lewandowski', "Barcelona", "ST");
INSERT INTO `players` VALUES ('Jan Oblak', "Atletico Madrid", "GK");
INSERT INTO `players` VALUES ('Sergi Darder', "Mallorca", "MF");
INSERT INTO `players` VALUES ('Guido Rodriguez', "Real Betis", "MF");
INSERT INTO `players` VALUES ('Isi Palazon', "Rayo Vallecano", "MF");
INSERT INTO `players` VALUES ('Nico Williams', "Athletic Bilbao", "RW");
INSERT INTO `players` VALUES ('Joseph Aidoo', "Celta Vigo", "STP");
INSERT INTO `players` VALUES ('Marcao', "Sevilla", "STP");
INSERT INTO `players` VALUES ('Alexander Sorloth', "Villarreal", "ST");
INSERT INTO `players` VALUES ('Lucas Robertone', "Almeria", "MF");
INSERT INTO `players` VALUES ('Gabriel Paulista', "Valencia", "STP");
INSERT INTO `players` VALUES ('Chimy Avila', "Osasuna", "ST");
INSERT INTO `players` VALUES ('Munir El Haddadi', "Las Palmas", "ST");
INSERT INTO `players` VALUES ('Víctor Chust', "Cadiz", "STP");
INSERT INTO `players` VALUES ('Ianis Hagi', "Deportivo", "MF");
INSERT INTO `players` VALUES ('David Soria', "Getafe", "GK");
INSERT INTO `players` VALUES ('Alvaro Carreras', "Granada", "MF");
INSERT INTO `players` VALUES ('Robin Le Normand', "Real Sociedad", "STP");
INSERT INTO `players` VALUES ('Arnau Martínez', "Girona", "MF");


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Jan Oblak", "Ugur", 6 , 0, 1, 11 , 53 , default , default ,8 , default , default , default, TRUE,2);


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Robert Lewandowski", "Ugur", 6 , 29, 12, 12 , 51 , 24 , 8 ,default , default , 2 , default, TRUE,1);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Nico Williams", "Ugur", 6 , 24, 9, 14 , 52 , 20 , 7 ,default , default , default , default, TRUE,6);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Alexander Sorloth", "Ugur", 6 , 25, 4, 9 , 52 , 18 , default , default , 4 , default , default, TRUE,10);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Federico Valverde", "Ugur", 6 , 12, 11, 10 , 54 , default , 9 ,default , default , default , default, TRUE,8);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Lucas Robertone", "Ugur", 6 , 6, 6, 5 , 45 , default , default ,default , default , default , default, TRUE,11);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Isi Palazon", "Ugur", 6 , 5, 5, 7 , 44 , default , default ,default , default , default , default, TRUE,5);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Chimy Avila", "Ugur", 6 , 5, 0, 4 , 39 , default , default ,default , default , default , default, TRUE,13);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Sergi Darder", "Ugur", 6 , 2, 6, 4 , 42 , default , default ,default , default , default , default, TRUE,3);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Iddrisu Baba", "Ugur", 6 , 2, 0, 3 , 33 , default , default ,default , default , default , default, TRUE,default);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Marcao", "Ugur", 6 , 1, 0, 12 , 51 , default , default ,default , default , default , default, TRUE,9);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Joseph Aidoo", "Ugur", 6 , 0, 0, 8 , 44 , default , default ,default , default , default , default, TRUE,7);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Robin Le Normand", "Ugur", 6 , 0, 0, 8 , 42 , default , default ,default , default , default , default, TRUE,20);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Víctor Chust", "Ugur", 6 , 1, 0, 0 , 12 , default , default ,default , default , default , default, TRUE,15);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Munir El Haddadi", "Ugur", 6 , 1, 2, 0 , 23 , default , default ,default , default , default , default, TRUE,14);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`,`drafted_order`) 
VALUES ("Gabriel Paulista", "Ugur", 6 , 1, 2, 9 , 31 , default , default ,default , default , default , default, TRUE,12);



UPDATE `player_stats` SET  `Best_Performance` = 41  , `Goal_King` = 20, `Best_Best_Performance` = 25 , `3RB_Goal_king` = 50, `3RB_Assist_King` = 25  
WHERE (`player_name` = "Robert Lewandowski" AND `drafter_name` = "Ugur" AND `video_id` = 6);

UPDATE `player_stats` SET  `3RB_CS_king` = 25
WHERE (`player_name` = "Jan Oblak" AND `drafter_name` = "Ugur" AND `video_id` = 6);
-- Check for errors, if any error occurs then ROLLBACK, otherwise COMMIT
COMMIT;


START TRANSACTION;
INSERT INTO teams VALUES ('Al-Ahli', 'Sudi Pro League');
INSERT INTO teams VALUES ('Feyenoord', 'Eredivisie');
INSERT INTO teams VALUES ('Toronto', 'MLS');
INSERT INTO teams VALUES ('Leicester City', 'Championship');
INSERT INTO teams VALUES ('Lille', 'League 1');
INSERT INTO teams VALUES ('Fiorentina', 'Serie A');
INSERT INTO teams VALUES ('Taranto', 'Other');
INSERT INTO teams VALUES ('Borussia Mönchengladbach', 'BundesLeaguea');


INSERT INTO `players` VALUES ('Harry Kane', 'Bayern', "ST");
INSERT INTO `players` VALUES ('Dayot Upamecano', 'Bayern', "STP");
INSERT INTO `players` VALUES ('Rodri', 'Man City', "DMF");
INSERT INTO `players` VALUES ('Roger Ibanez', 'Al-Ahli', "STP");
INSERT INTO `players` VALUES ('Alisson', 'Liverpool', "GK");
INSERT INTO `players` VALUES ('David Alaba', 'Real Madrid', "STP");
INSERT INTO `players` VALUES ('Kosuke Nakamura', 'Portimonense', "GK");
INSERT INTO `players` VALUES ('Wilfred Ndidi', 'Leicester City', "MF");
INSERT INTO `players` VALUES ('Marcus Edwards', 'Sporting CP', "RW");
INSERT INTO `players` VALUES ('Hugo Ekitike', 'Paris', "ST");
INSERT INTO `players` VALUES ('Ismaily', 'Lille', "LB");
INSERT INTO `players` VALUES ('Luka Ivanusec', 'Feyenoord', "MF");
INSERT INTO `players` VALUES ('Felix Nmecha', 'Dortmund', "MF");
INSERT INTO `players` VALUES ('Ederson', 'Man City', "GK");
INSERT INTO `players` VALUES ('Ciro Immobile', 'Lazio', "ST");
INSERT INTO `players` VALUES ('Piotr Zielinski', 'Napoli', "MF");
INSERT INTO `players` VALUES ('Oleksandr Zinchenko', 'Arsenal', "LB");
INSERT INTO `players` VALUES ('Unai Nunez', 'Celta Vigo', "STP");
INSERT INTO `players` VALUES ('Lucas Hernandez', 'Paris', "LB");
INSERT INTO `players` VALUES ('Trent Alexander-Arnold', 'Liverpool', "RB");
INSERT INTO `players` VALUES ('Jonathan Ikone', 'Fiorentina', "RW");
INSERT INTO `players` VALUES ('Marco Asensio', 'Paris', "LW");
INSERT INTO `players` VALUES ('Wataru Endo', 'Liverpool', "MF");
INSERT INTO `players` VALUES ('Rafael Leao', 'Milan', "LW");
INSERT INTO `players` VALUES ('Yeray Alvarez', 'Athletic Bilbao', "STP");
INSERT INTO `players` VALUES ('Neymar', 'Al-Hilal', "ST");
INSERT INTO `players` VALUES ('Christian Eriksen', 'MUN', "MF");
INSERT INTO `players` VALUES ('Martin Zubimendi', 'Real Sociedad', "MF");
INSERT INTO `players` VALUES ('David Neres', 'Benfica', "RW");
INSERT INTO `players` VALUES ('Loris Zonta', 'Taranto', "MF");
INSERT INTO `players` VALUES ('Jonas Omlin', 'Borussia Mönchengladbach', "GK");
INSERT INTO `players` VALUES ('Niklas Süle', 'Dortmund', "STP");
INSERT INTO `players` VALUES ('Dani Olmo', 'RB Leipzig', "MF");
INSERT INTO `players` VALUES ('Nicolas Otamendi', 'Benfica', "STP");
INSERT INTO `players` VALUES ('Yusuf Yazıcı', 'Lille', "MF");
INSERT INTO `players` VALUES ('Manuel Akanji', 'Man City', "STP");
INSERT INTO `players` VALUES ('Isco', 'Real Betis', "MF");
INSERT INTO `players` VALUES ('Lorenzo Insigne', 'Toronto FC', "MF");
COMMIT;


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) 
VALUES ("Andre Onana", "Ugur", 7 , Total_Goal, Total_Assist, 14 , Total_Match , League_Goal , League_Assist ,7 , EU_Goal , EU_Assist , 3, TRUE);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Neymar", "Ugur", 7 , 34, 12, Total_CS , Total_Match , 24 , 7 , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Christopher Nkunku", "Ugur", 7 , Total_Goal, Total_Assist, Total_CS , Total_Match , 18 , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Kevin De Bruyne", "Ugur", 7 , Total_Goal, 14, Total_CS , Total_Match , League_Goal , 10 , 4 , 3 , TRUE);

UPDATE `player_stats` SET  `Best_Performance` = 46 ,  `Best_Best_Performance` = 25
WHERE (`player_name` = "Neymar" AND `drafter_name` = "Ugur" AND `video_id` = 7);
UPDATE `player_stats` SET   `3RB_Assist_King` = 50
WHERE (`player_name` = "Kevin De Bruyne" AND `drafter_name` = "Ugur" AND `video_id` = 7);
UPDATE `player_stats` SET   `3RB_CS_King` = 25
WHERE (`player_name` = "Andre Onana" AND `drafter_name` = "Ugur" AND `video_id` = 7);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) 
VALUES ("Alisson", "Arden", 7 , Total_Goal, Total_Assist, 15 , Total_Match , League_Goal , 4 ,10 , EU_Goal , EU_Assist , 3 , TRUE);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Harry Kane", "Arden", 7 , 39, 6, Total_CS , Total_Match , 29 , 3 , 7 , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Heung-min Son", "Arden", 7 , Total_Goal, Total_Assist, Total_CS , Total_Match , 13 , 4 , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Mohamed Salah", "Arden", 7 , Total_Goal, Total_Assist, Total_CS , Total_Match , 12 , 4 , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Mikel Oyarzabal", "Arden", 7 , Total_Goal, Total_Assist, Total_CS , Total_Match , 6 , 4 , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Darwin Nunez", "Arden", 7 , Total_Goal, Total_Assist, Total_CS , Total_Match , 5 , 3 , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("David Alaba", "Arden", 7 , Total_Goal, Total_Assist, Total_CS , Total_Match , 1 , 2 ,8, EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Dayot Upamecano", "Arden", 7 , Total_Goal, Total_Assist, Total_CS , Total_Match , 1 , 1 , 8,EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Isco", "Arden", 7 , Total_Goal, Total_Assist, Total_CS , 10 , 0 , 1 ,0, EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Rodri", "Arden", 7 , Total_Goal, Total_Assist, Total_CS , Total_Match , 1 , 1 ,10, EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Roger Ibanez", "Arden", 7 , Total_Goal, Total_Assist, Total_CS , Total_Match , 1 , 0 ,10 ,EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Ronald Araujo", "Arden", 7 , Total_Goal, Total_Assist, Total_CS , Total_Match , 2 , 0 ,8, EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Lautaro Martínez", "Arden", 7 , Total_Goal, Total_Assist, Total_CS , Total_Match , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);

UPDATE `player_stats` SET  `Best_Performance` = 45 , `Goal_King` = 20, `3RB_Goal_King` = 50
WHERE (`player_name` = "Harry Kane" AND `drafter_name` = "Arden" AND `video_id` = 7);
UPDATE `player_stats` SET  `CS_King` = 20, `3RB_CS_king` = 50
WHERE (`player_name` = "Alisson" AND `drafter_name` = "Arden" AND `video_id` = 7);


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) 
VALUES ("Ederson", "Onur", 7 , 0, 1, 12 , 56 , default , default ,11 , default , default , 1 , TRUE);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Victor Osimhen", "Onur", 7 , 38, 3, 14 , 56 , 26 , League_Assist , 10 , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Rafael Leao", "Onur", 7 , 22, 7, 13 , 56 , 17 , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Martin Odegaard", "Onur", 7 , 6, 13, 12 , 56 , League_Goal , 9 , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Trent Alexander-Arnold", "Onur", 7 , 2, 12, 13 , 55 , League_Goal , 7 , EU_Goal , 5 , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Lorenzo Insigne", "Onur", 7 , 8, 6, 0 , 41 , League_Goal , 5 , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Marco Asensio", "Onur", 7 , 14, 12, 11 , 56 , League_Goal , League_Assist , EU_Goal , 7 , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Casemiro", "Onur", 7 , 1, 2, 10 , 51 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("John Stones", "Onur", 7 , 2, 3, 10 , 49 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Willi Orban", "Onur", 7 , 1, 0, 5 , 31 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Lucas Hernandez", "Onur", 7 , 0, 0, 7 , 37 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Yeray Alvarez", "Onur", 7 , 0, 0, 4 , 18 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Ciro Immobile", "Onur", 7 , 11, 2, 4 , 55 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Ruben Neves", "Onur", 7 , 3, 3, 13 , 55 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Piotr Zielinski", "Onur", 7 , 2, 0, 1 , 26 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Jonathan Ikone", "Onur", 7 , 0, 1, 0 , 16 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Oleksandr Zinchenko", "Onur", 7 , 0, 0, 0 , 0 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Marcos Acuna", "Onur", 7 , 0, 0, 0 , 9 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Unai Nunez", "Onur", 7 , 0, 0, 0 , 7 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Wataru Endo", "Onur", 7 , 0, 0, 0 , 13 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);


UPDATE `player_stats` SET  `Best_Performance` = 41 , `Goal_King` = 10, `EU_Goal_King` = 40, `3RB_Goal_king` = 25
WHERE (`player_name` = "Victor Osimhen" AND `drafter_name` = "Onur" AND `video_id` = 7);

UPDATE `player_stats` SET  `EU_Assist_King` = 40
WHERE (`player_name` = "Marco Asensio" AND `drafter_name` = "Onur" AND `video_id` = 7);

UPDATE `player_stats` SET  `3RB_Assist_King` = 25
WHERE (`player_name` = "Martin Odegaard" AND `drafter_name` = "Onur" AND `video_id` = 7);


-- 8. video


INSERT IGNORE INTO `teams` VALUES ('Paris', 'League 1');
INSERT IGNORE INTO `teams` VALUES ('Miami', 'MLS');
INSERT IGNORE INTO `teams` VALUES ('Galatasaray', 'Süper League');
INSERT IGNORE INTO `teams` VALUES ('Bayren', 'BundesLeaguea');
INSERT IGNORE INTO `teams` VALUES ('Barcelona', 'LaLiga');
INSERT IGNORE INTO `teams` VALUES ('PSV Eindhoven', 'Eredivisie');
INSERT IGNORE INTO `teams` VALUES ('Inter', 'Serie A');
INSERT IGNORE INTO `teams` VALUES ('East Bengal FC', 'Hindistan');
INSERT IGNORE INTO `teams` VALUES ('Bengaluru FC', 'Hindistan');
INSERT IGNORE INTO `teams` VALUES ('Mumbai City', 'Hindistan');
INSERT IGNORE INTO `teams` VALUES ('Palmeiras', 'Brezilya');
INSERT IGNORE INTO `teams` VALUES ('Leeds', 'Championship');
INSERT IGNORE INTO `teams` VALUES ('Mohun Bagan Super Giant', 'Hindistan');
INSERT IGNORE INTO `teams` VALUES ('Milan', 'Serie A');
INSERT IGNORE INTO `teams` VALUES ('Leeds United', 'Championship');
INSERT IGNORE INTO `teams` VALUES ('Napoli', 'Serie A');
INSERT IGNORE INTO `teams` VALUES ('Feyenoord', 'Eredivisie');
INSERT IGNORE INTO `teams` VALUES ('Real Madrid', 'LaLiga');
INSERT IGNORE INTO `teams` VALUES ('Dortmund', 'BundesLeaguea');
INSERT IGNORE INTO `teams` VALUES ('Bayern', 'BundesLeaguea');
INSERT IGNORE INTO `teams` VALUES ('Leicester City', 'Championship');
INSERT IGNORE INTO `teams` VALUES ('Al-Ittihad', 'Saudi Pro League');
INSERT IGNORE INTO `teams` VALUES ('Man City', 'Premier League');
INSERT IGNORE INTO `teams` VALUES ('Ajax', 'Eredivisie');
INSERT IGNORE INTO `teams` VALUES ('Flamengo', 'Brezilya');
INSERT IGNORE INTO `teams` VALUES ('Southampton FC', 'Championship');
INSERT IGNORE INTO `teams` VALUES ('Atletico Mineiro', 'Brezilya');
INSERT IGNORE INTO `teams` VALUES ('Al-Hilal', 'Saudi Pro League');
INSERT IGNORE INTO `teams` VALUES ('Al-Nassr', 'Saudi Pro League');
INSERT IGNORE INTO `teams` VALUES ('Athletico Paranaense', 'Brezilya');







INSERT IGNORE INTO `players` VALUES ('Kylian Mbappe', "Paris", "ST");
INSERT IGNORE INTO `players` VALUES ('Marquinhos', "Paris", "STP");
INSERT IGNORE INTO `players` VALUES ('Gianluigi Donnarumma', "Paris", "GK");
INSERT IGNORE INTO `players` VALUES ('Lionel Messi', "Miami", "RW");
INSERT IGNORE INTO `players` VALUES ('Lucas Torreira', "Galatasaray", "DMF");
INSERT IGNORE INTO `players` VALUES ('Joshua Kimmich', "Bayren", "DMF");
INSERT IGNORE INTO `players` VALUES ('Jules Kounde', "Barcelona", "STP");
INSERT IGNORE INTO `players` VALUES ('Hirving Lozano', "PSV Eindhoven", "RW");
INSERT IGNORE INTO `players` VALUES ('Nicolo Barella', "Inter", "MF");
INSERT IGNORE INTO `players` VALUES ('Borja Herrera', "East Bengal FC", "STP");
INSERT IGNORE INTO `players` VALUES ('Slavko Damjanovic', "Bengaluru FC", "MF");
INSERT IGNORE INTO `players` VALUES ('Akash Mishra', "Mumbai City", "LB");
INSERT IGNORE INTO `players` VALUES ('Ronaldo Cabrais', "Palmeiras", "MF");
INSERT IGNORE INTO `players` VALUES ('Ethan Ampadu', "Leeds", "STP");
INSERT IGNORE INTO `players` VALUES ('Min-jae Kim', "Bayern", "STP");
INSERT IGNORE INTO `players` VALUES ('Hector Yuste', "Mohun Bagan Super Giant", "MF");
INSERT IGNORE INTO `players` VALUES ('Joao Cancelo', "Barcelona", "RB");
INSERT IGNORE INTO `players` VALUES ('Fikayo Tomori', "Milan", "STP");
INSERT IGNORE INTO `players` VALUES ('Achraf Hakimi', "Paris", "RB");
INSERT IGNORE INTO `players` VALUES ('Daniel James', "Leeds United", "LW");
INSERT IGNORE INTO `players` VALUES ('Victor Osimhen', "Napoli", "ST");
INSERT IGNORE INTO `players` VALUES ('Alessandro Bastoni', "Inter", "STP");
INSERT IGNORE INTO `players` VALUES ('David Hancko', "Feyenoord", "STP");
INSERT IGNORE INTO `players` VALUES ('Valverde', "Real Madrid", "MF");
INSERT IGNORE INTO `players` VALUES ('Lutsharel Geertruida', "Feyenoord", "RB");
INSERT IGNORE INTO `players` VALUES ('Gregor Kobel', "Dortmund", "GK");
INSERT IGNORE INTO `players` VALUES ('Matthijs de Leaguet', "Bayern", "STP");
INSERT IGNORE INTO `players` VALUES ('Jamal Musiala', "Bayern", "MF");
INSERT IGNORE INTO `players` VALUES ('Wilfred Ndidi', "Leicester City", "MF");
INSERT IGNORE INTO `players` VALUES ('Karim Benzema', "Al-Ittihad", "ST");
INSERT IGNORE INTO `players` VALUES ('Ousmane Dembele', "Paris", "RW");
INSERT IGNORE INTO `players` VALUES ('Lucas Hernandez', "Paris", "LB");
INSERT IGNORE INTO `players` VALUES ('Ruben Dias', "Man City", "STP");
INSERT IGNORE INTO `players` VALUES ('Ricardo Pereira', "Leicester City", "RB");
INSERT IGNORE INTO `players` VALUES ('Marco Asensio', "Paris", "RW");
INSERT IGNORE INTO `players` VALUES ('Gurpreet Singh Sandhu', "Bengaluru FC", "GK");
INSERT IGNORE INTO `players` VALUES ('Steven Berghuis', "Ajax", "RW");
INSERT IGNORE INTO `players` VALUES ('Oswaldinato', "Flamengo", "MF");
INSERT IGNORE INTO `players` VALUES ('Bernardo Silva', "Man City", "RW");
INSERT IGNORE INTO `players` VALUES ('Raphael Guerreiro', "Bayern", "LB");
INSERT IGNORE INTO `players` VALUES ('Harry Kane', "Beyern", "ST");
INSERT IGNORE INTO `players` VALUES ('Kevin de Bruyne', "Man City", "MF");
INSERT IGNORE INTO `players` VALUES ('Frenkie De Jong', "Barcelona", "MF");
INSERT IGNORE INTO `players` VALUES ('Neymar', "Al-Hilal", "LW");
INSERT IGNORE INTO `players` VALUES ('Fred', "Fenerbahçe", "MF");
INSERT IGNORE INTO `players` VALUES ('Ronald Araujo', "Barcelona", "STP");
INSERT IGNORE INTO `players` VALUES ('Alphonso Davies', "Bayern", "LB");
INSERT IGNORE INTO `players` VALUES ('Josue Chiamulera', "Athletico Paranaense", "MF");
INSERT IGNORE INTO `players` VALUES ('Leroy Sane', "Bayern", "LW");
INSERT IGNORE INTO `players` VALUES ('Aymeric Laporte', "Al-Nassr", "STP");
INSERT IGNORE INTO `players` VALUES ('Giovanni Di Lorenzo', "Napoli", "RB");
INSERT IGNORE INTO `players` VALUES ('Jude Bellingham', "Real Madrid", "MF");
INSERT IGNORE INTO `players` VALUES ('Kalidou Koulibaly', "Al-Hilal", "STP");
INSERT IGNORE INTO `players` VALUES ('Kyle Walker-Peters', "Southampton FC", "RB");
INSERT IGNORE INTO `players` VALUES ('Welington Dano', "Atletico Mineiro", "STP");
INSERT IGNORE INTO `players` VALUES ('Thibaut Courtois', "Real Madrid", "GK");
INSERT IGNORE INTO `players` VALUES ('Sergej Milinkovic-Savic', "Al-Hilal", "MF");
INSERT IGNORE INTO `players` VALUES ('David Ospina', "Al-Nassr", "GK");
INSERT IGNORE INTO `players` VALUES ('Ederson', "Man City", "GK");
INSERT IGNORE INTO `players` VALUES ('Talisca', "Al-Nassr", "MF");


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) 
VALUES ("Gianluigi Donnarumma", "Arden", 8 , 0, 2, 18 , 56 , League_Goal , League_Assist ,12 , EU_Goal , EU_Assist , 5, TRUE);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Kylian Mbappe", "Arden", 8 , 33, 7, 18 , 56 , 20 , 4 , 12 , 3 , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Ronaldo Cabrais", "Arden", 8 , 23, 7, 17 , 56 , 17 , League_Assist , 5 , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Joao Cancelo", "Arden", 8 , 4, 17, 17 , 56 , League_Goal , 15 , 2 , 0 , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Joshua Kimmich", "Arden", 8 , 4, 6, 16 , 51 , League_Goal , 6 , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Lionel Messi", "Arden", 8 , 11, 4, 11 , 51 , League_Goal , League_Assist , EU_Goal , 3 , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Nicolo Barella", "Arden", 8 , 17, 7, 17 , 55 , League_Goal , League_Assist , 5 , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Min-jae Kim", "Arden", 8 , 0, 0, 12 , 49 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Slavko Damjanovic", "Arden", 8 , 0, 0, 1 , 6 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Fikayo Tomori", "Arden", 8 , 0, 0, 6 , 47 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Hector Yuste", "Arden", 8 , 0, 0, 1 , 5 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Borja Herrera", "Arden", 8 , 0, 0, 0 , 4 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Hirving Lozano", "Arden", 8 , 9, 0, 0 , 41 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Marquinhos", "Arden", 8 , 2, 3, 17 , 54 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Jules Kounde", "Arden", 8 , 3, 2, 18 , 50 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Achraf Hakimi", "Arden", 8 , 6, 2, 19 , 56 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);




UPDATE `player_stats` SET  `EU_Goal_King` = 40, `Best_Performance` = 40 , `3RB_Goal_King` = 10
WHERE (`player_name` = "Kylian Mbappe" AND `drafter_name` = "Arden" AND `video_id` = 8);

UPDATE `player_stats` SET  `Assist_King` = 20 , `3RB_Assist_King` = 25
WHERE (`player_name` = "Joao Cancelo" AND `drafter_name` = "Arden" AND `video_id` = 8);


UPDATE `player_stats` SET  `EU_CS_King` = 40,  `3RB_CS_King` = 25
WHERE (`player_name` = "Gianluigi Donnarumma" AND `drafter_name` = "Arden" AND `video_id` = 8);


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) 
VALUES ("Gregor Kobel", "Ugur", 8 , 0, 1, 14 , 55 , League_Goal , League_Assist ,9 , EU_Goal , EU_Assist , 4, TRUE);


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Karim Benzema", "Ugur", 8 , 28, 14, 15 , 55 , 19 , 8 , 7 , 5 , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Victor Osimhen", "Ugur", 8 , 24, 5, 14 , 55 , 15 , League_Assist , 7 , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Marco Asensio", "Ugur", 8 , 9, 11, 14 , 55 , League_Goal , 9 , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Raphael Guerreiro", "Ugur", 8 , 1, 0, 0 , 2 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Lucas Hernandez", "Ugur", 8 , 1, 0, 3 , 19 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Matthijs de Leaguet", "Ugur", 8 , 0, 0, 10 , 42 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Alessandro Bastoni", "Ugur", 8 , 2, 1, 13 , 50 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("David Hancko", "Ugur", 8 , 1, 0, 4 , 22 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Wilfred Ndidi", "Ugur", 8 , 0, 0, 0 , 4 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Oswaldinato", "Ugur", 8 , 14, 1, 0 , 40 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Ousmane Dembele", "Ugur", 8 , 6, 4, 5 , 53 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Bernardo Silva", "Ugur", 8 , 5, 8, 14 , 55 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Jamal Musiala", "Ugur", 8 , 4, 6, 9 , 52 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Ruben Dias", "Ugur", 8 , 2, 1, 13 , 50 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Steven Berghuis", "Ugur", 8 , 2, 2, 7 , 45 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Valverde", "Ugur", 8 , 15, 8, 13 , 55 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Lutsharel Geertruida", "Ugur", 8 , 1, 0, 1 , 7 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);






UPDATE `player_stats` SET  `Assist_King` = 7
WHERE (`player_name` = "Marco Asensio" AND `drafter_name` = "Ugur" AND `video_id` = 8);

UPDATE `player_stats` SET  `EU_Assist_King` = 20, `Best_Performance` = 42,  `3RB_Assist_King` = 10
WHERE (`player_name` = "Karim Benzema" AND `drafter_name` = "Ugur" AND `video_id` = 8);

UPDATE `player_stats` SET  `EU_CS_King` = 20
WHERE (`player_name` = "Gregor Kobel" AND `drafter_name` = "Ugur" AND `video_id` = 8);


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) 
VALUES ("Thibaut Courtois", "Onur", 8 , 0, 1, 15 , 55 , League_Goal , League_Assist ,9 , EU_Goal , EU_Assist , 5, TRUE);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) 
VALUES ("Ederson", "Onur", 8 , 0, 0, 0 , 2 , default , default ,default , default , default , default, TRUE);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Harry Kane", "Onur", 8 , 38, 10, 19 , 57 , 27 , League_Assist , 6 , 3 , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Kevin de Bruyne", "Onur", 8 , 16, 14, 14 , 54 , League_Goal , 8 , EU_Goal , 6 , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Frenkie De Jong", "Onur", 8 , 3, 11, 9 , 40 , League_Goal , 6 , EU_Goal , 4 , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Neymar", "Onur", 8 , 31, 7, 14 , 57 , League_Goal , League_Assist , 9 , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Welington Dano", "Onur", 8 , 1, 1, 0 , 23 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Alphonso Davies", "Onur", 8 , 4, 2, 16 , 47 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Kalidou Koulibaly", "Onur", 8 , 1, 0, 3 , 30 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Aymeric Laporte", "Onur", 8 , 0, 0, 8 , 40 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Josue Chiamulera", "Onur", 8 , 0, 0, 9 , 36 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Kyle Walker-Peters", "Onur", 8 , 0, 1, 5 , 22 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Sergej Milinkovic-Savic", "Onur", 8 , 5, 5, 7 , 37 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Giovanni Di Lorenzo", "Onur", 8 , 3, 2, 9 , 44 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Talisca", "Onur", 8 , 3, 2, 3 , 40 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Ronald Araujo", "Onur", 8 , 2, 1, 12 , 44 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Jude Bellingham", "Onur", 8 , 7, 2, 15 , 54 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);


UPDATE `player_stats` SET  `CS_King` = 5 ,  `3RB_CS_King` = 10
WHERE (`player_name` = "Thibaut Courtois" AND `drafter_name` = "Onur" AND `video_id` = 8);

UPDATE `player_stats` SET  `EU_Assist_King` = 40, `3RB_Assist_King` = 10
WHERE (`player_name` = "Kevin de Bruyne" AND `drafter_name` = "Onur" AND `video_id` = 8);

UPDATE `player_stats` SET  `Best_Performance` = 48, `3RB_Goal_King` = 25, `Best_Best_Performance` = 25
WHERE (`player_name` = "Harry Kane" AND `drafter_name` = "Onur" AND `video_id` = 8);

UPDATE `player_stats` SET  `EU_Goal_King` = 40
WHERE (`player_name` = "Neymar" AND `drafter_name` = "Onur" AND `video_id` = 8);


-- 9. video


INSERT IGNORE INTO `teams` VALUES ('Frosinone', 'Serie A');
INSERT IGNORE INTO `teams` VALUES ('Fiorentina', 'Serie A');
INSERT IGNORE INTO `teams` VALUES ('Genoa', 'Serie A');
INSERT IGNORE INTO `teams` VALUES ('St. Louis CITY SC', 'MLS');
INSERT IGNORE INTO `teams` VALUES ('1.FC Union Berlin', 'BundesLeaguea');
INSERT IGNORE INTO `teams` VALUES ('Eintracht Frankfurt', 'BundesLeaguea');
INSERT IGNORE INTO `teams` VALUES ('Mainz', 'BundesLeaguea');
INSERT IGNORE INTO `teams` VALUES ('Marsilya', 'League 1');
INSERT IGNORE INTO `teams` VALUES ('Al-Shabab', 'Sudi Pro League');

INSERT IGNORE INTO `players` VALUES ('Matias Soule', "Frosinone", "ST");
INSERT IGNORE INTO `players` VALUES ('Arthur Melo', "Fiorentina", "MF");
INSERT IGNORE INTO `players` VALUES ('Roman Bürki', "St. Louis CITY SC", "GK");
INSERT IGNORE INTO `players` VALUES ('Ramy Bensebaini', "Dortmund", "STP");
INSERT IGNORE INTO `players` VALUES ('Luca Pellegrini', "Lazio", "LB");
INSERT IGNORE INTO `players` VALUES ('Enzo Chissano', "Palmeiras", "STP");
INSERT IGNORE INTO `players` VALUES ('Koni De Winter', "Genoa", "STP");
INSERT IGNORE INTO `players` VALUES ('Pedro Gonçalves', "Sporting CP", "MF");
INSERT IGNORE INTO `players` VALUES ('Robin Gosens', "1.FC Union Berlin", "LB");
INSERT IGNORE INTO `players` VALUES ('Ellyes Skhiri', "Eintracht Frankfurt", "MF");
INSERT IGNORE INTO `players` VALUES ('Arijanet Muric', "Burnley", "GK");
INSERT IGNORE INTO `players` VALUES ('Silvan Widmer', "Mainz", "RB");
INSERT IGNORE INTO `players` VALUES ('Joaquin Correa', "Marsilya", "ST");
INSERT IGNORE INTO `players` VALUES ('Josue Chiamulera', "Athletico Paranaense", "MF");
INSERT IGNORE INTO `players` VALUES ('Yannick Carrasco', "Al-Shabab", "LW");
INSERT IGNORE INTO `players` VALUES ('Ersin Destanoğlu', "Beşiktaş", "GK");


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) 
VALUES ("Unai Simon", "Ugur", 9 , 0, 0, 14 , 54 , 0 , 0 ,10 , 0 , 0 , 2, TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) 
VALUES ("Roman Bürki", "Ugur", 9 , 0, 0, 2 , 3 , 0 , 0 ,3 , 0 , 0 , 0, TRUE);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Harry Kane", "Ugur", 9 , 39, 15, 15 , 56 , 26 , 13 , 12 , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Kevin De Bruyne", "Ugur", 9 , 31, 14, 15 , 57 , 24 , 11 , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Neymar", "Ugur", 9 , 14, 10, 12 , 50 , 13 , 8 , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Antoine Griezmann", "Ugur", 9 , 19, 2, 14 , 55 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Casemiro", "Ugur", 9 , 7, 4, 15 , 57 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Moussa Diaby", "Ugur", 9 , 4, 5, 16 , 57 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Bruno Guimaraes", "Ugur", 9 , 4, 8, 12 , 53 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Arthur Melo", "Ugur", 9 , 4, 3, 5 , 24 , League_Goal , League_Assist , EU_Goal , EU_Assist , FALSE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Declan Rice", "Ugur", 9 , 3, 1, 14 , 55 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Pedro Gonçalves", "Ugur", 9 , 2, 2, 3 , 26 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Mikel Merino", "Ugur", 9 , 2, 3, 4 , 28 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Matias Soule", "Ugur", 9 , 2, 3, 5 , 25 , League_Goal , League_Assist , EU_Goal , EU_Assist , FALSE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Ramy Bensebaini", "Ugur", 9 , 2, 0, 1 , 27 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Luca Pellegrini", "Ugur", 9 , 0, 0, 2 , 18 , League_Goal , League_Assist , EU_Goal , EU_Assist , FALSE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Willi Orban", "Ugur", 9 , 2, 0, 1 , 28 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Eder Militao", "Ugur", 9 , 1, 0, 15 , 57 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Enzo Chissano", "Ugur", 9 , 1, 0, 0 , 9 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Koni De Winter", "Ugur", 9 , 0, 0, 2 , 11 , League_Goal , League_Assist , EU_Goal , EU_Assist , FALSE);




UPDATE `player_stats` SET  `Goal_King` = 15 , `Assist_King` = 10, `Best_Performance` = 54, `3RB_Goal_King` = 10,  `3RB_Assist_King` = 25
WHERE (`player_name` = "Harry Kane" AND `drafter_name` = "Ugur" AND `video_id` = 9);
UPDATE `player_stats` SET  `Goal_King` = 15 
WHERE (`player_name` = "Kevin De Bruyne" AND `drafter_name` = "Ugur" AND `video_id` = 9);

UPDATE `player_stats` SET   `3RB_CS_King` = 10
WHERE (`player_name` = "Unai Simon" AND `drafter_name` = "Ugur" AND `video_id` = 9);



INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) 
VALUES ("Gregor Kobel", "Arden", 9 , 0, 0, 15 , 52 , League_Goal , League_Assist ,10 , EU_Goal , EU_Assist , 2, TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) 
VALUES ("Arijanet Muric", "Arden", 9 , 0, 0, 0 , 3 , League_Goal , League_Assist ,League_CS , EU_Goal , EU_Assist , EU_CS, TRUE);

INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Kylian Mbappe", "Arden", 9 , 43, 14, 15 , 55 , 33 , 9 , 6 , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Lionel Messi", "Arden", 9 , 8, 5, 5 , 43 , League_Goal , League_Assist , EU_Goal , 2 , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Ronaldo Cabrais", "Arden", 9 , 19, 8, 14 , 55 , League_Goal , 7 , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Joshua Kimmich", "Arden", 9 , 8, 7, 14 , 55 , League_Goal , 6 , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Alejandro Grimaldo", "Arden", 9 , 4, 12, 14 , 54 , League_Goal , 6 , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Silvan Widmer", "Arden", 9 , Total_Goal, Total_Assist, Total_CS , Total_Match , League_Goal , League_Assist , 4 , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Matias Soule", "Arden", 9 , 15, 6, 13 , 37 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Sergej Milinkovic-Savic", "Arden", 9 , 13, 5, 9 , 44 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Sergi Darder", "Arden", 9 , 6, 0, 7 , 23 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Eder Militao", "Arden", 9 , 5, 0, 14 , 55 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Joaquin Correa", "Arden", 9 , 5, 2, 4 , 25 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Luca Pellegrini", "Arden", 9 , 0, 0, 2 , 14 , League_Goal , League_Assist , EU_Goal , EU_Assist , FALSE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Jules Kounde", "Arden", 9 , 1, 0, 10 , 41 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Roger Ibanez", "Arden", 9 , 0, 0, 6 , 26 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Virgil van Dijk", "Arden", 9 , 2, 0, 10 , 43 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Robin Gosens", "Arden", 9 , 0, 0, 0 , 4 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Ellyes Skhiri", "Arden", 9 , 0, 0, 1 , 7 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);



UPDATE `player_stats` SET  `Goal_King` = 20, `Best_Performance` = 57, `3RB_Goal_King` = 25, `3RB_Assist_King` = 10, `Best_Best_Performance` = 25
WHERE (`player_name` = "Kylian Mbappe" AND `drafter_name` = "Arden" AND `video_id` = 9);

UPDATE `player_stats` SET  `EU_Assist_King` = 20
WHERE (`player_name` = "Alejandro Grimaldo" AND `drafter_name` = "Arden" AND `video_id` = 9);

UPDATE `player_stats` SET   `3RB_CS_King` = 25
WHERE (`player_name` = "Gregor Kobel" AND `drafter_name` = "Arden" AND `video_id` = 9);


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) 
VALUES ("Jan Oblak", "Onur", 9 , 0, 0, 13 , 55 , League_Goal , League_Assist ,10 , EU_Goal , EU_Assist , 2, TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`League_CS`,`EU_Goal`,`EU_Assist`,`EU_CS`,`selected?`) 
VALUES ("Ersin Destanoğlu", "Onur", 9 , 0, 0, 0 , 0 , League_Goal , League_Assist ,League_CS , EU_Goal , EU_Assist , EU_CS, TRUE);


INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Harry Kane", "Onur", 9 , 34, 8, 14 , 55 , 6 , League_Assist , EU_Goal , 2 , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Neymar", "Onur", 9 , 13, 8,  12, 52 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("İlkay Gündoğan", "Onur", 9 , 4, 4, 5 , 36 , League_Goal , League_Assist , EU_Goal , 2 , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Heung-min Son", "Onur", 9 , 24, 13, 13 , 55 , League_Goal , League_Assist , 6 , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Casemiro", "Onur", 9 , 4, 0, 13 , 54 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Aymeric Laporte", "Onur", 9 , 1, 0, 4 , 39 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("David Garcia", "Onur", 9 , 0, 0, 4 , 26 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Josue Chiamulera", "Onur", 9 , 0, 0, 6 , 36 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Ruben Dias", "Onur", 9 , 3, 0, 11 , 54 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Rodrygo", "Onur", 9 , 15, 5, 14 , 55 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Yannick Carrasco", "Onur", 9 , 7, 2, 1 , 29 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Matias Soule", "Onur", 9 , 8, 6, 7 , 37 , League_Goal , League_Assist , EU_Goal , EU_Assist , FALSE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Luca Pellegrini", "Onur", 9 , 0, 0, 6 , 24 , League_Goal , League_Assist , EU_Goal , EU_Assist , FALSE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Koni De Winter", "Onur", 9 , 0, 0, 1 , 17 , League_Goal , League_Assist , EU_Goal , EU_Assist , FALSE);
INSERT INTO `player_stats` (`player_name`, `drafter_name`, `video_id`, `Total_Goal`,`Total_Assist`,`Total_CS`,`Total_Match`,`League_Goal`,`League_Assist`,`EU_Goal`,`EU_Assist`,`selected?`) 
VALUES ("Bruno Guimaraes", "Onur", 9 , 4, 6, 14 , 51 , League_Goal , League_Assist , EU_Goal , EU_Assist , TRUE);

UPDATE `player_stats` SET  `Assist_King` = 20 
WHERE (`player_name` = "Heung-min Son" AND `drafter_name` = "Onur" AND `video_id` = 9);

UPDATE `player_stats` SET  `Best_Performance` = 43 
WHERE (`player_name` = "Harry Kane" AND `drafter_name` = "Onur" AND `video_id` = 9);



ALTER TABLE `players`
ADD COLUMN `photo` VARCHAR(255) DEFAULT "https://t4.ftcdn.net/jpg/02/08/98/05/360_F_208980504_njS12KTuZLQ3wQZaHLbKpSLFNu9rF6Hs.jpg";

-- Step 1: Add the 'team' column
ALTER TABLE `player_stats`
ADD COLUMN `team` VARCHAR(100);

-- Step 2: Update the 'team' column from the 'players' table
UPDATE `player_stats` ps
JOIN `players` p ON ps.player_name = p.name
SET ps.team = p.team;

-- Step 3: Drop the current primary key
ALTER TABLE `player_stats`
DROP PRIMARY KEY;

-- Step 4: Add the new composite primary key
ALTER TABLE `player_stats`
ADD PRIMARY KEY (`player_name`, `team`, `video_id`, `drafter_name`);

