CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(50),
    `last_name` VARCHAR(50),
    `username` VARCHAR(50),
    `password` VARCHAR(128),
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(50),
    `type` ENUM('Primary', 'Secondary', 'Higher Education'),
    `location` VARCHAR(50),
    `year` YEAR,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(50),
    `industry` ENUM('Technology', 'Education', 'Business'),
    `location` VARCHAR(50),
    PRIMARY KEY(`id`)
);

CREATE TABLE `user_connections` (
    `user_id` INT UNSIGNED,
    `connection_id` INT UNSIGNED,
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`connection_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `school_connections` (
    `user_id` INT UNSIGNED,
    `school_id` INT UNSIGNED,
    `start_date` DATE,
    `end_date` DATE,
    `degree` VARCHAR(50),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `company_connections` (
    `user_id` INT UNSIGNED,
    `company_id` INT UNSIGNED,
    `start_date` DATE,
    `end_date` DATE,
    `title` VARCHAR(50),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
