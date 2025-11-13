CREATE TABLE IF NOT EXISTS `roles` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `users` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`role_id` INTEGER,
	`fio` VARCHAR(255),
	`email` VARCHAR(255),
	`password` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE INDEX `users_index_0`
ON `users` (`role_id`);
CREATE TABLE IF NOT EXISTS `units` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `type_products` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `statuses` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `points` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `gender_shoes` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `products` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`articul` VARCHAR(255),
	`type_product` INTEGER,
	`unit` INTEGER,
	`price` INTEGER,
	`supplier` INTEGER,
	`manufacturer` INTEGER,
	`type_gender_shoes` INTEGER,
	`discount` INTEGER,
	`amount` INTEGER,
	`description` VARCHAR(255),
	`photo` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE INDEX `products_index_0`
ON `products` (`type_product`);
CREATE INDEX `products_index_1`
ON `products` (`unit`);
CREATE INDEX `products_index_2`
ON `products` (`supplier`);
CREATE INDEX `products_index_3`
ON `products` (`manufacturer`);
CREATE INDEX `products_index_4`
ON `products` (`type_gender_shoes`);
CREATE TABLE IF NOT EXISTS `suppliers` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `manufacturers` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `orders` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`product_id` INTEGER,
	`amount` INTEGER,
	`date_order` DATE,
	`date_delivery` DATE,
	`point` INTEGER,
	`user_id` INTEGER,
	`code` INTEGER,
	`status_id` INTEGER,
	PRIMARY KEY(`id`)
);


CREATE INDEX `orders_index_0`
ON `orders` (`product_id`);
CREATE INDEX `orders_index_1`
ON `orders` (`point`);
CREATE INDEX `orders_index_2`
ON `orders` (`user_id`);
CREATE INDEX `orders_index_3`
ON `orders` (`status_id`);
ALTER TABLE `users`
ADD FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `products`
ADD FOREIGN KEY(`type_product`) REFERENCES `type_products`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `products`
ADD FOREIGN KEY(`type_gender_shoes`) REFERENCES `gender_shoes`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `orders`
ADD FOREIGN KEY(`product_id`) REFERENCES `products`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `orders`
ADD FOREIGN KEY(`point`) REFERENCES `points`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `orders`
ADD FOREIGN KEY(`user_id`) REFERENCES `users`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `orders`
ADD FOREIGN KEY(`status_id`) REFERENCES `statuses`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `products`
ADD FOREIGN KEY(`manufacturer`) REFERENCES `manufacturers`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `products`
ADD FOREIGN KEY(`supplier`) REFERENCES `suppliers`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `products`
ADD FOREIGN KEY(`unit`) REFERENCES `units`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;