-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Employees` (
  `EmployeeID` INT NOT NULL,
  `Role` VARCHAR(45) NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `TableNo` INT NOT NULL,
  `GuestFirstName` VARCHAR(100) NULL,
  `GuestLastName` VARCHAR(100) NULL,
  `BookingSlot` DATETIME NOT NULL,
  `EmployeeID` INT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `employee_id_fk_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `employee_id_fk`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `LittleLemonDB`.`Employees` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(45) NULL,
  `ContactNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATETIME NULL,
  `DeliveryStatus` VARCHAR(45) NULL,
  PRIMARY KEY (`DeliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `CustomerID` INT NULL,
  `BookingID` INT NULL,
  `DeliveryID` INT NULL,
  `TableNo` INT NULL,
  `OrderDate` DATETIME NULL,
  `Quantity` INT NULL,
  `BillAmout` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `booking_id_fk_idx` (`BookingID` ASC) VISIBLE,
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `delivery_id_fk_idx` (`DeliveryID` ASC) VISIBLE,
  CONSTRAINT `booking_id_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDB`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `delivery_id_fk`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `LittleLemonDB`.`Delivery` (`DeliveryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `ItemID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(200) NULL,
  `Type` VARCHAR(100) NULL,
  `Price` INT NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `MenuID` INT NOT NULL,
  `OrderID` INT NULL,
  `ItemID` INT NOT NULL,
  `Cuisine` VARCHAR(100) NULL,
  PRIMARY KEY (`MenuID`, `ItemID`),
  INDEX `item_id_fk_idx` (`ItemID` ASC) VISIBLE,
  INDEX `order_id_fk_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `item_id_fk`
    FOREIGN KEY (`ItemID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`ItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
