# **EVENT-MANAGEMENT-SYSTEM** 

Database Design for Event Management System

# **TEAM MEMBERS**

Garv Rajpoot - 2410030437

Avni Sharma  - 2410030421

Shourya Singh - 2410030219

Siddhi Asthana - 2410030387

# **Problem Statement** 

Database design for an Event Management System using MySQL and ER modeling.Manual event booking systems are inefficient, error-prone, and difficult to manage. There is a need for a centralized database system to efficiently handle event scheduling, ticket booking and payment management.

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
- Booking ID( Foreign Key)

# 7. Ticket

- Ticket_ID(Primary key)
-  Seat_Number
-  Ticket_Type
-  Price
-  Issue_Date

# **RELATIONSHIP AND CARDNINALITY**

- USER – BOOKING: (1:M)  One user can make multiple bookings.
- ORGANIZER – EVENT: (1:M) One organizer can manage multiple events.
- EVENT – VENUE: (M:1) Many events can be held at one venue.
- EVENT – BOOKING: (1:M) One event can have multiple bookings.
- BOOKING – PAYMENT: (1:1) Each booking has exactly one payment.
- EVENT – TICKET: (1:M) One event can have multiple tickets issued.

# **Tables Created in Database**

- USERS: Stores user details such as name, email, phone, password, and address.
- ORGANIZER: Stores organizer information including contact details.
- VENUE: Stores venue details such as venue name, location, and capacity.
- EVENT: Stores event information including date, time, category, price, organizer, and venue.
- BOOKING: Stores booking details made by users for events.
- PAYMENT: Stores payment information corresponding to each booking.
- TICKET: Stores ticket details generated for bookings.

# **Strong Entity** 

A strong entity is an entity that has its own primary key and can be uniquely identified independently of other entities.
In this Event Booking System, the following are strong entities:
- USER

- EVENT

- VENUE

- ORGANIZER

- BOOKING

- PAYMENT

- TICKET

# **Weak Entity**

A weak entity is an entity that does not have a primary key of its own and depends on a strong entity for identification

In this project, there are no weak entities because all entities have their own primary keys and can be uniquely identifed.

# **Participation**

- USER — BOOKING
  User-> Partial
  Booking-> Total
  
- EVENT — BOOKING
  Event->Partial
  Booking->Total

- ORGANIZER — EVENT
  Organizer->Partial
  Event->Total

- VENUE — EVENT
  Venue->Partial
  Event->Total

- BOOKING — PAYMENT
  Booking->Total
  Payment->Total

- EVENT — TICKET
  Event->Partial
  Ticket->Total

  
  


