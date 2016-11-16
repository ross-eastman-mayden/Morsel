#Proposal for Morsel architecture: 
##Front end - Jscripty, pokes json at api. Tech to be decided.
###Design concept:
	* Simple website which allows users to book tables@times
	* Should also contain key details of restaurant
	* Should allow restaurant to edit key info
	* Should be availble to all modern platforms (phone, tablet, desktop)  

##Back end - php->mysql for datastore. Slim as proposed framework (great simple routing etc)
###Design concept:
	* Should accept secured api requests from front end website
	* Should CRUD bookings
	* Should handle validation and return success status
	* Should handle emailing customers apon accept/reject bookings from service
	
##Service layer - Js/ someother visal library (electron??)+ calendar + booking/contact sheet.
Available on desktop and tablet (possibly phone?) 
###Design concept:
	* Should allow restraunts to accept/reject potential bookings
	* Should show visual representation of bookings... different calendar views
	* Should allow other app control, such as "Out of office", "auto accept", "available time slots" etc.
