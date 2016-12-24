# Dump of table bookings
# ------------------------------------------------------------
INSERT INTO `bookings` (`booking_id`, `restaurant_id`, `customer_name`, `contact_number`, `date_table_required`, `time_table_required`, `no_of_seated_guests`, `no_of_highchairs`, `no_of_wheelchairs`, `party_dietary_requirements`, `date_of_booking`, `customer_updated_date`, `status_id`, `status_updated_date`, `status_updated_by`, `live`)
VALUES
	(1,1,'Cus Tom Er','09876 543210','2017-03-31','20:00:00',4,0,0,1,'2016-12-24 09:22:30','2016-12-24 09:35:42',1,'2016-12-24 09:35:42',0,1);

# Dump of table dietary_requirements
# ------------------------------------------------------------
INSERT INTO `dietary_requirements` (`requirement_id`, `booking_id`, `restaurant_id`, `dietary_id`)
VALUES
	(1,1,1,1),
	(2,1,1,3);

# Dump of table restaurants
# ------------------------------------------------------------
INSERT INTO `restaurants` (`restaurant_id`, `name`, `address`, `postcode`, `telephone`, `email`, `manager_name`, `head_chef`, `maximum_covers`, `date_opened`)
VALUES
	(1,'The Seafood Restaurant','1 The Street, Townsville','PL10 1AB','01234 678901','example@test.com','Mr Exam Ple','Mr E Xample',32,'2015-06-24 12:00:00');

# Dump of table tables
# ------------------------------------------------------------
INSERT INTO `tables` (`table_id`, `restaurant_id`, `no_of_seats`, `space_for_highchair`, `space_for_wheelchair`, `seats_taken_by_highchair`, `seats_taken_by_wheelchair`, `mobility_restrictions`)
VALUES
	(1,1,4,0,0,NULL,NULL,0),
	(2,1,4,1,1,1,2,0),
	(3,1,2,0,0,NULL,NULL,0),
	(4,1,2,0,0,NULL,NULL,0),
	(5,1,2,0,0,NULL,NULL,0),
	(6,1,2,0,0,NULL,NULL,0),
	(7,1,2,0,0,NULL,NULL,0),
	(8,1,4,0,0,NULL,NULL,0),
	(9,1,4,1,1,1,1,0),
	(10,1,6,1,1,1,2,1);

# Dump of table users
# ------------------------------------------------------------
INSERT INTO `users` (`user_id`, `username`, `firstname`, `lastname`, `password`, `salt`, `live`)
VALUES
	(1,'example','Ex','Ample','hashedexample','hash',1);