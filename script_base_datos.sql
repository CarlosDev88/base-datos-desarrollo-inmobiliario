
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_Patrimonio_Inmobiliario
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_Patrimonio_Inmobiliario` DEFAULT CHARACTER SET utf8 ;
USE `db_Patrimonio_Inmobiliario` ;

-- -----------------------------------------------------
-- Table `db_Patrimonio_Inmobiliario`.`tbl_tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Patrimonio_Inmobiliario`.`tbl_tipo_usuario` (
  `id_tipo_usuario` INT NOT NULL AUTO_INCREMENT,
  `tipo_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`),
  UNIQUE INDEX `tipo_usuario_UNIQUE` (`tipo_usuario` ASC) VISIBLE);

-- -----------------------------------------------------
-- Table `db_Patrimonio_Inmobiliario`.`tbl_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Patrimonio_Inmobiliario`.`tbl_usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `documento` VARCHAR(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NULL,
  `id_tipo_usuario` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_tipo_usuario`),
  UNIQUE INDEX `documento_UNIQUE` (`documento` ASC) VISIBLE,
  INDEX `fk_tbl_usuarios_tbl_tipo_usuario1_idx` (`id_tipo_usuario` ASC) VISIBLE,
  CONSTRAINT `id_tipo_usuario`
    FOREIGN KEY (`id_tipo_usuario`)
    REFERENCES `db_Patrimonio_Inmobiliario`.`tbl_tipo_usuario` (`id_tipo_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
-- -----------------------------------------------------
-- Table `db_Patrimonio_Inmobiliario`.`tbl_departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Patrimonio_Inmobiliario`.`tbl_departamento` (
  `id_departamento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_departamento`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE);
  
-- -----------------------------------------------------
-- Table `db_Patrimonio_Inmobiliario`.`tbl_ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Patrimonio_Inmobiliario`.`tbl_ciudad` (
  `id_ciudad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `id_departamento` INT NOT NULL,
  PRIMARY KEY (`id_ciudad`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  INDEX `id_departamentos_idx` (`id_departamento` ASC) VISIBLE,
  CONSTRAINT `id_departamentos`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `db_Patrimonio_Inmobiliario`.`tbl_departamento` (`id_departamento`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table `db_Patrimonio_Inmobiliario`.`tbl_vivienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Patrimonio_Inmobiliario`.`tbl_vivienda` (
  `id_vivienda` INT NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `cantidad_personas` INT NOT NULL,
  `id_ciudad` INT NOT NULL,
  PRIMARY KEY (`id_vivienda`),
  UNIQUE INDEX `numero_UNIQUE` (`numero` ASC) VISIBLE,
  INDEX `id_ciudad_idx` (`id_ciudad` ASC) VISIBLE,
  CONSTRAINT `id_ciudad`
    FOREIGN KEY (`id_ciudad`)
    REFERENCES `db_Patrimonio_Inmobiliario`.`tbl_ciudad` (`id_ciudad`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table `db_Patrimonio_Inmobiliario`.`tbl_alquileres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Patrimonio_Inmobiliario`.`tbl_alquileres` (
  `id_alquiler` INT NOT NULL AUTO_INCREMENT,
  `fecha_inicio` DATETIME NOT NULL,
  `fecha_fin` DATETIME NOT NULL,
  `canon_mensual` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `id_vivienda` INT NOT NULL,
  PRIMARY KEY (`id_alquiler`),
  INDEX `id_user_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `id_vivienda_idx` (`id_vivienda` ASC) VISIBLE,
  CONSTRAINT `id_user`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `db_Patrimonio_Inmobiliario`.`tbl_usuarios` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_vivienda`
    FOREIGN KEY (`id_vivienda`)
    REFERENCES `db_Patrimonio_Inmobiliario`.`tbl_vivienda` (`id_vivienda`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
