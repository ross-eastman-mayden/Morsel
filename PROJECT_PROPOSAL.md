#Proposal for Morsel architecture: 
##Front end - Jscripty, pokes json at api. Tech to be decided.
###Design concept:
	* Simple website which allows users to book tables for a date/time within a range of available times
	    To book a table a person will need to provide the following information:
	        > the date and time of the booking
	        > the number of people who will be seated and eating (exc highchairs, wheelchairs)
	        > additional guests and requirements e.g. small children in highchairs, wheelchairs,
	          mobility issues that would stop someone from being able to get to certain tables
	        > customer/booking name
	        > contact number
	        > dietary requirements of party e.g. checkboxes, tick any that apply to the group
	* Should also contain key details of restaurant
	        > the restaurant's name
	        > the address and postcode of the restaurant
	        > a telephone number
	        > an email address
	        > the manager's name (optional)
	        > the head chef's name (optional)
	        > the maximum number of covers (people that can be seated at once)
	        > the number of tables in the restaurant and the number of seats at each table
	* Should allow restaurant to edit key info
	* Should be available to all modern platforms (phone, tablet, desktop)  

##Back end - php->mysql for data storage. Slim as proposed framework (great simple routing etc)
###Design concept:
	* Should accept secured api requests from front end website
	* Should CRUD bookings
	* Should handle validation and return success status
	* Should handle emailing customers upon accept/reject bookings from service
	
##Service layer - Js/ some other visual library (electron??)+ calendar + booking/contact sheet.
Available on desktop and tablet (possibly phone?) 
###Design concept:
	* Should allow restaurants to accept/reject potential bookings
	    > booking status of seen, accepted, rejected, under review (for when its taking some time to 
	      decide if the party can be accommodated)
	    > status last updated date
	    > status updated by user
    * Should allow the restaurant to create available times
	* Should show visual representation of bookings... different calendar views
	* Should allow other app control, such as "restaurant closed for x days",
	  "auto accept bookings", "multiple covers per shift"
