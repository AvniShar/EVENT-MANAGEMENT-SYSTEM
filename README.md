# **EVENT-MANAGEMENT-SYSTEM** 

Database Design for Event Management System

# **TEAM MEMBERS**

Garv Rajpoot - 2410030437
Avni Sharma  - 2410030421
Shourya Singh - 2410030219
Siddhi Asthana - 2410030387

# **DESCRIPTION** 

Database design for an Event Management System using MySQL and ER modeling

# **ABSTRACT**

The Event Management System is a web based application designed to manage events, users, organizers, venues, bookings, payments, and tickets efficiently. It allows administrators to create and manage events, handle registrations, and maintain participant records efficiently. Users can view event details and register through a user friendly interface. The system stores all data in a structured database, reducing manual work, minimizing errors, and improving overall event coordination in colleges and organizations.

# **CONTENT**

- ER Diagram(PDF)
- Relational Schema (MYSQL file for Xampp (PHPMyAdmin))


# **TOOLS USED**

- draw.io
- MYySQL
- XAMPP

# **ENTITIES AND ATTRIBUTES USED**

# 1. User

- User_ID (Primary key)
- Name
- Email
- Phone
- Password
- Address

# 2. Organizer

- Organizer_ID(Primary key)
- Name
- Email
- Phone

# 3. Venue

- Venue_ID(Primary key)
- Venue_Name
- Location
- Capacity

# 4. Event

- Event_ID(Primary key)
- Event_Name
- Date
- Time
- Category
- Price
- Organizer_ID(Foreign key)
- Venue_ID(Foreign key)

# 5. Booking

- Bookin_ID(Primary Key)
- Booking_Date
- No_Of_Tickets
- Total_Amount
- User_ID(Foreign key)
- Event_ID(Foreign Key)

# 6. Payment

- Payment_Id(Primary key)
- Payment_Date
- Amount
- Payment_Mode
- Booking ID( FK UNIQUE)

# 7. Ticket

- Ticket_ID(Primary key
-  Seat_Number
-  Ticket_Type
-  Price
-  Issue_Date

# **RELATIONSHIP AND CARDNINALITY**

- USER – BOOKING: One user can make multiple bookings.
- ORGANIZER – EVENT: One organizer can manage multiple events.
- VENUE – EVENT: One venue can host multiple events.
- EVENT – BOOKING: One event can have multiple bookings.
- BOOKING – PAYMENT: Each booking has exactly one payment.
- BOOKING – TICKET: One booking can generate multiple tickets.
- EVENT – TICKET: One event can have multiple tickets issued.

# **Tables Created in Database**

- USERS: Stores user details such as name, email, phone, password, and address.
- ORGANIZER: Stores organizer information including contact details.
- VENUE: Stores venue details such as venue name, location, and capacity.
- EVENT: Stores event information including date, time, category, price, organizer, and venue.
- BOOKING: Stores booking details made by users for events.
- PAYMENT: Stores payment information corresponding to each booking.
- TICKET: Stores ticket details generated for bookings.








