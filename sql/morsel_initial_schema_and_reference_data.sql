# Dump of table diets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `diets`;

CREATE TABLE `diets` (
  `dietary_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `diet` varchar(28) DEFAULT NULL COMMENT 'Special diet options',
  PRIMARY KEY (`dietary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='A reference table of special diet options';

INSERT INTO `diets` (`dietary_id`, `diet`)
VALUES
	(1,'Allergies'),
	(2,'Dairy Free'),
	(3,'Gluten Free'),
	(4,'Halal'),
	(5,'Other'),
	(6,'Vegan'),
	(7,'Vegetarian');


# Dump of table status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `status_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(28) DEFAULT NULL COMMENT 'Status options',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Reference table of status options for a booking';

INSERT INTO `status` (`status_id`, `status`)
VALUES
	(1,'New booking'),
	(2,'Seen'),
	(3,'Under review'),
	(4,'Accepted'),
	(5,'Rejected'),
	(6,'Cancelled (Deleted)'),
	(7,'Rescheduled'),
	(8,'Finished (historic)');


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(28) NOT NULL DEFAULT '',
  `firstname` varchar(100) NOT NULL DEFAULT '',
  `lastname` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `salt` varchar(100) NOT NULL DEFAULT '',
  `live` tinyint(1) unsigned DEFAULT NULL COMMENT '1 = current user, 0 = deleted user',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Users of the Morsel system';	


# Dump of table restaurants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `restaurants`;

CREATE TABLE `restaurants` (
  `restaurant_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the restaurant',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT 'The restaurant''s address',
  `postcode` varchar(8) NOT NULL DEFAULT '' COMMENT 'The postcode of the restaurant',
  `telephone` varchar(12) NOT NULL DEFAULT '' COMMENT 'The main contact number for the restaurant',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT 'Restaurant''s main email address for booking enquiries',
  `manager_name` varchar(100) DEFAULT NULL COMMENT 'Current restaurant manager',
  `head_chef` varchar(100) DEFAULT NULL COMMENT 'Current head chef',
  `maximum_covers` int(4) DEFAULT NULL COMMENT 'Maximum number of people who can seated in the restaurant',
  `date_opened` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date the restaurant opened',
  PRIMARY KEY (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Key information about the restaurants';


# Dump of table tables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tables`;

CREATE TABLE `tables` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL COMMENT 'FK reference to restaurant',
  `no_of_seats` int(2) NOT NULL DEFAULT '1' COMMENT 'number of seats usually at the table',
  `space_for_highchair` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = yes, space for highchair, 0 = no',
  `space_for_wheelchair` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = yes, space for wheelchair, 0 = no',
  `seats_taken_by_highchair` int(2) DEFAULT NULL COMMENT 'If there is a highchair at the table, how many seat spaces will it replace',
  `seats_taken_by_wheelchair` int(2) DEFAULT NULL COMMENT 'If there is a wheelchair at the table, how many seat spaces does it replace',
  `mobility_restrictions` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = Yes, the table is hard to access for someone with mobility issues, 0 = no, accessible to all',
  PRIMARY KEY (`table_id`,`restaurant_id`),
  KEY `fk_restaurant_id` (`restaurant_id`),
  CONSTRAINT `fk_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Properties of the tables within a restaurant.';


# Dump of table bookings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL COMMENT 'FK reference to restaurants',
  `customer_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'Name provided by customer',
  `contact_number` varchar(12) NOT NULL DEFAULT '' COMMENT 'Contact number provided by customer',
  `date_table_required` date NOT NULL COMMENT 'Reservation date',
  `time_table_required` time NOT NULL COMMENT 'Reservation time',
  `no_of_seated_guests` int(2) NOT NULL COMMENT 'Number of people who need a seat',
  `no_of_highchairs` int(1) DEFAULT NULL COMMENT 'Number of children in highchairs',
  `no_of_wheelchairs` int(1) DEFAULT NULL COMMENT 'Number of customers in wheelchairs',
  `party_dietary_requirements` tinyint(1) DEFAULT '0' COMMENT '1 = yes (see dietary_requirements table for details), 0 = no',
  `date_of_booking` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date booked, for audit purposes',
  `customer_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date booking updated, for audit purposes',
  `status_id` int(11) NOT NULL COMMENT 'FK reference to status (Accepted, Rejected etc)',
  `status_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date booking accepted/rejected etc, for audit purposes',
  `status_updated_by` int(11) NOT NULL COMMENT 'FK reference to user',
  `live` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = current reservation, 0 = deleted reservation',
  PRIMARY KEY (`booking_id`),
  KEY `FK_restaurant` (`restaurant_id`),
  CONSTRAINT `FK_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table for information about a customer?s booking. Only stores current state of booking.';


# Dump of table dietary_requirements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dietary_requirements`;

CREATE TABLE `dietary_requirements` (
  `requirement_id` int(11) NOT NULL DEFAULT '0',
  `booking_id` int(11) NOT NULL COMMENT 'FK reference to the booking',
  `restaurant_id` int(11) NOT NULL COMMENT 'FK reference to the restaurant',
  `dietary_id` int(11) NOT NULL COMMENT 'FK reference to the diets table',
  PRIMARY KEY (`requirement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='A table of dietary requirements for parties with a booking.\nThis information is collected so the restaurant can be prepared for these guests, whether that is for ordering, food prep etc.';