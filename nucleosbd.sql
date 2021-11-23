CREATE DATABASE  IF NOT EXISTS `nucleosdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nucleosdb`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: nucleosdb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `doacao_doadores`
--

DROP TABLE IF EXISTS `doacao_doadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doacao_doadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doacao` varchar(45) NOT NULL,
  `quantidade` int NOT NULL,
  `mensagem` varchar(200) DEFAULT NULL,
  `data` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `entrega` varchar(45) DEFAULT NULL,
  `isAnonimo` varchar(45) DEFAULT NULL,
  `fk_ong_doacao_doadores` int NOT NULL,
  `fk_doadores_doacao_doadores` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doacao_doadores`
--

LOCK TABLES `doacao_doadores` WRITE;
/*!40000 ALTER TABLE `doacao_doadores` DISABLE KEYS */;
INSERT INTO `doacao_doadores` VALUES (1,'Roupas',20,'Usem com muito carinho!','05/11/2021 14:17:00','bom','sim','sim',3,1),(2,'Calçados',10,'Espero que os que recebam possam se sentir mais aliviados.','06/11/2021 15:14:35','regular','sim','nao',2,3),(3,'Aulas de Musica',5,'Desejo alegrar mais a vida dos jovens do Recife!','07/11/2021 12:10:30','bom','sim','nao',5,4),(4,'Racao Whiskas',10,'Espero que essa racao possa ajudar na alimentacao desses animais da Petcife.','09/11/2021 23:01:00','bom','sim','nao',4,1),(5,'Bolsas',10,'Bolsas para ajudar vocês.','05/12/2021 23:21:00','bom','sim','nao',5,5),(30,'20kg de Racao',2,'Espero que seja de bom uso para os animaizinhos da Petcife!','17/11/2021 21:40:40','bom','sim','sim',4,7),(31,'Roupa de Mergulho',20,'Usem bem!','17/11/2021 21:48:36','bom','nao','nao',1,7),(33,'Computadores',10,'Espero que todos possam aprender sobre tecnologia e consigam ganhar o mundo com este aprendizado!','19/11/2021 20:31:02','bom','sim','nao',5,7);
/*!40000 ALTER TABLE `doacao_doadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doacao_empresas`
--

DROP TABLE IF EXISTS `doacao_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doacao_empresas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doacao` varchar(45) NOT NULL,
  `quantidade` int NOT NULL,
  `mensagem` varchar(200) DEFAULT NULL,
  `data` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `entrega` varchar(45) DEFAULT NULL,
  `isAnonimo` varchar(45) DEFAULT NULL,
  `fk_ong_doacao_empresas` int NOT NULL,
  `fk_empresas_doacao_empresas` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doacao_empresas`
--

LOCK TABLES `doacao_empresas` WRITE;
/*!40000 ALTER TABLE `doacao_empresas` DISABLE KEYS */;
INSERT INTO `doacao_empresas` VALUES (2,'Computadores',10,'Espero que os jovens possam aprender um pouco mais sobre tecnologia.','05/11/2021 23:08:17','bom','sim','nao',5,2),(3,'Brinquedos',20,'Felicidades aos Petzinhos do nosso Recife.','08/11/2021 19:21:00','bom','sim','nao',4,3),(4,'Computadores',10,'Espero que todos possam aprender sobre tecnologia e consigam ganhar o mundo com este aprendizado!','12/11/2021 12:13:11','regular','sim','nao',1,2),(7,'Brinquedo de Linha para Gatos',56,'Que os gatinhos possam brincar e se divertir muito','12/11/2021 15:48:42','bom','sim','nao',4,2),(9,'Livros Didaticos',50,'Ofereco ao Instituto Janga um nova esperanca para os Recifenses.','18/11/2021 00:08:13','regular','sim','não',2,1);
/*!40000 ALTER TABLE `doacao_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doadores`
--

DROP TABLE IF EXISTS `doadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `sobrenome` varchar(45) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `img_src` varchar(45) DEFAULT NULL,
  `bairro` varchar(200) DEFAULT NULL,
  `permissao` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doadores`
--

LOCK TABLES `doadores` WRITE;
/*!40000 ALTER TABLE `doadores` DISABLE KEYS */;
INSERT INTO `doadores` VALUES (1,'Cleiton','José','cleiton.jose@gmail.com','336D5EBC5436534E61D16E63DDFCA327','20219329456','81983159564','/NucleosApp/img/user.jpg','Rua Cornelio de Barros, 15, Aflitos',1),(2,'Gustavo','Lima','gustavo.lima@gmail.com','7BEB04F055AE4EC109E74162520C11B1','22415478454','997436214','/NucleosApp/img/user.jpg','Rua Jose Fernandes, 28, Casa Amarela',1),(3,'Jefersson','Barros','jefersson.barros@gmail.com','687CACFCA88573231A11FA969DD63DB3','20214789456','996258741','/NucleosApp/img/user.jpg','Rua Afonso Pereira, 92, Afogados',1),(4,'Italo','Costa','italo.costa@gmail.com','B3E8B2334A1276933550FD7C47DA8B93','11112614788','81983159564','/NucleosApp/img/user.jpg','Rua Professor Lins Silva, 42, Cohab',1),(5,'Elton','Jhon','elton.jhon@gmail.com','8C430BBE27BBCDA7DAFAA8ECD046B423','02587984561','81983159564','/NucleosApp/img/user.jpg','Rua Antonio Jose Carlos, 54, Ibura',1),(6,'Usuario','Teste','teste@teste','698DC19D489C4E4DB73E28A713EAB07B','17812614788','976257741','/NucleosApp/img/user.jpg','Rua Afonso Pena, 76, Boa Vista',1),(7,'Lexie','Oliveira','lexie.oliveira@gmail.com','202CB962AC59075B964B07152D234B70','12312818477','81983159564','/NucleosApp/img/user.jpg','Ibura',1);
/*!40000 ALTER TABLE `doadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `cnpj` varchar(14) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `img_src` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `permissao` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnpj_UNIQUE` (`cnpj`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'Ferreira Construções','ferreira@construcoes.com','336D5EBC5436534E61D16E63DDFCA327','17641478145987','8134421458','/NucleosApp/img/user.jpg','Rua Monte Alegre, 54, Rio Doce',2),(2,'Bobis Toys','bobis.toys@toys.com','6252468BABC60E091C369E0F0DEB1AA5','16897452145987','8135244220','/NucleosApp/img/bobis.jpeg','Rua do Sossego, 70, Aflitos',2),(3,'Master Phones','master.phones@phones.com.br','6797F82F504379E72C59879B12594D39','26547894531423','8132158794','/NucleosApp/img/master.jpeg','Rua Treze de Maio, 65, Arruda',2),(4,'Tecnica Log','tecnica.log@tecnica.com','1D7430F0A8667CA518AD6759AE7C2FE7','24517747485692','8132646468','/NucleosApp/img/tecnica.jpeg','Rua Dez, 21, Parnamirim',2),(5,'Restaurante Donnattelli','restaurante.donnattelli@donnattelli.com','6790CC71B4D372A21591DE391D358860','14555489632214','8131155236','/NucleosApp/img/donnattelli.jpeg','Rua Dom Bosco, 45, Boa Viagem',2),(6,'Limpax','limpax@limpax.com.br','0621A066F51FBF2357FE47420D5DFF6B','12478552364698','8130042792','/NucleosApp/img/limpax.jpeg','Rua Carlos Cavalcanti, 10, Parnamirim',2);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ong`
--

DROP TABLE IF EXISTS `ong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ong` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `registro_instituicao` varchar(14) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `img_src` varchar(100) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `descricao` varchar(5000) DEFAULT NULL,
  `permissao` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registro_instituicao_UNIQUE` (`registro_instituicao`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ong`
--

LOCK TABLES `ong` WRITE;
/*!40000 ALTER TABLE `ong` DISABLE KEYS */;
INSERT INTO `ong` VALUES (1,'Fundação Beira-Mar','beiramar@inst.com','0359F79234413A4905121844680E5C15','17182987000105','31202014','/NucleosApp/img/fundacaobm.jpeg','Rua Joaquim Nabuco, 15, Boa Viagem','Somos a Fundação Beira-Mar, buscamos ajudar o meio-ambiente com sua ajuda!',3),(2,'Instituto Janga','institutojanga@inst.com','00F08D4260AE7954EA604868D04870D3','13344818000173','32315478','/NucleosApp/img/instjanga.jpeg','Rua do Principe, 15, Janga','Nós da Instituto Janga queremos trazer uma nova esperança para os cidadões recifenses.',3),(3,'Viva Recife','vivarecifa@inst.com','F0B901B972D8CB0A118BDAAA6678F65A','79933894000122','34789456','/NucleosApp/img/vivarecife.jpeg','Rua das Ninfas, 98, São José','Na Viva Recife, procuramos ajudar o Recife com nosso apoio.',3),(4,'Petcife S.A','petcife@inst.com','E6A67D292097653C5C3925B627723813','08388154000104','35244220','/NucleosApp/img/petcife.jpeg','Aflitos','mUITO BOA',3),(5,'Rede de Apoio aos Jovens','raj123@inst.com','F8F4796AFF7FFB9A5F2E93960C314D07','36303972000100','32457412','/NucleosApp/img/raj.jpeg','Rua da Moeda, 10, Ibura','A RAJ (Rede de Apoio aos Jovens) busca ajudar os jovens recifenses com preparação para o mercado de trabalho.',3);
/*!40000 ALTER TABLE `ong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voluntariar`
--

DROP TABLE IF EXISTS `voluntariar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voluntariar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `funcao` varchar(30) DEFAULT NULL,
  `disponibilidade` varchar(20) DEFAULT NULL,
  `caracteristicas` varchar(200) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `fk_doadores_voluntariar` int NOT NULL,
  `fk_ong_voluntariar` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_doadores_voluntariar_idx` (`fk_doadores_voluntariar`),
  KEY `fk_ong_voluntariar_idx` (`fk_ong_voluntariar`),
  CONSTRAINT `fk_doadores_voluntariar` FOREIGN KEY (`fk_doadores_voluntariar`) REFERENCES `doadores` (`id`),
  CONSTRAINT `fk_ong_voluntariar` FOREIGN KEY (`fk_ong_voluntariar`) REFERENCES `ong` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voluntariar`
--

LOCK TABLES `voluntariar` WRITE;
/*!40000 ALTER TABLE `voluntariar` DISABLE KEYS */;
INSERT INTO `voluntariar` VALUES (3,'Professora de Música','Qualquer turno','Sou muito focada na minha profissão, sou comunicativa. Meu ponto fraco é que eu tenho dificuldade em abandonar um projeto.','Trabalho com música há mais de 15 anos. Estou cursando Mestrado em Música e espero estar ajudando a Ong dando cursos para os Jovens.',7,4),(5,'Chef de Cozinha','Manhã e Tarde','Sou muito focada na minha profissão, sou comunicativa. Meu ponto fraco é que eu tenho dificuldade em abandonar um projeto.','Trabalho com culinária há mais de 15 anos. Estou cursando mestrado em Gastronomia e espero estar ajudando a Ong para o bem do Recife!',5,4),(6,'Professora de Música','Qualquer turno','Sou muito focada na minha profissão, sou comunicativa. Meu ponto fraco é que eu tenho dificuldade em abandonar um projeto.','Trabalho com música há mais de 15 anos. Estou cursando Mestrado em Música e espero estar ajudando a Ong dando cursos para os Jovens.',7,2);
/*!40000 ALTER TABLE `voluntariar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nucleosdb'
--

--
-- Dumping routines for database 'nucleosdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-23 20:46:03
