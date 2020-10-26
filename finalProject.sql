SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ceis236finalproject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ceis236finalproject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ceis236finalproject` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema ceis236_week3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ceis236_week3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ceis236_week3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ceis236finalproject` ;

-- -----------------------------------------------------
-- Table `ceis236finalproject`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceis236finalproject`.`region` (
  `region_id` INT NOT NULL AUTO_INCREMENT,
  `region_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`region_id`),
  UNIQUE INDEX `region_name_UNIQUE` (`region_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ceis236finalproject`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceis236finalproject`.`customer` (
  `cus_id` INT NOT NULL AUTO_INCREMENT,
  `cus_name` VARCHAR(45) NOT NULL,
  `cus_phone` VARCHAR(45) NULL,
  `region_region_id` INT NOT NULL,
  PRIMARY KEY (`cus_id`),
  UNIQUE INDEX `cus_id_UNIQUE` (`cus_id` ASC) VISIBLE,
  UNIQUE INDEX `cus_name_UNIQUE` (`cus_name` ASC) VISIBLE,
  UNIQUE INDEX `cus_phone_UNIQUE` (`cus_phone` ASC) VISIBLE,
  INDEX `fk_customer_region1_idx` (`region_region_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_region1`
    FOREIGN KEY (`region_region_id`)
    REFERENCES `ceis236finalproject`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ceis236finalproject`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceis236finalproject`.`employee` (
  `emp_id` INT NOT NULL AUTO_INCREMENT,
  `emp_lname` VARCHAR(15) NOT NULL,
  `emp_fname` VARCHAR(15) NOT NULL,
  `emp_mi` VARCHAR(1) NOT NULL,
  `emp_hiredate` DATETIME NULL,
  `region_region_id` INT NOT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE INDEX `emp_id_UNIQUE` (`emp_id` ASC) VISIBLE,
  UNIQUE INDEX `emp_lname_UNIQUE` (`emp_lname` ASC) VISIBLE,
  UNIQUE INDEX `emp_fname_UNIQUE` (`emp_fname` ASC) VISIBLE,
  UNIQUE INDEX `emp_mi_UNIQUE` (`emp_mi` ASC) VISIBLE,
  UNIQUE INDEX `emp_hiredate_UNIQUE` (`emp_hiredate` ASC) VISIBLE,
  INDEX `fk_employee_region1_idx` (`region_region_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_region1`
    FOREIGN KEY (`region_region_id`)
    REFERENCES `ceis236finalproject`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ceis236finalproject`.`Skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceis236finalproject`.`Skill` (
  `skill_id` INT NOT NULL AUTO_INCREMENT,
  `skill_discription` VARCHAR(45) NOT NULL,
  `skill_rate` VARCHAR(45) NULL,
  PRIMARY KEY (`skill_id`),
  UNIQUE INDEX `skill_id_UNIQUE` (`skill_id` ASC) VISIBLE,
  UNIQUE INDEX `skill_discription_UNIQUE` (`skill_discription` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ceis236finalproject`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceis236finalproject`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ceis236finalproject`.`employee_has_Skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceis236finalproject`.`employee_has_Skill` (
  `employee_emp_id` INT NOT NULL,
  `Skill_skill_id` INT NOT NULL,
  PRIMARY KEY (`employee_emp_id`, `Skill_skill_id`),
  INDEX `fk_employee_has_Skill_Skill1_idx` (`Skill_skill_id` ASC) VISIBLE,
  INDEX `fk_employee_has_Skill_employee_idx` (`employee_emp_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_has_Skill_employee`
    FOREIGN KEY (`employee_emp_id`)
    REFERENCES `ceis236finalproject`.`employee` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_Skill_Skill1`
    FOREIGN KEY (`Skill_skill_id`)
    REFERENCES `ceis236finalproject`.`Skill` (`skill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `ceis236_week3` ;

-- -----------------------------------------------------
-- Table `ceis236_week3`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceis236_week3`.`customer` (
  `CUS_CODE` INT NOT NULL,
  `CUS_LNAME` VARCHAR(15) NOT NULL,
  `CUS_FNAME` VARCHAR(15) NOT NULL,
  `CUS_INITIAL` CHAR(1) NULL DEFAULT NULL,
  `CUS_AREACODE` CHAR(3) NULL DEFAULT NULL,
  `CUS_PHONE` CHAR(8) NOT NULL,
  `CUS_BALANCE` DECIMAL(9,2) NULL DEFAULT '0.00',
  PRIMARY KEY (`CUS_CODE`),
  UNIQUE INDEX `CUS_UI1` (`CUS_LNAME` ASC, `CUS_FNAME` ASC, `CUS_PHONE` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ceis236_week3`.`emp_2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceis236_week3`.`emp_2` (
  `EMP_NUM` VARCHAR(3) NOT NULL,
  `EMP_LNAME` VARCHAR(15) NOT NULL,
  `EMP_FNAME` VARCHAR(15) NOT NULL,
  `EMP_INITIAL` VARCHAR(1) NULL DEFAULT NULL,
  `EMP_HIREDATE` DATE NULL DEFAULT NULL,
  `JOB_CODE` VARCHAR(3) NULL DEFAULT NULL,
  `emp_pct` DECIMAL(4,2) NULL DEFAULT NULL,
  `proj_num` CHAR(3) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ceis236_week3`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceis236_week3`.`employee` (
  `EMP_NUM` VARCHAR(3) NOT NULL,
  `EMP_LNAME` VARCHAR(15) NOT NULL,
  `EMP_FNAME` VARCHAR(15) NOT NULL,
  `EMP_INITIAL` VARCHAR(1) NULL DEFAULT NULL,
  `EMP_HIREDATE` DATE NULL DEFAULT NULL,
  `JOB_CODE` VARCHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ceis236_week3`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceis236_week3`.`invoice` (
  `INV_NUMBER` INT NOT NULL,
  `CUS_CODE` INT NOT NULL,
  `INV_DATE` DATETIME NOT NULL,
  PRIMARY KEY (`INV_NUMBER`),
  INDEX `INVOICE_CUS_CODE_FK` (`CUS_CODE` ASC) VISIBLE,
  CONSTRAINT `INVOICE_CUS_CODE_FK`
    FOREIGN KEY (`CUS_CODE`)
    REFERENCES `ceis236_week3`.`customer` (`CUS_CODE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ceis236_week3`.`vendor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceis236_week3`.`vendor` (
  `V_CODE` INT NOT NULL,
  `V_NAME` VARCHAR(35) NOT NULL,
  `V_CONTACT` VARCHAR(15) NOT NULL,
  `V_AREACODE` CHAR(3) NOT NULL,
  `V_PHONE` CHAR(8) NOT NULL,
  `V_STATE` CHAR(2) NOT NULL,
  `V_ORDER` CHAR(1) NOT NULL,
  PRIMARY KEY (`V_CODE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ceis236_week3`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceis236_week3`.`product` (
  `P_CODE` VARCHAR(10) NOT NULL,
  `P_DESCRIPT` VARCHAR(35) NOT NULL,
  `P_INDATE` DATETIME NOT NULL,
  `P_QOH` INT NOT NULL,
  `P_MIN` INT NOT NULL,
  `P_PRICE` DECIMAL(8,2) NOT NULL,
  `P_DISCOUNT` DECIMAL(4,2) NOT NULL,
  `V_CODE` INT NULL DEFAULT NULL,
  PRIMARY KEY (`P_CODE`),
  INDEX `PRODUCT_V_CODE_FK` (`V_CODE` ASC) VISIBLE,
  CONSTRAINT `PRODUCT_V_CODE_FK`
    FOREIGN KEY (`V_CODE`)
    REFERENCES `ceis236_week3`.`vendor` (`V_CODE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ceis236_week3`.`line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceis236_week3`.`line` (
  `INV_NUMBER` INT NOT NULL,
  `LINE_NUMBER` DECIMAL(2,0) NOT NULL,
  `P_CODE` VARCHAR(10) NOT NULL,
  `LINE_UNITS` DECIMAL(9,2) NOT NULL DEFAULT '0.00',
  `LINE_PRICE` DECIMAL(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`INV_NUMBER`, `LINE_NUMBER`),
  UNIQUE INDEX `LINE_UI1` (`INV_NUMBER` ASC, `P_CODE` ASC) VISIBLE,
  INDEX `P_CODE` (`P_CODE` ASC) VISIBLE,
  CONSTRAINT `line_ibfk_1`
    FOREIGN KEY (`INV_NUMBER`)
    REFERENCES `ceis236_week3`.`invoice` (`INV_NUMBER`)
    ON DELETE CASCADE,
  CONSTRAINT `line_ibfk_2`
    FOREIGN KEY (`P_CODE`)
    REFERENCES `ceis236_week3`.`product` (`P_CODE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `ceis236_week3` ;

-- -----------------------------------------------------
-- Placeholder table for view `ceis236_week3`.`product_inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceis236_week3`.`product_inventory` (`P_DESCRIPT` INT, `P_QOH` INT, `P_PRICE` INT, `subtotal` INT);

-- -----------------------------------------------------
-- View `ceis236_week3`.`product_inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ceis236_week3`.`product_inventory`;
USE `ceis236_week3`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ceis236_week3`.`product_inventory` AS select `ceis236_week3`.`product`.`P_DESCRIPT` AS `P_DESCRIPT`,`ceis236_week3`.`product`.`P_QOH` AS `P_QOH`,`ceis236_week3`.`product`.`P_PRICE` AS `P_PRICE`,(`ceis236_week3`.`product`.`P_QOH` * `ceis236_week3`.`product`.`P_PRICE`) AS `subtotal` from `ceis236_week3`.`product` order by (`ceis236_week3`.`product`.`P_QOH` * `ceis236_week3`.`product`.`P_PRICE`) desc;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
