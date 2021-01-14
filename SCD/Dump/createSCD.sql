-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SCD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SCD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SCD` DEFAULT CHARACTER SET utf8 ;
USE `SCD` ;

-- -----------------------------------------------------
-- Table `SCD`.`Customer_Dim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SCD`.`Customer_Dim` ;

CREATE TABLE IF NOT EXISTS `SCD`.`Customer_Dim` (
  `Customer_SK` INT NOT NULL AUTO_INCREMENT,
  `CustomerID` INT NOT NULL,
  `Customer Name` VARCHAR(45) NULL,
  `CustomerType_ID` VARCHAR(1) NULL,
  `custTypename` VARCHAR(45) NULL,
  `Address` VARCHAR(100) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Zip` VARCHAR(45) NULL,
  `Div` VARCHAR(10) NULL,
  `Valid_from` DATE NULL,
  `Valid_through` DATE NULL,
  `Version` INT NULL,
  PRIMARY KEY (`Customer_SK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SCD`.`Supplier_Dim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SCD`.`Supplier_Dim` ;

CREATE TABLE IF NOT EXISTS `SCD`.`Supplier_Dim` (
  `Supplier_SK` INT NOT NULL AUTO_INCREMENT,
  `SupplierID` INT NULL,
  `Previous_SupplierName` VARCHAR(45) NULL,
  `Current_supplierName` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Zip` VARCHAR(45) NULL,
  PRIMARY KEY (`Supplier_SK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SCD`.`Product_Dim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SCD`.`Product_Dim` ;

CREATE TABLE IF NOT EXISTS `SCD`.`Product_Dim` (
  `Product_SK` INT NOT NULL AUTO_INCREMENT,
  `Product_ID` INT NULL,
  `Business Name` VARCHAR(45) NULL,
  `Business Abbrev` VARCHAR(45) NULL,
  `Previous Product TyoeDesc` VARCHAR(100) NULL,
  `Current Product TypeDesc` VARCHAR(100) NULL,
  `Previous_Product Description` VARCHAR(45) NULL,
  `Current_Product Description` VARCHAR(45) NULL,
  `Price1` INT NULL,
  `Price2` INT NULL,
  `UnitCost` INT NULL,
  `Div` VARCHAR(10) NULL,
  `Discounted` TINYINT NULL,
  `Valid_from` DATE NULL,
  `Valid_through` DATE NULL,
  `Version` INT NULL,
  PRIMARY KEY (`Product_SK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SCD`.`OrderDate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SCD`.`OrderDate` ;

CREATE TABLE IF NOT EXISTS `SCD`.`OrderDate` (
  `OrderDate_SK` INT NOT NULL AUTO_INCREMENT,
  `Calendar Order Year` INT NULL,
  `Calendar Order quarter` INT NULL,
  `Calendar Order month` INT NULL,
  `Calendar Order week` INT NULL,
  `Order Day` DATE NULL,
  `FIscal Order year` INT NULL,
  `Fiscal Order quarter` INT NULL,
  `Fiscal Order month` INT NULL,
  `Fiscal order week` INT NULL,
  PRIMARY KEY (`OrderDate_SK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SCD`.`SaleDate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SCD`.`SaleDate` ;

CREATE TABLE IF NOT EXISTS `SCD`.`SaleDate` (
  `SaleDate_SK` INT NOT NULL AUTO_INCREMENT,
  `Calendar Sale year` INT NULL,
  `Calendar Sale quarter` INT NULL,
  `Calendar Sale month` INT NULL,
  `Calendar Sale week` INT NULL,
  `Sale day` DATE NULL,
  `Fiscal Sale year` INT NULL,
  `Fiscal sale quarter` INT NULL,
  `Fiscal sale month` INT NULL,
  `Fiscal sale week` INT NULL,
  PRIMARY KEY (`SaleDate_SK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SCD`.`Order_ship_payment_junkdim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SCD`.`Order_ship_payment_junkdim` ;

CREATE TABLE IF NOT EXISTS `SCD`.`Order_ship_payment_junkdim` (
  `Order_ship_payment_junkdim_SK` INT NOT NULL AUTO_INCREMENT,
  `Order method` VARCHAR(45) NULL,
  `shipment method` VARCHAR(45) NULL,
  `payment method` VARCHAR(45) NULL,
  PRIMARY KEY (`Order_ship_payment_junkdim_SK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SCD`.`Financial_control_analysis_FactTable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SCD`.`Financial_control_analysis_FactTable` ;

CREATE TABLE IF NOT EXISTS `SCD`.`Financial_control_analysis_FactTable` (
  `Customer_SK` INT NOT NULL,
  `Product_SK` INT NOT NULL,
  `Supplier_SK` INT NOT NULL,
  `OrderDate_SK` INT NOT NULL,
  `SaleDate_SK` INT NOT NULL,
  `Order_ship_payment_junkdim_SK` INT NOT NULL,
  `Gross Profit` DECIMAL(10,2) NULL,
  `Cost` DECIMAL(10,2) NULL,
  `Sales` DECIMAL(10,2) NULL,
  `Quantity` INT NULL,
  `Invoice ID (DD)` VARCHAR(45) NULL,
  PRIMARY KEY (`Customer_SK`, `Product_SK`, `Supplier_SK`, `OrderDate_SK`, `SaleDate_SK`, `Order_ship_payment_junkdim_SK`),
  INDEX `Product_SK_idx` (`Product_SK` ASC) VISIBLE,
  INDEX `Supplier_SK_idx` (`Supplier_SK` ASC) VISIBLE,
  INDEX `OrderDate_SK_idx` (`OrderDate_SK` ASC) VISIBLE,
  INDEX `SaleDate_SK_idx` (`SaleDate_SK` ASC) VISIBLE,
  INDEX `Order_ship_payment_junkdim_SK_idx` (`Order_ship_payment_junkdim_SK` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
