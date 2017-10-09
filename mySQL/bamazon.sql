CREATE SCHEMA IF NOT EXISTS `bamazon` DEFAULT CHARACTER SET latin1;

CREATE TABLE IF NOT EXISTS `bamazon`.`bamazon_inventory` (
  `item_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `department_name` VARCHAR(45) NOT NULL,
  `product_cost` INT(11) NOT NULL,
  `stock_quantity` INT(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE INDEX `product_name_UNIQUE` (`product_name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;

INSERT INTO `bamazon`.`bamazon_inventory` (`item_id`, `product_name`, `department_name`, `product_cost`, `stock_quantity`) VALUES (item_id, 'product_name', 'department_name', product_cost, stock_quantity);
INSERT INTO `bamazon`.`bamazon_inventory` (`item_id`, `product_name`, `department_name`, `product_cost`, `stock_quantity`) VALUES (1, 'Soap', 'home', 1, 2);
INSERT INTO `bamazon`.`bamazon_inventory` (`item_id`, `product_name`, `department_name`, `product_cost`, `stock_quantity`) VALUES (2, 'Soup', 'food', 3, 7);
INSERT INTO `bamazon`.`bamazon_inventory` (`item_id`, `product_name`, `department_name`, `product_cost`, `stock_quantity`) VALUES (3, 'Sap', 'garden', 2, 10);
INSERT INTO `bamazon`.`bamazon_inventory` (`item_id`, `product_name`, `department_name`, `product_cost`, `stock_quantity`) VALUES (4, 'Slop', 'food', 4, 1);
INSERT INTO `bamazon`.`bamazon_inventory` (`item_id`, `product_name`, `department_name`, `product_cost`, `stock_quantity`) VALUES (5, 'Slapstick', 'entertainment', 6, 70);
