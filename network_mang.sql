-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (arm64)
--
-- Host: localhost    Database: network_mang
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_arm` tinyint(1) DEFAULT '0',
  `is_wfm` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1075 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (538,4,'Purba Champaran',0,1),(539,4,'Gaya',0,1),(540,4,'Gopalganj',0,1),(541,4,'Jamui',0,1),(542,4,'Jehanabad',0,1),(543,4,'Khagaria',0,1),(544,4,'Kishanganj',0,1),(545,4,'Kaimur',0,1),(546,4,'Katihar',0,1),(547,4,'Lakhisarai',0,1),(548,4,'Madhubani',0,1),(549,4,'Munger',0,1),(550,4,'Madhepura',0,1),(551,4,'Muzaffarpur',0,1),(552,4,'Nalanda',0,1),(553,4,'Nawada',0,1),(554,4,'Patna',0,1),(555,4,'Purnia',0,1),(556,4,'Rohtas',0,1),(557,4,'Saharsa',0,1),(558,4,'Samastipur',0,1),(559,4,'Sheohar',0,1),(560,4,'Sheikhpura',0,1),(561,4,'Saran',0,1),(562,4,'Sitamarhi',0,1),(563,4,'Supaul',0,1),(564,4,'Siwan',0,1),(565,4,'Vaishali',0,1),(566,4,'Pashchim Champaran',0,1),(567,35,'Bastar',0,1),(568,35,'Bilaspur',0,1),(569,35,'Dantewada',0,1),(570,35,'Dhamtari',0,1),(571,35,'Durg',0,1),(572,35,'Jashpur',0,1),(573,35,'Janjgir-Champa',0,1),(574,35,'Korba',0,1),(575,35,'Koriya',0,1),(576,35,'Kanker',0,1),(577,35,'Kawardha',0,1),(578,35,'Mahasamund',0,1),(579,35,'Raigarh',0,1),(580,35,'Rajnandgaon',0,1),(581,35,'Raipur',0,1),(582,35,'Surguja',0,1),(583,29,'Diu',0,1),(584,29,'Daman',0,1),(585,25,'Central Delhi',0,1),(586,25,'East Delhi',0,1),(587,25,'New Delhi',0,1),(588,25,'North Delhi',0,1),(589,25,'North East Delhi',0,1),(590,25,'North West Delhi',0,1),(591,25,'South Delhi',0,1),(592,25,'South West Delhi',0,1),(593,25,'West Delhi',0,1),(594,26,'North Goa',0,1),(595,26,'South Goa',0,1),(596,5,'Ahmedabad',0,1),(597,5,'Amreli District',0,1),(598,5,'Anand',0,1),(599,5,'Banaskantha',0,1),(600,5,'Bharuch',0,1),(601,5,'Bhavnagar',0,1),(602,5,'Dahod',0,1),(603,5,'The Dangs',0,1),(604,5,'Gandhinagar',0,1),(605,5,'Jamnagar',0,1),(606,5,'Junagadh',0,1),(607,5,'Kutch',0,1),(608,5,'Kheda',0,1),(609,5,'Mehsana',0,1),(610,5,'Narmada',0,1),(611,5,'Navsari',0,1),(612,5,'Patan',0,1),(613,5,'Panchmahal',0,1),(614,5,'Porbandar',0,1),(615,5,'Rajkot',0,1),(616,5,'Sabarkantha',0,1),(617,5,'Surendranagar',0,1),(618,5,'Surat',0,1),(619,5,'Vadodara',0,1),(620,5,'Valsad',0,1),(621,6,'Ambala',0,1),(622,6,'Bhiwani',0,1),(623,6,'Faridabad',0,1),(624,6,'Fatehabad',0,1),(625,6,'Gurgaon',0,1),(626,6,'Hissar',0,1),(627,6,'Jhajjar',0,1),(628,6,'Jind',0,1),(629,6,'Karnal',0,1),(630,6,'Kaithal',0,1),(631,6,'Kurukshetra',0,1),(632,6,'Mahendragarh',0,1),(633,6,'Mewat',0,1),(634,6,'Panchkula',0,1),(635,6,'Panipat',0,1),(636,6,'Rewari',0,1),(637,6,'Rohtak',0,1),(638,6,'Sirsa',0,1),(639,6,'Sonepat',0,1),(640,6,'Yamuna Nagar',0,1),(641,6,'Palwal',0,1),(642,7,'Bilaspur',0,1),(643,7,'Chamba',0,1),(644,7,'Hamirpur',0,1),(645,7,'Kangra',0,1),(646,7,'Kinnaur',0,1),(647,7,'Kulu',0,1),(648,7,'Lahaul and Spiti',0,1),(649,7,'Mandi',0,1),(650,7,'Shimla',0,1),(651,7,'Sirmaur',0,1),(652,7,'Solan',0,1),(653,7,'Una',0,1),(654,8,'Anantnag',0,1),(655,8,'Badgam',0,1),(656,8,'Bandipore',0,1),(657,8,'Baramula',0,1),(658,8,'Doda',0,1),(659,8,'Jammu',0,1),(660,8,'Kargil',0,1),(661,8,'Kathua',0,1),(662,8,'Kupwara',0,1),(663,8,'Leh',0,1),(664,8,'Poonch',0,1),(665,8,'Pulwama',0,1),(666,8,'Rajauri',0,1),(667,8,'Srinagar',0,1),(668,8,'Samba',0,1),(669,8,'Udhampur',0,1),(670,34,'Bokaro',0,1),(671,34,'Chatra',0,1),(672,34,'Deoghar',0,1),(673,34,'Dhanbad',0,1),(674,34,'Dumka',0,1),(675,34,'Purba Singhbhum',0,1),(676,34,'Garhwa',0,1),(677,34,'Giridih',0,1),(678,34,'Godda',0,1),(679,34,'Gumla',0,1),(680,34,'Hazaribagh',0,1),(681,34,'Koderma',0,1),(682,34,'Lohardaga',0,1),(683,34,'Pakur',0,1),(684,34,'Palamu',0,1),(685,34,'Ranchi',0,1),(686,34,'Sahibganj',0,1),(687,34,'Seraikela and Kharsawan',0,1),(688,34,'Pashchim Singhbhum',0,1),(689,34,'Ramgarh',0,1),(690,9,'Bidar',0,1),(691,9,'Belgaum',0,1),(692,9,'Bijapur',0,1),(693,9,'Bagalkot',0,1),(694,9,'Bellary',0,1),(695,9,'Bangalore Rural District',0,1),(696,9,'Bangalore Urban District',0,1),(697,9,'Chamarajnagar',0,1),(698,9,'Chikmagalur',0,1),(699,9,'Chitradurga',0,1),(700,9,'Davanagere',0,1),(701,9,'Dharwad',0,1),(702,9,'Dakshina Kannada',0,1),(703,9,'Gadag',0,1),(704,9,'Gulbarga',0,1),(705,9,'Hassan',0,1),(706,9,'Haveri District',0,1),(707,9,'Kodagu',0,1),(708,9,'Kolar',0,1),(709,9,'Koppal',0,1),(710,9,'Mandya',0,1),(711,9,'Mysore',0,1),(712,9,'Raichur',0,1),(713,9,'Shimoga',0,1),(714,9,'Tumkur',0,1),(715,9,'Udupi',0,1),(716,9,'Uttara Kannada',0,1),(717,9,'Ramanagara',0,1),(718,9,'Chikballapur',0,1),(719,9,'Yadagiri',0,1),(720,10,'Alappuzha',0,1),(721,10,'Ernakulam',0,1),(722,10,'Idukki',0,1),(723,10,'Kollam',0,1),(724,10,'Kannur',0,1),(725,10,'Kasaragod',0,1),(726,10,'Kottayam',0,1),(727,10,'Kozhikode',0,1),(728,10,'Malappuram',0,1),(729,10,'Palakkad',0,1),(730,10,'Pathanamthitta',0,1),(731,10,'Thrissur',0,1),(732,10,'Thiruvananthapuram',0,1),(733,10,'Wayanad',0,1),(734,11,'Alirajpur',0,1),(735,11,'Anuppur',0,1),(736,11,'Ashok Nagar',0,1),(737,11,'Balaghat',0,1),(738,11,'Barwani',0,1),(739,11,'Betul',0,1),(740,11,'Bhind',0,1),(741,11,'Bhopal',0,1),(742,11,'Burhanpur',0,1),(743,11,'Chhatarpur',0,1),(744,11,'Chhindwara',0,1),(745,11,'Damoh',0,1),(746,11,'Datia',0,1),(747,11,'Dewas',0,1),(748,11,'Dhar',0,1),(749,11,'Dindori',0,1),(750,11,'Guna',0,1),(751,11,'Gwalior',0,1),(752,11,'Harda',0,1),(753,11,'Hoshangabad',0,1),(754,11,'Indore',0,1),(755,11,'Jabalpur',0,1),(756,11,'Jhabua',0,1),(757,11,'Katni',0,1),(758,11,'Khandwa',0,1),(759,11,'Khargone',0,1),(760,11,'Mandla',0,1),(761,11,'Mandsaur',0,1),(762,11,'Morena',0,1),(763,11,'Narsinghpur',0,1),(764,11,'Neemuch',0,1),(765,11,'Panna',0,1),(766,11,'Rewa',0,1),(767,11,'Rajgarh',0,1),(768,11,'Ratlam',0,1),(769,11,'Raisen',0,1),(770,11,'Sagar',0,1),(771,11,'Satna',0,1),(772,11,'Sehore',0,1),(773,11,'Seoni',0,1),(774,11,'Shahdol',0,1),(775,11,'Shajapur',0,1),(776,11,'Sheopur',0,1),(777,11,'Shivpuri',0,1),(778,11,'Sidhi',0,1),(779,11,'Singrauli',0,1),(780,11,'Tikamgarh',0,1),(781,11,'Ujjain',0,1),(782,11,'Umaria',0,1),(783,11,'Vidisha',0,1),(784,12,'Ahmednagar',0,1),(785,12,'Akola',0,1),(786,12,'Amrawati',0,1),(787,12,'Aurangabad',0,1),(788,12,'Bhandara',0,1),(789,12,'Beed',0,1),(790,12,'Buldhana',0,1),(791,12,'Chandrapur',0,1),(792,12,'Dhule',0,1),(793,12,'Gadchiroli',0,1),(794,12,'Gondiya',0,1),(795,12,'Hingoli',0,1),(796,12,'Jalgaon',0,1),(797,12,'Jalna',0,1),(798,12,'Kolhapur',0,1),(799,12,'Latur',0,1),(800,12,'Mumbai City',0,1),(801,12,'Mumbai suburban',0,1),(802,12,'Nandurbar',0,1),(803,12,'Nanded',0,1),(804,12,'Nagpur',0,1),(805,12,'Nashik',0,1),(806,12,'Osmanabad',0,1),(807,12,'Parbhani',0,1),(808,12,'Pune',0,1),(809,12,'Raigad',0,1),(810,12,'Ratnagiri',0,1),(811,12,'Sindhudurg',0,1),(812,12,'Sangli',0,1),(813,12,'Solapur',0,1),(814,12,'Satara',0,1),(815,12,'Thane',0,1),(816,12,'Wardha',0,1),(817,12,'Washim',0,1),(818,12,'Yavatmal',0,1),(819,13,'Bishnupur',0,1),(820,13,'Churachandpur',0,1),(821,13,'Chandel',0,1),(822,13,'Imphal East',0,1),(823,13,'Senapati',0,1),(824,13,'Tamenglong',0,1),(825,13,'Thoubal',0,1),(826,13,'Ukhrul',0,1),(827,13,'Imphal West',0,1),(828,14,'East Garo Hills',0,1),(829,14,'East Khasi Hills',0,1),(830,14,'Jaintia Hills',0,1),(831,14,'Ri-Bhoi',0,1),(832,14,'South Garo Hills',0,1),(833,14,'West Garo Hills',0,1),(834,14,'West Khasi Hills',0,1),(835,15,'Aizawl',0,1),(836,15,'Champhai',0,1),(837,15,'Kolasib',0,1),(838,15,'Lawngtlai',0,1),(839,15,'Lunglei',0,1),(840,15,'Mamit',0,1),(841,15,'Saiha',0,1),(842,15,'Serchhip',0,1),(843,16,'Dimapur',0,1),(844,16,'Kohima',0,1),(845,16,'Mokokchung',0,1),(846,16,'Mon',0,1),(847,16,'Phek',0,1),(848,16,'Tuensang',0,1),(849,16,'Wokha',0,1),(850,16,'Zunheboto',0,1),(851,17,'Angul',0,1),(852,17,'Boudh',0,1),(853,17,'Bhadrak',0,1),(854,17,'Bolangir',0,1),(855,17,'Bargarh',0,1),(856,17,'Baleswar',0,1),(857,17,'Cuttack',0,1),(858,17,'Debagarh',0,1),(859,17,'Dhenkanal',0,1),(860,17,'Ganjam',0,1),(861,17,'Gajapati',0,1),(862,17,'Jharsuguda',0,1),(863,17,'Jajapur',0,1),(864,17,'Jagatsinghpur',0,1),(865,17,'Khordha',0,1),(866,17,'Kendujhar',0,1),(867,17,'Kalahandi',0,1),(868,17,'Kandhamal',0,1),(869,17,'Koraput',0,1),(870,17,'Kendrapara',0,1),(871,17,'Malkangiri',0,1),(872,17,'Mayurbhanj',0,1),(873,17,'Nabarangpur',0,1),(874,17,'Nuapada',0,1),(875,17,'Nayagarh',0,1),(876,17,'Puri',0,1),(877,17,'Rayagada',0,1),(878,17,'Sambalpur',0,1),(879,17,'Subarnapur',0,1),(880,17,'Sundargarh',0,1),(881,27,'Karaikal',0,1),(882,27,'Mahe',0,1),(883,27,'Puducherry',0,1),(884,27,'Yanam',0,1),(885,18,'Amritsar',0,1),(886,18,'Bathinda',0,1),(887,18,'Firozpur',0,1),(888,18,'Faridkot',0,1),(889,18,'Fatehgarh Sahib',0,1),(890,18,'Gurdaspur',0,1),(891,18,'Hoshiarpur',0,1),(892,18,'Jalandhar',0,1),(893,18,'Kapurthala',0,1),(894,18,'Ludhiana',0,1),(895,18,'Mansa',0,1),(896,18,'Moga',0,1),(897,18,'Mukatsar',0,1),(898,18,'Nawan Shehar',0,1),(899,18,'Patiala',0,1),(900,18,'Rupnagar',0,1),(901,18,'Sangrur',0,1),(902,19,'Ajmer',0,1),(903,19,'Alwar',0,1),(904,19,'Bikaner',0,1),(905,19,'Barmer',0,1),(906,19,'Banswara',0,1),(907,19,'Bharatpur',0,1),(908,19,'Baran',0,1),(909,19,'Bundi',0,1),(910,19,'Bhilwara',0,1),(911,19,'Churu',0,1),(912,19,'Chittorgarh',0,1),(913,19,'Dausa',0,1),(914,19,'Dholpur',0,1),(915,19,'Dungapur',0,1),(916,19,'Ganganagar',0,1),(917,19,'Hanumangarh',0,1),(918,19,'Juhnjhunun',0,1),(919,19,'Jalore',0,1),(920,19,'Jodhpur',0,1),(921,19,'Jaipur',0,1),(922,19,'Jaisalmer',0,1),(923,19,'Jhalawar',0,1),(924,19,'Karauli',0,1),(925,19,'Kota',0,1),(926,19,'Nagaur',0,1),(927,19,'Pali',0,1),(928,19,'Pratapgarh',0,1),(929,19,'Rajsamand',0,1),(930,19,'Sikar',0,1),(931,19,'Sawai Madhopur',0,1),(932,19,'Sirohi',0,1),(933,19,'Tonk',0,1),(934,19,'Udaipur',0,1),(935,20,'East Sikkim',0,1),(936,20,'North Sikkim',0,1),(937,20,'South Sikkim',0,1),(938,20,'West Sikkim',0,1),(939,21,'Ariyalur',0,1),(940,21,'Chennai',0,1),(941,21,'Coimbatore',0,1),(942,21,'Cuddalore',0,1),(943,21,'Dharmapuri',0,1),(944,21,'Dindigul',0,1),(945,21,'Erode',0,1),(946,21,'Kanchipuram',0,1),(947,21,'Kanyakumari',0,1),(948,21,'Karur',0,1),(949,21,'Madurai',0,1),(950,21,'Nagapattinam',0,1),(951,21,'The Nilgiris',0,1),(952,21,'Namakkal',0,1),(953,21,'Perambalur',0,1),(954,21,'Pudukkottai',0,1),(955,21,'Ramanathapuram',0,1),(956,21,'Salem',0,1),(957,21,'Sivagangai',0,1),(958,21,'Tiruppur',0,1),(959,21,'Tiruchirappalli',0,1),(960,21,'Theni',0,1),(961,21,'Tirunelveli',0,1),(962,21,'Thanjavur',0,1),(963,21,'Thoothukudi',0,1),(964,21,'Thiruvallur',0,1),(965,21,'Thiruvarur',0,1),(966,21,'Tiruvannamalai',0,1),(967,21,'Vellore',0,1),(968,21,'Villupuram',0,1),(969,22,'Dhalai',0,1),(970,22,'North Tripura',0,1),(971,22,'South Tripura',0,1),(972,22,'West Tripura',0,1),(973,33,'Almora',0,1),(974,33,'Bageshwar',0,1),(975,33,'Chamoli',0,1),(976,33,'Champawat',0,1),(977,33,'Dehradun',0,1),(978,33,'Haridwar',0,1),(979,33,'Nainital',0,1),(980,33,'Pauri Garhwal',0,1),(981,33,'Pithoragharh',0,1),(982,33,'Rudraprayag',0,1),(983,33,'Tehri Garhwal',0,1),(984,33,'Udham Singh Nagar',0,1),(985,33,'Uttarkashi',0,1),(986,23,'Agra',0,1),(987,23,'Allahabad',0,1),(988,23,'Aligarh',0,1),(989,23,'Ambedkar Nagar',0,1),(990,23,'Auraiya',0,1),(991,23,'Azamgarh',0,1),(992,23,'Barabanki',0,1),(993,23,'Badaun',0,1),(994,23,'Bagpat',0,1),(995,23,'Bahraich',0,1),(996,23,'Bijnor',0,1),(997,23,'Ballia',0,1),(998,23,'Banda',0,1),(999,23,'Balrampur',0,1),(1000,23,'Bareilly',0,1),(1001,23,'Basti',0,1),(1002,23,'Bulandshahr',0,1),(1003,23,'Chandauli',0,1),(1004,23,'Chitrakoot',0,1),(1005,23,'Deoria',0,1),(1006,23,'Etah',0,1),(1007,23,'Kanshiram Nagar',0,1),(1008,23,'Etawah',0,1),(1009,23,'Firozabad',0,1),(1010,23,'Farrukhabad',0,1),(1011,23,'Fatehpur',0,1),(1012,23,'Faizabad',0,1),(1013,23,'Gautam Buddha Nagar',0,1),(1014,23,'Gonda',0,1),(1015,23,'Ghazipur',0,1),(1016,23,'Gorkakhpur',0,1),(1017,23,'Ghaziabad',0,1),(1018,23,'Hamirpur',0,1),(1019,23,'Hardoi',0,1),(1020,23,'Mahamaya Nagar',0,1),(1021,23,'Jhansi',0,1),(1022,23,'Jalaun',0,1),(1023,23,'Jyotiba Phule Nagar',0,1),(1024,23,'Jaunpur District',0,1),(1025,23,'Kanpur Dehat',0,1),(1026,23,'Kannauj',0,1),(1027,23,'Kanpur Nagar',0,1),(1028,23,'Kaushambi',0,1),(1029,23,'Kushinagar',0,1),(1030,23,'Lalitpur',0,1),(1031,23,'Lakhimpur Kheri',0,1),(1032,23,'Lucknow',0,1),(1033,23,'Mau',0,1),(1034,23,'Meerut',0,1),(1035,23,'Maharajganj',0,1),(1036,23,'Mahoba',0,1),(1037,23,'Mirzapur',0,1),(1038,23,'Moradabad',0,1),(1039,23,'Mainpuri',0,1),(1040,23,'Mathura',0,1),(1041,23,'Muzaffarnagar',0,1),(1042,23,'Pilibhit',0,1),(1043,23,'Pratapgarh',0,1),(1044,23,'Rampur',0,1),(1045,23,'Rae Bareli',0,1),(1046,23,'Saharanpur',0,1),(1047,23,'Sitapur',0,1),(1048,23,'Shahjahanpur',0,1),(1049,23,'Sant Kabir Nagar',0,1),(1050,23,'Siddharthnagar',0,1),(1051,23,'Sonbhadra',0,1),(1052,23,'Sant Ravidas Nagar',0,1),(1053,23,'Sultanpur',0,1),(1054,23,'Shravasti',0,1),(1055,23,'Unnao',0,1),(1056,23,'Varanasi',0,1),(1057,24,'Birbhum',0,1),(1058,24,'Bankura',0,1),(1059,24,'Bardhaman',0,1),(1060,24,'Darjeeling',0,1),(1061,24,'Dakshin Dinajpur',0,1),(1062,24,'Hooghly',0,1),(1063,24,'Howrah',0,1),(1064,24,'Jalpaiguri',0,1),(1065,24,'Cooch Behar',0,1),(1066,24,'Kolkata',0,1),(1067,24,'Malda',0,1),(1068,24,'Midnapore',0,1),(1069,24,'Murshidabad',0,1),(1070,24,'Nadia',0,1),(1071,24,'North 24 Parganas',0,1),(1072,24,'South 24 Parganas',0,1),(1073,24,'Purulia',0,1),(1074,24,'Uttar Dinajpur',0,1);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `country_code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_code` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (105,'India','IN');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sim_plans`
--

DROP TABLE IF EXISTS `sim_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sim_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider_id` int NOT NULL,
  `plan_name` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `validity` varchar(50) DEFAULT NULL,
  `data_per_day` varchar(50) DEFAULT NULL,
  `voice_call` varchar(50) DEFAULT NULL,
  `sms_per_day` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `sim_plans_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `sim_providers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sim_plans`
--

LOCK TABLES `sim_plans` WRITE;
/*!40000 ALTER TABLE `sim_plans` DISABLE KEYS */;
INSERT INTO `sim_plans` VALUES (1,1,'Jio ₹149 Plan',149.00,'20 Days','1GB/day','Unlimited','100/day'),(2,1,'Jio ₹209 Plan',209.00,'28 Days','1GB/day','Unlimited','100/day'),(3,1,'Jio ₹239 Plan',239.00,'28 Days','1.5GB/day','Unlimited','100/day'),(4,1,'Jio ₹299 Plan',299.00,'28 Days','2GB/day','Unlimited','100/day'),(5,1,'Jio ₹479 Plan',479.00,'56 Days','1.5GB/day','Unlimited','100/day'),(6,1,'Jio ₹666 Plan',666.00,'84 Days','1.5GB/day','Unlimited','100/day'),(7,1,'Jio ₹719 Plan',719.00,'84 Days','2GB/day','Unlimited','100/day'),(8,1,'Jio ₹999 Plan',999.00,'84 Days','3GB/day','Unlimited','100/day'),(9,1,'Jio ₹2999 Plan',2999.00,'365 Days','2.5GB/day','Unlimited','100/day'),(10,1,'Jio ₹401 Plan (Disney+ Hotstar)',401.00,'28 Days','3GB/day','Unlimited','100/day'),(11,2,'Airtel ₹155 Plan',155.00,'24 Days','1GB total','Unlimited','300 total'),(12,2,'Airtel ₹239 Plan',239.00,'24 Days','1GB/day','Unlimited','100/day'),(13,2,'Airtel ₹299 Plan',299.00,'28 Days','1.5GB/day','Unlimited','100/day'),(14,2,'Airtel ₹359 Plan',359.00,'28 Days','2GB/day','Unlimited','100/day'),(15,2,'Airtel ₹549 Plan',549.00,'56 Days','1.5GB/day','Unlimited','100/day'),(16,2,'Airtel ₹719 Plan',719.00,'84 Days','1.5GB/day','Unlimited','100/day'),(17,2,'Airtel ₹839 Plan',839.00,'84 Days','2GB/day','Unlimited','100/day'),(18,2,'Airtel ₹999 Plan',999.00,'84 Days','3GB/day','Unlimited','100/day'),(19,2,'Airtel ₹2999 Plan',2999.00,'365 Days','2.5GB/day','Unlimited','100/day'),(20,2,'Airtel ₹455 Plan',455.00,'84 Days','6GB total','Unlimited','900 total'),(21,3,'Vi ₹155 Plan',155.00,'24 Days','1GB total','Unlimited','300 total'),(22,3,'Vi ₹199 Plan',199.00,'28 Days','1GB/day','Unlimited','100/day'),(23,3,'Vi ₹239 Plan',239.00,'28 Days','1.5GB/day','Unlimited','100/day'),(24,3,'Vi ₹299 Plan',299.00,'28 Days','2GB/day','Unlimited','100/day'),(25,3,'Vi ₹479 Plan',479.00,'56 Days','1.5GB/day','Unlimited','100/day'),(26,3,'Vi ₹599 Plan',599.00,'70 Days','1.5GB/day','Unlimited','100/day'),(27,3,'Vi ₹699 Plan',699.00,'84 Days','2GB/day','Unlimited','100/day'),(28,3,'Vi ₹901 Plan',901.00,'84 Days','3GB/day + OTT','Unlimited','100/day'),(29,3,'Vi ₹2899 Plan',2899.00,'365 Days','1.5GB/day','Unlimited','100/day'),(30,3,'Vi ₹3199 Plan',3199.00,'365 Days','2GB/day','Unlimited','100/day'),(31,4,'BSNL ₹107 Plan',107.00,'24 Days','200MB total','Unlimited','100/day'),(32,4,'BSNL ₹187 Plan',187.00,'28 Days','2GB/day','Unlimited','100/day'),(33,4,'BSNL ₹197 Plan',197.00,'28 Days','2GB/day','Unlimited','100/day'),(34,4,'BSNL ₹247 Plan',247.00,'30 Days','3GB/day','Unlimited','100/day'),(35,4,'BSNL ₹298 Plan',298.00,'56 Days','1GB/day','Unlimited','100/day'),(36,4,'BSNL ₹429 Plan',429.00,'81 Days','1GB/day','Unlimited','100/day'),(37,4,'BSNL ₹485 Plan',485.00,'90 Days','1.5GB/day','Unlimited','100/day'),(38,4,'BSNL ₹666 Plan',666.00,'134 Days','1.5GB/day','Unlimited','100/day'),(39,4,'BSNL ₹997 Plan',997.00,'180 Days','3GB/day','Unlimited','100/day'),(40,4,'BSNL ₹1999 Plan',1999.00,'365 Days','2GB/day','Unlimited','100/day'),(41,5,'MTNL ₹98 Plan',98.00,'21 Days','1GB total','Unlimited','100/day'),(42,5,'MTNL ₹149 Plan',149.00,'20 Days','2GB total','Unlimited','100/day'),(43,5,'MTNL ₹209 Plan',209.00,'28 Days','1GB/day','Unlimited','100/day'),(44,5,'MTNL ₹249 Plan',249.00,'28 Days','1.5GB/day','Unlimited','100/day'),(45,5,'MTNL ₹319 Plan',319.00,'28 Days','2GB/day','Unlimited','100/day'),(46,5,'MTNL ₹429 Plan',429.00,'56 Days','1.5GB/day','Unlimited','100/day'),(47,5,'MTNL ₹499 Plan',499.00,'70 Days','1GB/day','Unlimited','100/day'),(48,5,'MTNL ₹666 Plan',666.00,'84 Days','1.5GB/day','Unlimited','100/day'),(49,5,'MTNL ₹999 Plan',999.00,'90 Days','3GB/day','Unlimited','100/day'),(50,5,'MTNL ₹1999 Plan',1999.00,'365 Days','2GB/day','Unlimited','100/day');
/*!40000 ALTER TABLE `sim_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sim_providers`
--

DROP TABLE IF EXISTS `sim_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sim_providers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sim_providers`
--

LOCK TABLES `sim_providers` WRITE;
/*!40000 ALTER TABLE `sim_providers` DISABLE KEYS */;
INSERT INTO `sim_providers` VALUES (2,'Airtel'),(4,'BSNL'),(1,'Jio'),(5,'MTNL'),(3,'Vodafone Idea (Vi)');
/*!40000 ALTER TABLE `sim_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `state_code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `state_code` (`state_code`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `states_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,105,'ANDHRA PRADESH','AP'),(2,105,'ASSAM','AS'),(3,105,'ARUNACHAL PRADESH','AR'),(4,105,'BIHAR','BR'),(5,105,'GUJARAT','GJ'),(6,105,'HARYANA','HR'),(7,105,'HIMACHAL PRADESH','HP'),(8,105,'JAMMU & KASHMIR','JK'),(9,105,'KARNATAKA','KA'),(10,105,'KERALA','KL'),(11,105,'MADHYA PRADESH','MP'),(12,105,'MAHARASHTRA','MH'),(13,105,'MANIPUR','MN'),(14,105,'MEGHALAYA','ML'),(15,105,'MIZORAM','MZ'),(16,105,'NAGALAND','NL'),(17,105,'ODISHA','OD'),(18,105,'PUNJAB','PB'),(19,105,'RAJASTHAN','RJ'),(20,105,'SIKKIM','SK'),(21,105,'TAMIL NADU','TN'),(22,105,'TRIPURA','TR'),(23,105,'UTTAR PRADESH','UP'),(24,105,'WEST BENGAL','WB'),(25,105,'DELHI','DL'),(26,105,'GOA','GA'),(27,105,'PUDUCHERRY','PY'),(28,105,'LAKSHADWEEP','LD'),(29,105,'DAMAN & DIU','DD'),(30,105,'DADRA & NAGAR HAVELI','DN'),(31,105,'CHANDIGARH','CH'),(32,105,'ANDAMAN & NICOBAR','AN'),(33,105,'UTTARAKHAND','UK'),(34,105,'JHARKHAND','JH'),(35,105,'CHHATTISGARH','CG');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-31 18:17:57
