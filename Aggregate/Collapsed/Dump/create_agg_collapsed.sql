-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AggCollapsed
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AggCollapsed
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AggCollapsed` DEFAULT CHARACTER SET utf8 ;
USE `AggCollapsed` ;

-- -----------------------------------------------------
-- Table `AggCollapsed`.`Financial_control_analysis_FactTable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AggCollapsed`.`Financial_control_analysis_FactTable` ;

CREATE TABLE IF NOT EXISTS `AggCollapsed`.`Financial_control_analysis_FactTable` (
  `Product_SK` INT NOT NULL,
  `OrderDate_SK` INT NOT NULL,
  `SaleDate_SK` INT NOT NULL,
  `Gross Profit` DECIMAL(10,2) NULL,
  `Cost` DECIMAL(10,2) NULL,
  `Sales` DECIMAL(10,2) NULL,
  `Quantity` INT NULL,
  `Invoice ID (DD)` VARCHAR(45) NULL,
  `Business Name` VARCHAR(45) NULL,
  `Product Description` VARCHAR(45) NULL,
  `Price1` INT NULL,
  `Price2` INT NULL,
  `UnitCost` INT NULL,
  `Discounted` TINYINT(2) NULL,
  `Calendar Order year` INT NULL,
  `Calendar Order quarter` INT NULL,
  `Calendar Sale year` INT NULL,
  `Calendar Sale quarter` INT NULL,
  `Fiscal Sale year` INT NULL,
  `Fiscal Sale quarter` INT NULL,
  PRIMARY KEY (`Product_SK`, `OrderDate_SK`, `SaleDate_SK`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
