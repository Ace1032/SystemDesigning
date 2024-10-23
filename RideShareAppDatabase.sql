CREATE TABLE `Driver_info` (
  `driver_id` int PRIMARY KEY,
  `LastName` varchar(255),
  `FirstName` varchar(255),
  `phone_number` varchar(255),
  `vehicle_number` varchar(255),
  `vehicle_type` varchar(25),
  `license_number` varchar(20),
  `current_status` varchar(10)
);

CREATE TABLE `Rider_Info` (
  `rider_id` int PRIMARY KEY,
  `LastName` varchar(255),
  `FirstName` varchar(255),
  `phone_number` varchar(255),
  `email` varchar(20),
  `payment_preference` varchar(100)
);

CREATE TABLE `Location_Info` (
  `location_id` int PRIMARY KEY,
  `user_id` int,
  `latitude` varchar(20),
  `longitude` varchar(20),
  `timestamp` varchar(20),
  `user_type` char
);

CREATE TABLE `Trip_Info` (
  `trip_id` int PRIMARY KEY,
  `rider_id` int,
  `driver_id` int,
  `origin_latitude` varchar(20),
  `origin_longitude` varchar(20),
  `destination_latitude` varchar(20),
  `destination_longitude` varchar(20),
  `trip_status` char,
  `start_time` varchar(20),
  `end_time` varchar(20)
);

CREATE TABLE `Payment_Info` (
  `payment_id` int PRIMARY KEY,
  `trip_id` int,
  `amount` double,
  `payment_status` bool,
  `payment_method` varchar(10)
);

CREATE TABLE `Trip_Destinations` (
  `destination_id` int PRIMARY KEY,
  `trip_id` int,
  `latitude` varchar(20),
  `longitude` varchar(20),
  `sequence_order` varchar(200)
);

ALTER TABLE `Trip_Destinations` ADD FOREIGN KEY (`trip_id`) REFERENCES `Trip_Info` (`trip_id`);

ALTER TABLE `Payment_Info` ADD FOREIGN KEY (`trip_id`) REFERENCES `Trip_Info` (`trip_id`);

ALTER TABLE `Trip_Info` ADD FOREIGN KEY (`driver_id`) REFERENCES `Rider_Info` (`rider_id`);

ALTER TABLE `Trip_Info` ADD FOREIGN KEY (`driver_id`) REFERENCES `Driver_info` (`driver_id`);

ALTER TABLE `Location_Info` ADD FOREIGN KEY (`user_id`) REFERENCES `Rider_Info` (`rider_id`);

ALTER TABLE `Location_Info` ADD FOREIGN KEY (`user_id`) REFERENCES `Driver_info` (`driver_id`);
