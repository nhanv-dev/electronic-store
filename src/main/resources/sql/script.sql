DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`
(
    `role_id`   varchar(10)                       NOT NULL,
    `role_name` varchar(50) CHARACTER SET utf8mb3 NOT NULL,
    PRIMARY KEY (`role_id`)
);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `user_id`       varchar(10)                        NOT NULL,
    `role_id`       varchar(10)                        NOT NULL,
    `user_username` varchar(255)                       NOT NULL,
    `user_password` varchar(255)                       NOT NULL,
    `user_name`     varchar(255) CHARACTER SET utf8mb3 NOT NULL,
    `user_phone`    varchar(255)                       NOT NULL,
    `user_email`    varchar(255)                       NOT NULL,
    `user_address`  varchar(255) CHARACTER SET utf8mb3 NOT NULL,
    `createdAt`     timestamp DEFAULT current_timestamp,
    `modifiedAt`    timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`     timestamp                          NULL,
    `public_key`    blob,
    `private_key`   blob,
    PRIMARY KEY (`user_id`, `user_username`),
    KEY `role_id` (`role_id`),
    CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`)
);

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`
(
    `category_id`   varchar(10)                        NOT NULL,
    `category_name` varchar(255) CHARACTER SET utf8mb3 NOT NULL,
    `createdAt`     timestamp DEFAULT current_timestamp,
    `modifiedAt`    timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`     timestamp                          NULL,
    `category_slug` varchar(255)                       NOT NULL,
    PRIMARY KEY (`category_id`, `category_name`)
);

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`
(
    `inventory_id` varchar(10) NOT NULL,
    `quantity`     int         NOT NULL,
    `createdAt`    timestamp DEFAULT current_timestamp,
    `modifiedAt`   timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`    timestamp   NULL,
    PRIMARY KEY (`inventory_id`)
);

DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount`
(
    `discount_id`      varchar(10)  NOT NULL,
    `discount_desc`    varchar(255) NOT NULL,
    `discount_percent` float        NOT NULL,
    `discount_active`  tinyint(1)   NOT NULL              DEFAULT '1',
    `discount_name`    varchar(255) CHARACTER SET utf8mb3 DEFAULT 'Sự kiện giảm giá',
    `createdAt`        timestamp                          DEFAULT current_timestamp,
    `modifiedAt`       timestamp                          DEFAULT current_timestamp,
    `deletedAt`        timestamp    null,
    PRIMARY KEY (`discount_id`)
);

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`
(
    `product_id`    varchar(10)                        NOT NULL,
    `product_name`  varchar(255) CHARACTER SET utf8mb3 NOT NULL,
    `product_desc`  text CHARACTER SET utf8mb3         NOT NULL,
    `product_price` decimal(16, 2)                     NOT NULL,
    `category_id`   varchar(10)                        NOT NULL,
    `inventory_id`  varchar(10)                        NOT NULL,
    `discount_id`   varchar(10) DEFAULT NULL,
    `createdAt`     timestamp   DEFAULT current_timestamp,
    `modifiedAt`    timestamp   DEFAULT current_timestamp ON UPDATE current_timestamp,
    `product_sku`   varchar(20) DEFAULT NULL,
    `product_slug`  varchar(255)                       NOT NULL,
    PRIMARY KEY (`product_id`),
    KEY `category_id` (`category_id`),
    KEY `discount_id` (`discount_id`),
    KEY `inventory_id` (`inventory_id`),
    CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
    CONSTRAINT `product_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`),
    CONSTRAINT `product_ibfk_3` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`)
);

DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`
(
    `image_id`   varchar(10)  NOT NULL,
    `product_id` varchar(10) DEFAULT NULL,
    `image_url`  varchar(255) NOT NULL,
    `createdAt`  timestamp   DEFAULT current_timestamp,
    `modifiedAt` timestamp   DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`  timestamp    NULL,
    PRIMARY KEY (`image_id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
);

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`
(
    `cart_id`    varchar(10)    NOT NULL,
    `user_id`    varchar(10)    NOT NULL,
    `cart_total` decimal(10, 2) NOT NULL,
    `createdAt`  timestamp DEFAULT current_timestamp,
    `modifiedAt` timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`  timestamp      NULL,
    PRIMARY KEY (`cart_id`, `user_id`)
);

DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE `cart_item`
(
    `item_id`    varchar(10) NOT NULL,
    `cart_id`    varchar(10) NOT NULL,
    `product_id` varchar(10) NOT NULL,
    `quantity`   int         NOT NULL,
    `createdAt`  timestamp DEFAULT current_timestamp,
    `modifiedAt` timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`  timestamp   NULL,
    PRIMARY KEY (`item_id`),
    KEY `cart_id` (`cart_id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
    CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
);

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status`
(
    `id`   varchar(5) NOT NULL,
    `desc` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
    PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`
(
    `order_id`     varchar(10)    NOT NULL,
    `user_id`      varchar(10)    NOT NULL,
    `order_total`  decimal(24, 2) NOT NULL,
    `createdAt`    timestamp               DEFAULT current_timestamp,
    `modifiedAt`   timestamp               DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`    timestamp      NULL,
    `order_status` varchar(10)    NOT NULL DEFAULT 'OS01',
    PRIMARY KEY (`order_id`, `user_id`),
    KEY `orders_order_status_id_fk` (`order_status`),
    CONSTRAINT `orders_order_status_id_fk` FOREIGN KEY (`order_status`) REFERENCES `order_status` (`id`)
);

DROP TABLE IF EXISTS `orders_item`;
CREATE TABLE `orders_item`
(
    `item_id`    varchar(10) NOT NULL,
    `order_id`   varchar(10) NOT NULL,
    `product_id` varchar(10) NOT NULL,
    `quantity`   int         NOT NULL,
    `createdAt`  timestamp DEFAULT current_timestamp,
    `modifiedAt` timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`  timestamp   NULL,
    PRIMARY KEY (`item_id`),
    KEY `order_id` (`order_id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `orders_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
    CONSTRAINT `orders_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
);

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist`
(
    `wishlist_id` varchar(10) NOT NULL,
    `user_id`     varchar(10) NOT NULL,
    `createdAt`   timestamp DEFAULT current_timestamp,
    `modifiedAt`  timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`   timestamp   NULL,
    PRIMARY KEY (`wishlist_id`, `user_id`)
);

DROP TABLE IF EXISTS `wishlist_item`;
CREATE TABLE `wishlist_item`
(
    `item_id`     varchar(10) NOT NULL,
    `wishlist_id` varchar(10) NOT NULL,
    `product_id`  varchar(10) NOT NULL,
    `createdAt`   timestamp DEFAULT current_timestamp,
    `modifiedAt`  timestamp DEFAULT current_timestamp ON UPDATE current_timestamp,
    `deletedAt`   timestamp   NULL,
    PRIMARY KEY (`item_id`),
    KEY `wishlist_id` (`wishlist_id`),
    CONSTRAINT `wishlist_item_ibfk_1` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`)
);
