-- MySQL dump 10.13  Distrib 8.0.44, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: veterynary_clinic
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Dumping data for table `APPOINTMENTS`
--

LOCK TABLES `APPOINTMENTS` WRITE;
/*!40000 ALTER TABLE `APPOINTMENTS` DISABLE KEYS */;
INSERT INTO `APPOINTMENTS` VALUES (6001,501,201,1001,'2025-11-17','10:00:00','Completed'),(6002,502,202,1003,'2025-11-17','11:00:00','Completed'),(6003,504,201,1005,'2025-11-18','14:30:00','Scheduled'),(6004,503,203,1004,'2025-11-18','10:30:00','Completed'),(6005,505,204,1001,'2025-11-19','09:00:00','Canceled'),(6006,507,202,1007,'2025-11-19','15:00:00','Completed'),(6007,509,204,1009,'2025-11-20','11:30:00','Completed'),(6008,510,203,1010,'2025-11-20','14:00:00','Completed'),(6009,506,201,1006,'2025-11-21','10:00:00','Scheduled'),(6010,511,205,1011,'2025-11-21','11:00:00','Completed'),(6011,512,206,1012,'2025-11-22','13:00:00','Completed'),(6012,513,207,1013,'2025-11-22','14:00:00','Scheduled'),(6013,514,209,1014,'2025-11-23','09:30:00','Completed'),(6014,515,210,1015,'2025-11-23','10:30:00','Scheduled'),(6015,501,201,1001,'2025-12-17','10:00:00','Scheduled'),(6900,5900,201,1001,'2025-12-19','09:00:00','Scheduled'),(6950,501,202,1002,'2025-12-19','14:00:00','Canceled'),(6999,501,201,1001,'2025-12-19','15:00:00','Scheduled');
/*!40000 ALTER TABLE `APPOINTMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `MEDICATIONS`
--

LOCK TABLES `MEDICATIONS` WRITE;
/*!40000 ALTER TABLE `MEDICATIONS` DISABLE KEYS */;
INSERT INTO `MEDICATIONS` VALUES (401,'Parasite Vaccine','Vaccine','For internal and external parasites',60,'2026-12-31'),(402,'Multi-Vitamin Syrup','Vitamin','Immune booster',119,'2026-06-15'),(403,'Antibiotic Powder','Antibiotic','Broad spectrum',80,'2025-11-01'),(404,'Painkiller Tablet','Analgesic','Post-operative pain relief',200,'2027-03-20'),(405,'Eye Drops','Ophthalmological','Treatment for conjunctivitis',75,'2025-08-10'),(406,'Dermatology Cream','Topical','Skin infection treatment',90,'2026-01-25'),(407,'Calmative Drops','Sedative','Anxiety reduction',60,'2025-09-01'),(408,'Joint Supplement','Supplement','Mobility support',110,'2027-11-10'),(409,'Flea/Tick Spray','External Parasite','Flea and tick prevention',70,'2026-05-05'),(410,'Kidney Support Diet','Special Diet','Renal function support',40,'2025-12-12'),(411,'Dental Chews','Dental Care','Tartar control',150,'2027-08-01'),(412,'Vaccine Rabies','Vaccine','Standard rabies shot',100,'2026-03-15');
/*!40000 ALTER TABLE `MEDICATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `OWNERS`
--

LOCK TABLES `OWNERS` WRITE;
/*!40000 ALTER TABLE `OWNERS` DISABLE KEYS */;
INSERT INTO `OWNERS` VALUES (1001,'Zehra','Ozcan','Istanbul','5301112233','zehra.ozcan@email.com'),(1002,'Lale','Uzun','Istanbul','5374445566','lale.uzun@email.com'),(1003,'Ali','Yilmaz','Istanbul','5338778899','ali.yilmaz@email.com'),(1004,'Berna','Kaya','Istanbul','5451234567','berna.kaya@email.com'),(1005,'Adem','Demir','Istanbul','5559877843','adem.demir@email.com'),(1006,'Derya','Sahin','Istanbul','5352312244','derya.sahin@email.com'),(1007,'Emre','Celik','Istanbul','5365545800','emre.celik@email.com'),(1008,'Funda','Gunes','Istanbul','5478471122','funda.gunes@email.com'),(1009,'Gokhan','Ates','Istanbul','5312585678','gokhan.ates@email.com'),(1010,'Hazal','Ersoy','Kocaeli','5468785432','hazal.ersoy@email.com'),(1011,'Ilker','Tas','Istanbul','5051239988','ilker.tas@email.com'),(1012,'Jale','Efe','Istanbul','5423337766','jale.efe@email.com'),(1013,'Kemal','Uysal','Istanbul','5538884422','kemal.uysal@email.com'),(1014,'Lale','Gunduz','Tekirdag','5416660011','lale.gunduz@email.com'),(1015,'Mert','Akin','Istanbul','5305001234','mert.aydin@email.com');
/*!40000 ALTER TABLE `OWNERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `PAYMENTS`
--

LOCK TABLES `PAYMENTS` WRITE;
/*!40000 ALTER TABLE `PAYMENTS` DISABLE KEYS */;
INSERT INTO `PAYMENTS` VALUES (9001,6001,150.00,'2025-11-17','Credit Card','Completed'),(9002,6002,220.50,'2025-11-17','Cash','Completed'),(9003,6004,95.00,'2025-11-18','EFT','Completed'),(9004,6006,80.00,'2025-11-19','Credit Card','Completed'),(9005,6007,130.00,'2025-11-20','Cash','Completed'),(9006,6008,70.00,'2025-11-20','Credit Card','Completed'),(9007,6010,90.00,'2025-11-21','Cash','Completed'),(9008,6011,140.00,'2025-11-22','Credit Card','Completed'),(9009,6013,75.00,'2025-11-23','Cash','Completed'),(9010,6003,110.00,'2025-11-18','Credit Card','Pending'),(9011,6009,50.00,'2025-11-21','Cash','Pending'),(9012,6012,100.00,'2025-11-22','Credit Card','Pending'),(9013,6014,60.00,'2025-11-23','EFT','Pending'),(9014,6005,0.00,'2025-11-19','Cancellation','Canceled'),(9015,6015,150.00,'2025-12-17','Credit Card','Pending'),(9950,6950,200.00,'2025-12-19','Cash','Refunded'),(9999,6999,180.00,'2025-12-19','Credit Card','Paid');
/*!40000 ALTER TABLE `PAYMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `PETS`
--

LOCK TABLES `PETS` WRITE;
/*!40000 ALTER TABLE `PETS` DISABLE KEYS */;
INSERT INTO `PETS` VALUES (501,'Mocha','Cat','British Shorthair',3,5.20,'Gray',1001),(502,'Alex','Dog','King Charles Cavalier',5,35.00,'Brown',1003),(503,'Luna','Cat','Siamese',2,4.00,'Cream',1004),(504,'Patates','Dog','Pug',8,9.50,'Brown',1005),(505,'Lahmacun','Cat','Tabby',1,3.50,'Black-White',1001),(506,'Pati','Rabbit','Holland Lop',2,2.00,'White',1006),(507,'Rex','Dog','German Shepherd',4,30.00,'Black',1007),(508,'Corap','Bird','Budgerigar',1,0.10,'Blue',1008),(509,'Fistik','Dog','Labrador',6,32.00,'Black',1009),(510,'Ceku','Cat','Angora Cat',7,5.00,'White',1010),(511,'Zeytin','Dog','Beagle',3,14.50,'Brown-White',1011),(512,'Cepsu','Cat','Scottish Fold',5,6.10,'Beige',1012),(513,'Bocek','Dog','Chihuahua',10,3.00,'Tan',1013),(514,'Hades','Snake','Corn Snake',2,0.50,'Red',1014),(515,'Milki','Cat','Van Cat',4,5.50,'White',1015),(5900,'Boncuk','Bird','Parrot',2,0.30,'Green',1001);
/*!40000 ALTER TABLE `PETS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `PRESCRIPTIONS`
--

LOCK TABLES `PRESCRIPTIONS` WRITE;
/*!40000 ALTER TABLE `PRESCRIPTIONS` DISABLE KEYS */;
INSERT INTO `PRESCRIPTIONS` VALUES (8001,7001,401,'1 ml','Once'),(8002,7002,402,'5 ml','10 Days'),(8003,7003,403,'1/2 Scoop','7 Days'),(8004,7003,404,'1 Tablet','3 Days'),(8005,7004,411,'1 ml','30 Days'),(8006,7005,408,'1 Tablet','60 Days'),(8007,7006,412,'1 ml','Once'),(8008,7007,405,'2 Drops','7 Days'),(8009,7008,410,'As Directed','Ongoing'),(8010,7009,403,'1/4 Scoop','5 Days'),(8011,7010,402,'5 ml','10 Days'),(8012,7011,404,'1/2 Tablet','2 Days'),(8013,7012,411,'1 ml','30 Days'),(8014,7013,409,'Spray as needed','Ongoing'),(8015,7015,402,'3 ml','Once'),(8950,7001,402,'5ml','Once');
/*!40000 ALTER TABLE `PRESCRIPTIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `STAFF`
--

LOCK TABLES `STAFF` WRITE;
/*!40000 ALTER TABLE `STAFF` DISABLE KEYS */;
INSERT INTO `STAFF` VALUES (301,'Ayse','Kara','Secretary','5551001001','ayse.kara@klinik.com'),(302,'Burak','Aslan','Technician','5551001002','burak.aslan@klinik.com'),(303,'Cansu','Tekin','Accounting','5551001003','cansu.tekin@klinik.com'),(304,'Deniz','Yildiz','Receptionist','5551001004','deniz.yildiz@klinik.com'),(305,'Eren','Gul','Technician','5551001005','eren.gul@klinik.com'),(306,'Fatma','Cetin','Secretary','5551001006','fatma.cetin@klinik.com'),(307,'Gizem','Dogan','Receptionist','5551001007','gizem.dogan@klinik.com'),(308,'Hasan','Kurt','Technician','5551001008','hasan.kurt@klinik.com'),(309,'Ipek','Gur','Accounting','5551001009','ipek.gur@klinik.com'),(310,'Kemal','Sari','Receptionist','5551001010','kemal.sari@klinik.com');
/*!40000 ALTER TABLE `STAFF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `TREATMENTS`
--

LOCK TABLES `TREATMENTS` WRITE;
/*!40000 ALTER TABLE `TREATMENTS` DISABLE KEYS */;
INSERT INTO `TREATMENTS` VALUES (7001,6001,'Parasite vaccine and routine check-up','Rutin check-up, healthy. Parasite vaccine administered.','2025-11-17','2025-11-17'),(7002,6001,'General immune support','Vitamin support recommended.','2025-11-17','2025-11-17'),(7003,6002,'Foot injury treatment','Small cut, sutured and dressed.','2025-11-17','2025-11-24'),(7004,6004,'Routine Dental Check','Minor tartar buildup.','2025-11-18','2025-11-18'),(7005,6006,'Weight control and diet plan','Slight obesity. Diet program started.','2025-11-19',NULL),(7006,6007,'Annual check-up','Healthy. Rabies vaccine given.','2025-11-20','2025-11-20'),(7007,6008,'General check-up','Eyes red. Eye drops prescribed.','2025-11-20','2025-11-20'),(7008,6010,'Kidney function check','Needs specialized diet.','2025-11-21','2025-11-21'),(7009,6011,'Eye redness check','Ocular infection.','2025-11-22','2025-11-22'),(7010,6013,'Feeding consultation','Diet plan established.','2025-11-23','2025-11-23'),(7011,6002,'Pain management','Painkiller prescribed.','2025-11-17','2025-11-17'),(7012,6004,'Dental cleaning','Tartar removal.','2025-11-18','2025-11-18'),(7013,6007,'Flea/Tick treatment','Flea treatment applied.','2025-11-20','2025-11-20'),(7014,6008,'Nail trimming','Routine grooming.','2025-11-20','2025-11-20'),(7015,6010,'Vitamin shot','General booster.','2025-11-21','2025-11-21'),(7016,6003,'Check-up','Healthy','2025-12-19',NULL),(8000,6003,'General Examination','Healthy','2025-12-19',NULL),(8500,6003,'General Examination','Healthy','2025-12-19',NULL),(8800,6012,'Skin Examination','Dermatitis','2025-12-19',NULL),(8900,6999,'Skin Check','Allergy','2025-12-19',NULL);
/*!40000 ALTER TABLE `TREATMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `VETERINARIANS`
--

LOCK TABLES `VETERINARIANS` WRITE;
/*!40000 ALTER TABLE `VETERINARIANS` DISABLE KEYS */;
INSERT INTO `VETERINARIANS` VALUES (201,'Tuana','Harmankaya','Internal Medicine','5300000001','tuana.vet@klinik.com'),(202,'Fadime','Aydin','Surgery','5300000002','fadime.vet@klinik.com'),(203,'Ece','Ozdemir','Dentistry','5300000003','ece.vet@klinik.com'),(204,'Can','Aksoy','Dermatology','5300000004','can.vet@klinik.com'),(205,'Deniz','Kilic','Cardiology','5300000005','deniz.vet@klinik.com'),(206,'Ferhat','Tekin','Ophthalmology','5300000006','ferhat.vet@klinik.com'),(207,'Gizem','Sen','Neurology','5300000007','gizem.vet@klinik.com'),(208,'Hakan','Sonmez','Orthopedics','5300000008','hakan.vet@klinik.com'),(209,'Isil','Eren','Exotic Pets','5300000009','isil.vet@klinik.com'),(210,'Hatice','Demirel','Oncology','5300000010','hatice.vet@klinik.com');
/*!40000 ALTER TABLE `VETERINARIANS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-05 20:00:04
