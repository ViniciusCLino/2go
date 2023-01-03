-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.26 - MySQL Community Server - GPL
-- OS do Servidor:               Linux
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para 2go
CREATE DATABASE IF NOT EXISTS `2go` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `2go`;

-- Copiando estrutura para tabela 2go.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela 2go.departamento: ~4 rows (aproximadamente)
INSERT INTO `departamento` (`id`, `nome`) VALUES
	(1, 'Comercial'),
	(2, 'Financeiro'),
	(3, 'Marketing'),
	(4, 'RH');

-- Copiando estrutura para tabela 2go.dependente
CREATE TABLE IF NOT EXISTS `dependente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo_id` int NOT NULL,
  `grau_parentesco_id` int NOT NULL,
  `funcionario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dependente_sexo1_idx` (`sexo_id`),
  KEY `fk_dependente_grau_parentesco1_idx` (`grau_parentesco_id`),
  KEY `fk_dependente_funcionario1_idx` (`funcionario_id`),
  CONSTRAINT `fk_dependente_funcionario1` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`id`),
  CONSTRAINT `fk_dependente_grau_parentesco1` FOREIGN KEY (`grau_parentesco_id`) REFERENCES `grau_parentesco` (`id`),
  CONSTRAINT `fk_dependente_sexo1` FOREIGN KEY (`sexo_id`) REFERENCES `sexo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela 2go.dependente: ~1 rows (aproximadamente)
INSERT INTO `dependente` (`id`, `nome`, `cpf`, `data_nascimento`, `sexo_id`, `grau_parentesco_id`, `funcionario_id`) VALUES
	(1, 'Marina Daiane Souza', '84435975777', '2005-04-12', 1, 5, 1);

-- Copiando estrutura para tabela 2go.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `data_contrato` date DEFAULT NULL,
  `departamento_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_funcionario_departamento1_idx` (`departamento_id`),
  CONSTRAINT `fk_funcionario_departamento1` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela 2go.funcionario: ~6 rows (aproximadamente)
INSERT INTO `funcionario` (`id`, `nome`, `cpf`, `cargo`, `data_contrato`, `departamento_id`) VALUES
	(1, 'Francisca Fátima da Costa', '54175950206', 'Auxiliar de RH', '2022-02-25', 4),
	(2, 'Bárbara Sabrina Marlene Assis', '27395660269', 'Auxiliar de RH', '2022-05-12', 4),
	(3, 'Daniel Gustavo Monteiro', '32761509994', 'Auxiliar de marketing', '2022-06-29', 3),
	(4, 'Gabrielly Isabelly Farias', '24184865917', 'Auxiliar financeiro', '2022-02-10', 2),
	(5, 'Oliver Pedro Pinto', '58202470781', 'Auxiliar comercial', '2022-08-09', 1),
	(6, 'Clara Fabiana Cristiane Gonçalves', '81410364402', 'Auxiliar de marketing', '2022-12-01', 3);

-- Copiando estrutura para tabela 2go.funcionario_projeto
CREATE TABLE IF NOT EXISTS `funcionario_projeto` (
  `funcionario_id` int NOT NULL,
  `projeto_id` int NOT NULL,
  PRIMARY KEY (`funcionario_id`,`projeto_id`),
  KEY `fk_funcionario_has_projeto_projeto1_idx` (`projeto_id`),
  KEY `fk_funcionario_has_projeto_funcionario1_idx` (`funcionario_id`),
  CONSTRAINT `fk_funcionario_has_projeto_funcionario1` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`id`),
  CONSTRAINT `fk_funcionario_has_projeto_projeto1` FOREIGN KEY (`projeto_id`) REFERENCES `projeto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela 2go.funcionario_projeto: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela 2go.grau_parentesco
CREATE TABLE IF NOT EXISTS `grau_parentesco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela 2go.grau_parentesco: ~5 rows (aproximadamente)
INSERT INTO `grau_parentesco` (`id`, `descricao`) VALUES
	(1, 'Pai'),
	(2, 'Mãe'),
	(3, 'Irmão'),
	(4, 'Primo'),
	(5, 'Filho');

-- Copiando estrutura para tabela 2go.projeto
CREATE TABLE IF NOT EXISTS `projeto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `prazo_final` date DEFAULT NULL,
  `departamento_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_projeto_departamento_idx` (`departamento_id`),
  CONSTRAINT `fk_projeto_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela 2go.projeto: ~8 rows (aproximadamente)
INSERT INTO `projeto` (`id`, `nome`, `prazo_final`, `departamento_id`) VALUES
	(1, 'Projeto RH 1', '2022-12-31', 4),
	(2, 'Projeto RH 2', '2022-11-08', 4),
	(3, 'Projeto Comercial 1', '2022-10-19', 1),
	(4, 'Projeto Comercial 2', '2022-11-07', 1),
	(5, 'Projeto Financeiro 1', '2022-08-01', 2),
	(6, 'Projeto Financeiro 2', '2022-02-18', 2),
	(7, 'Projeto Marketing 1', '2022-03-22', 3),
	(8, 'Projeto Marketing 2', '2022-02-18', 3);

-- Copiando estrutura para tabela 2go.sexo
CREATE TABLE IF NOT EXISTS `sexo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela 2go.sexo: ~2 rows (aproximadamente)
INSERT INTO `sexo` (`id`, `descricao`) VALUES
	(1, 'Masculino'),
	(2, 'Feminino');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
