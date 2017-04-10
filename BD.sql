-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.17-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para hospital
CREATE DATABASE IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hospital`;

-- Volcando estructura para tabla hospital.cita
CREATE TABLE IF NOT EXISTS `cita` (
  `FECHA` date NOT NULL,
  `HORA` time(6) NOT NULL,
  `ID_PACIENTE` int(10) NOT NULL,
  `ID_CONSULTORIO` int(10) NOT NULL,
  `ID_HOSPITAL` int(10) NOT NULL,
  PRIMARY KEY (`FECHA`,`HORA`,`ID_PACIENTE`,`ID_CONSULTORIO`,`ID_HOSPITAL`),
  KEY `fk_cita_paciente1_idx` (`ID_PACIENTE`),
  KEY `fk_cita_consultorio1_idx` (`ID_CONSULTORIO`,`ID_HOSPITAL`),
  CONSTRAINT `fk_cita_consultorio1` FOREIGN KEY (`ID_CONSULTORIO`, `ID_HOSPITAL`) REFERENCES `consultorio` (`ID_CONSULTORIO`, `ID_HOSPITAL`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cita_paciente1` FOREIGN KEY (`ID_PACIENTE`) REFERENCES `paciente` (`ID_PACIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla hospital.consultorio
CREATE TABLE IF NOT EXISTS `consultorio` (
  `ID_CONSULTORIO` int(10) NOT NULL,
  `HUBICACION` varchar(255) DEFAULT NULL,
  `ID_HOSPITAL` int(10) NOT NULL,
  PRIMARY KEY (`ID_CONSULTORIO`,`ID_HOSPITAL`),
  KEY `fk_consultorio_hospital_idx` (`ID_HOSPITAL`),
  CONSTRAINT `fk_consultorio_hospital` FOREIGN KEY (`ID_HOSPITAL`) REFERENCES `hospital` (`ID_HOSPITAL`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla hospital.consultorio_medico
CREATE TABLE IF NOT EXISTS `consultorio_medico` (
  `ID_MEDICO` int(10) NOT NULL,
  `ID_ESPECIALIDAD` int(10) NOT NULL,
  `ID_CONSULTORIO` int(10) NOT NULL,
  `ID_HOSPITAL` int(10) NOT NULL,
  PRIMARY KEY (`ID_MEDICO`,`ID_ESPECIALIDAD`,`ID_CONSULTORIO`,`ID_HOSPITAL`),
  KEY `fk_consultorio_medico_consultorio1_idx` (`ID_CONSULTORIO`,`ID_HOSPITAL`),
  CONSTRAINT `fk_consultorio_medico_consultorio1` FOREIGN KEY (`ID_CONSULTORIO`, `ID_HOSPITAL`) REFERENCES `consultorio` (`ID_CONSULTORIO`, `ID_HOSPITAL`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_consultorio_medico_medico1` FOREIGN KEY (`ID_MEDICO`, `ID_ESPECIALIDAD`) REFERENCES `medico` (`ID_MEDICO`, `ID_ESPECIALIDAD`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla hospital.especialidad
CREATE TABLE IF NOT EXISTS `especialidad` (
  `ID_ESPECIALIDAD` int(10) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_ESPECIALIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla hospital.hospital
CREATE TABLE IF NOT EXISTS `hospital` (
  `ID_HOSPITAL` int(10) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_HOSPITAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla hospital.medico
CREATE TABLE IF NOT EXISTS `medico` (
  `ID_MEDICO` int(10) NOT NULL,
  `ID_ESPECIALIDAD` int(10) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_MEDICO`,`ID_ESPECIALIDAD`),
  KEY `fk_medico_especialidad1_idx` (`ID_ESPECIALIDAD`),
  CONSTRAINT `fk_medico_especialidad1` FOREIGN KEY (`ID_ESPECIALIDAD`) REFERENCES `especialidad` (`ID_ESPECIALIDAD`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla hospital.paciente
CREATE TABLE IF NOT EXISTS `paciente` (
  `ID_PACIENTE` int(10) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_PACIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla hospital.receta
CREATE TABLE IF NOT EXISTS `receta` (
  `ID_RECETA` int(10) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `ID_MEDICO` int(10) NOT NULL,
  `ID_ESPECIALIDAD` int(10) NOT NULL,
  `ID_PACIENTE` int(10) NOT NULL,
  PRIMARY KEY (`ID_RECETA`,`ID_MEDICO`,`ID_ESPECIALIDAD`,`ID_PACIENTE`),
  KEY `fk_receta_medico1_idx` (`ID_MEDICO`,`ID_ESPECIALIDAD`),
  KEY `fk_receta_paciente1_idx` (`ID_PACIENTE`),
  CONSTRAINT `fk_receta_medico1` FOREIGN KEY (`ID_MEDICO`, `ID_ESPECIALIDAD`) REFERENCES `medico` (`ID_MEDICO`, `ID_ESPECIALIDAD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_receta_paciente1` FOREIGN KEY (`ID_PACIENTE`) REFERENCES `paciente` (`ID_PACIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
