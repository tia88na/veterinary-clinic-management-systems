-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema veterinary_clinic
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema veterinary_clinic
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `veterinary_clinic` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `veterinary_clinic` ;

-- -----------------------------------------------------
-- Table `veterinary_clinic`.`OWNERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinary_clinic`.`OWNERS` (
  `OwnerID` INT NOT NULL,
  `FirstName` VARCHAR(100) NOT NULL,
  `LastName` VARCHAR(100) NOT NULL,
  `Address` VARCHAR(300) NULL DEFAULT NULL,
  `Phone_no` VARCHAR(15) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`OwnerID`),
  UNIQUE INDEX `Email` (`Email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `veterinary_clinic`.`PETS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinary_clinic`.`PETS` (
  `PetID` INT NOT NULL,
  `Name` VARCHAR(50) NOT NULL,
  `Species` VARCHAR(50) NOT NULL,
  `Breed` VARCHAR(50) NULL DEFAULT NULL,
  `Age` INT NULL DEFAULT NULL,
  `Weight` DECIMAL(5,2) NULL DEFAULT NULL,
  `Color` VARCHAR(50) NULL DEFAULT NULL,
  `OwnerID` INT NOT NULL,
  PRIMARY KEY (`PetID`),
  INDEX `OwnerID` (`OwnerID` ASC) VISIBLE,
  CONSTRAINT `pets_ibfk_1`
    FOREIGN KEY (`OwnerID`)
    REFERENCES `veterinary_clinic`.`OWNERS` (`OwnerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `veterinary_clinic`.`VETERINARIANS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinary_clinic`.`VETERINARIANS` (
  `VetID` INT NOT NULL,
  `FirstName` VARCHAR(50) NOT NULL,
  `LastName` VARCHAR(50) NOT NULL,
  `Specialty_Area` VARCHAR(100) NULL DEFAULT NULL,
  `Phone_number` VARCHAR(15) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`VetID`),
  UNIQUE INDEX `Email` (`Email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `veterinary_clinic`.`APPOINTMENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinary_clinic`.`APPOINTMENTS` (
  `AppointmentID` INT NOT NULL,
  `PetID` INT NOT NULL,
  `VetID` INT NOT NULL,
  `OwnerID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Time` TIME NOT NULL,
  `Status` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  INDEX `PetID` (`PetID` ASC) VISIBLE,
  INDEX `VetID` (`VetID` ASC) VISIBLE,
  INDEX `OwnerID` (`OwnerID` ASC) VISIBLE,
  CONSTRAINT `appointments_ibfk_1`
    FOREIGN KEY (`PetID`)
    REFERENCES `veterinary_clinic`.`PETS` (`PetID`),
  CONSTRAINT `appointments_ibfk_2`
    FOREIGN KEY (`VetID`)
    REFERENCES `veterinary_clinic`.`VETERINARIANS` (`VetID`),
  CONSTRAINT `appointments_ibfk_3`
    FOREIGN KEY (`OwnerID`)
    REFERENCES `veterinary_clinic`.`OWNERS` (`OwnerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `veterinary_clinic`.`MEDICATIONS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinary_clinic`.`MEDICATIONS` (
  `MedicationID` INT NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `Type` VARCHAR(50) NULL DEFAULT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  `StockQuantity` INT NOT NULL,
  `ExpirationDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`MedicationID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `veterinary_clinic`.`PAYMENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinary_clinic`.`PAYMENTS` (
  `PaymentID` INT NOT NULL,
  `AppointmentID` INT NOT NULL,
  `Amount` DECIMAL(10,2) NOT NULL,
  `PaymentDate` DATE NOT NULL,
  `PaymentMethod` VARCHAR(50) NULL DEFAULT NULL,
  `Status` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  UNIQUE INDEX `AppointmentID` (`AppointmentID` ASC) VISIBLE,
  CONSTRAINT `payments_ibfk_1`
    FOREIGN KEY (`AppointmentID`)
    REFERENCES `veterinary_clinic`.`APPOINTMENTS` (`AppointmentID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `veterinary_clinic`.`TREATMENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinary_clinic`.`TREATMENTS` (
  `TreatmentID` INT NOT NULL,
  `AppointmentID` INT NOT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  `Diagnosis` TEXT NULL DEFAULT NULL,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`TreatmentID`),
  INDEX `AppointmentID` (`AppointmentID` ASC) VISIBLE,
  CONSTRAINT `treatments_ibfk_1`
    FOREIGN KEY (`AppointmentID`)
    REFERENCES `veterinary_clinic`.`APPOINTMENTS` (`AppointmentID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `veterinary_clinic`.`PRESCRIPTIONS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinary_clinic`.`PRESCRIPTIONS` (
  `PrescriptionID` INT NOT NULL,
  `TreatmentID` INT NOT NULL,
  `MedicationID` INT NOT NULL,
  `Dosage` VARCHAR(50) NOT NULL,
  `Duration` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`PrescriptionID`),
  INDEX `TreatmentID` (`TreatmentID` ASC) VISIBLE,
  INDEX `MedicationID` (`MedicationID` ASC) VISIBLE,
  CONSTRAINT `prescriptions_ibfk_1`
    FOREIGN KEY (`TreatmentID`)
    REFERENCES `veterinary_clinic`.`TREATMENTS` (`TreatmentID`),
  CONSTRAINT `prescriptions_ibfk_2`
    FOREIGN KEY (`MedicationID`)
    REFERENCES `veterinary_clinic`.`MEDICATIONS` (`MedicationID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `veterinary_clinic`.`STAFF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinary_clinic`.`STAFF` (
  `StaffID` INT NOT NULL,
  `FirstName` VARCHAR(50) NOT NULL,
  `LastName` VARCHAR(50) NOT NULL,
  `Position` VARCHAR(50) NULL DEFAULT NULL,
  `Phone_no` VARCHAR(15) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  UNIQUE INDEX `Email` (`Email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
