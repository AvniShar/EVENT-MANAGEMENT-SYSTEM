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
- Relational Schema (MYSQL file for Xampp (PHPMyAdmin , VScode))


# **TOOLS USED**

- draw.io
- MYySQL
- XAMPP
- VScode

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

# 8. Category

- Category_ID(Primary key)
- Category_Name

# 9. Coupon

- Coupon_ID(Primary key)
- Code
- Discount_Amount

# 10. Attendee

- Attendee_ID(Primary key)
- Name
- Phone
- Email
- Booking_ID(Foreign key)

# 11. Event_Schedule

- Schedule_ID(Primary kry)
- Date
- Time
- Event_ID(Foreign key)

# 12. Seat
- Seat_ID(Primary key)
- Seat_type
- Seat_number
- Event_ID(Foreign key)

# **RELATIONSHIP AND CARDNINALITY**

- USER – BOOKING: (1:M)  One user can make multiple bookings.
- ORGANIZER – EVENT: (1:M) One organizer can manage multiple events.
- EVENT – VENUE: (M:1) Many events can be held at one venue.
- EVENT – BOOKING: (1:M) One event can have multiple bookings.
- BOOKING – PAYMENT: (1:1) Each booking has exactly one payment.
- EVENT – TICKET: (1:M) One event can have multiple tickets issued.
- EVENT - SEAT: (1:M) One event can have multiple seats available.
- SEAT - TICKET: (1:1) Each seat is assigned to exactly one ticket, and each ticket corresponds to one seat.
- BOOKING - ATTENDEE: (1:M) One booking can include multiple attendees.
- EVENT - EVENT_SCHEDULE: (1:M) One event can have multiple schedules (different dates and times).
- CATEGORY - EVENT: (1:M) One category can include multiple even
- COUPING - BOOKING: (1:M) One category can include multiple even


# **Tables Created in Database**

- USERS: Stores user details such as name, email, phone, password, and address.
- ORGANIZER: Stores organizer information including contact details.
- VENUE: Stores venue details such as venue name, location, and capacity.
- EVENT: Stores event information including date, time, category, price, organizer, and venue.
- BOOKING: Stores booking details made by users for events.
- PAYMENT: Stores payment information corresponding to each booking.
- TICKET: Stores ticket details generated for bookings.
- CATEGORY: Stores different event categories such as music, tech, sports, etc.
- COUPON: Stores discount coupon details including code, discount amount, and expiry date.
- ATTENDEE: Stores details of individuals attending an event under a booking.
- SEAT: Stores seat information for events including seat number and seat type.
- BOOKING_TICKET: A relationship table that links bookings and tickets, representing a many-to-many relationship.
- EVENT_ORGANIZER: A relationship table that connects events and organizers, allowing multiple organizers for an event.
- USER_EVENT: A relationship table that represents user interest in events (wishlist or interaction), supporting a many-to-many relationship.

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

- CATEGORY

- COUPON

- SEAT

- ATTENDEE

- EVENT_SCHEDULE

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

- BOOKING — PAYMENT(Payment is compulsory)
  
  Booking->Total
  
  Payment->Total

- EVENT — TICKET
  
  Event->Partial
  
  Ticket->Total

  - EVENT - SEAT

    Event->Partial
    Seat->Total

  - SEAT - TICKET

    Seat-> Partial
    
    Ticket-> Total

  - Booking - Attendee
 
    Booking-> Partial
    
    Attendee-> Total

  - Event - Event_Schedule
   
    Event-> Partisl
    
    Event_Schedule-> Total

- Category - Event
   Category -> Partia
  Event -> Total

- Coupon - Bookings
  Coupon->Partia
  Bookings->Total
    

    

  
  


