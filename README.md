## CGI Internship assignment

##### Used Technologies & Tools:

* Java 8

* Spring Boot 2.4.2 (parent)

* H2 File Database

* Thymeleaf

* HTML5/ CSS/ Bootstrap 4 / Javascript/ Jquery

### Installation:

Clone repository: `https://github.com/ilja115610/CGI-DentistApp.git`

Install: `mvn clean install`

### General workflow:


User gets to registration form at "/" endpoint. Dentist names are predefined at backend.
Appointment date selection is limited by current date and time selection is limited from 08:00 till 17:00.
All inputs on the form have validation. In case of desired date/time collision with existing date/time in database user won't be able to register
and related message will appear.

##

User can navigate to application parts using navbar in the page header. Also, current position is highlighted.
On the all-registrations view user can see all appointments saved in DB, sorted by Date (the earliest first).
At the same page user can update or delete record - sending AJAX requests to server and updating table dynamically.

##

User can navigate to a record detail view by clicking on a record in the table.
