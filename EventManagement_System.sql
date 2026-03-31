-- Disable FK checks
SET FOREIGN_KEY_CHECKS=0;

-- Reset DB
DROP DATABASE IF EXISTS eventmanagement;
CREATE DATABASE eventmanagement;
USE eventmanagement;

-- ================= TABLES =================

CREATE TABLE users (
  User_ID INT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL UNIQUE,
  Phone VARCHAR(15),
  Password VARCHAR(100) NOT NULL,
  Address VARCHAR(255)
);

CREATE TABLE venue (
  Venue_ID INT PRIMARY KEY,
  Venue_Name VARCHAR(100) NOT NULL,
  Location VARCHAR(150),
  Capacity INT
);

CREATE TABLE category (
  Category_ID INT PRIMARY KEY,
  Category_Name VARCHAR(100),
  Description VARCHAR(255)
);

CREATE TABLE organizer (
  Organizer_ID INT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Email VARCHAR(100) UNIQUE,
  Phone VARCHAR(15)
);

CREATE TABLE coupon (
  Coupon_ID INT PRIMARY KEY,
  Code VARCHAR(50),
  Discount_Amount DECIMAL(10,2),
  Expiry_Date DATE
);

CREATE TABLE event (
  Event_ID INT PRIMARY KEY,
  Event_Name VARCHAR(100),
  Date DATE,
  Time TIME,
  Price DECIMAL(10,2),
  Venue_ID INT,
  Category_ID INT,
  FOREIGN KEY (Venue_ID) REFERENCES venue(Venue_ID),
  FOREIGN KEY (Category_ID) REFERENCES category(Category_ID)
);

CREATE TABLE booking (
  Booking_ID INT PRIMARY KEY,
  Booking_Date DATE,
  Total_Amount DECIMAL(10,2),
  User_ID INT,
  Event_ID INT,
  Coupon_ID INT,
  FOREIGN KEY (User_ID) REFERENCES users(User_ID) ON DELETE CASCADE,
  FOREIGN KEY (Event_ID) REFERENCES event(Event_ID) ON DELETE CASCADE,
  FOREIGN KEY (Coupon_ID) REFERENCES coupon(Coupon_ID)
);

CREATE TABLE attendee (
  Attendee_ID INT PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(100),
  Phone VARCHAR(15),
  Booking_ID INT,
  FOREIGN KEY (Booking_ID) REFERENCES booking(Booking_ID) ON DELETE CASCADE
);

CREATE TABLE payment (
  Payment_ID INT PRIMARY KEY,
  Payment_Date DATE,
  Amount DECIMAL(10,2),
  Payment_Mode VARCHAR(50),
  Booking_ID INT UNIQUE,
  FOREIGN KEY (Booking_ID) REFERENCES booking(Booking_ID) ON DELETE CASCADE
);

CREATE TABLE event_schedule (
  Schedule_ID INT PRIMARY KEY,
  Date DATE,
  Time TIME,
  Event_ID INT,
  FOREIGN KEY (Event_ID) REFERENCES event(Event_ID) ON DELETE CASCADE
);

CREATE TABLE seat (
  Seat_ID INT PRIMARY KEY,
  Seat_Number VARCHAR(10),
  Seat_Type VARCHAR(50),
  Event_ID INT,
  FOREIGN KEY (Event_ID) REFERENCES event(Event_ID) ON DELETE CASCADE
);

CREATE TABLE ticket (
  Ticket_ID INT PRIMARY KEY,
  Seat_Number VARCHAR(10),
  Ticket_Type VARCHAR(50),
  Price DECIMAL(10,2),
  Issue_Date DATE,
  Ticket_Status VARCHAR(50),
  Event_ID INT,
  Seat_ID INT,
  FOREIGN KEY (Event_ID) REFERENCES event(Event_ID) ON DELETE CASCADE,
  FOREIGN KEY (Seat_ID) REFERENCES seat(Seat_ID) ON DELETE CASCADE
);

CREATE TABLE booking_ticket (
  Booking_ID INT,
  Ticket_ID INT,
  PRIMARY KEY (Booking_ID, Ticket_ID),
  FOREIGN KEY (Booking_ID) REFERENCES booking(Booking_ID) ON DELETE CASCADE,
  FOREIGN KEY (Ticket_ID) REFERENCES ticket(Ticket_ID) ON DELETE CASCADE
);

CREATE TABLE event_organizer (
  Event_ID INT,
  Organizer_ID INT,
  PRIMARY KEY (Event_ID, Organizer_ID),
  FOREIGN KEY (Event_ID) REFERENCES event(Event_ID) ON DELETE CASCADE,
  FOREIGN KEY (Organizer_ID) REFERENCES organizer(Organizer_ID) ON DELETE CASCADE
);

CREATE TABLE user_event (
  User_ID INT,
  Event_ID INT,
  PRIMARY KEY (User_ID, Event_ID),
  FOREIGN KEY (User_ID) REFERENCES users(User_ID) ON DELETE CASCADE,
  FOREIGN KEY (Event_ID) REFERENCES event(Event_ID) ON DELETE CASCADE
);

-- ================= DATA =================

-- ================= USERS =================
INSERT INTO users VALUES
(1, 'Alice Johnson', 'alice@example.com', '1234567890', 'pass123', '123 Maple St'),
(2, 'Bob Smith', 'bob@example.com', '2345678901', 'pass456', '456 Oak Ave'),
(3, 'Charlie Brown', 'charlie@example.com', '3456789012', 'pass789', '789 Pine Rd'),
(4, 'Diana Prince', 'diana@example.com', '4567890123', 'pass012', '101 Wonder Ln'),
(5, 'Ethan Hunt', 'ethan@example.com', '5678901234', 'pass345', '202 Mission Dr');

-- ================= VENUE =================
INSERT INTO venue VALUES
(1, 'Grand Ballroom', 'Downtown', 500),
(2, 'Tech Hub', 'Silicon Valley', 200),
(3, 'Sunset Stadium', 'Beachside', 5000),
(4, 'City Library', 'Midtown', 100),
(5, 'Sky Lounge', 'Rooftop', 50);

-- ================= CATEGORY =================
INSERT INTO category VALUES
(1, 'Music', 'Concerts and festivals'),
(2, 'Tech', 'Conferences and workshops'),
(3, 'Sports', 'Games and matches'),
(4, 'Education', 'Seminars and lectures'),
(5, 'Social', 'Parties and networking');

-- ================= ORGANIZER =================
INSERT INTO organizer VALUES
(1, 'Global Events Co', 'contact@global.com', '9998887771'),
(2, 'Tech Connect', 'info@techconnect.com', '9998887772'),
(3, 'Sporty Life', 'play@sportylife.com', '9998887773'),
(4, 'EduPlan', 'learn@eduplan.com', '9998887774'),
(5, 'Party Pro', 'party@pro.com', '9998887775');

-- ================= COUPON =================
INSERT INTO coupon VALUES
(1, 'WELCOME10', 10.00, '2026-12-31'),
(2, 'TECH20', 20.00, '2026-06-30'),
(3, 'SUMMER50', 50.00, '2026-08-15'),
(4, 'EARLYBIRD', 15.00, '2026-04-01'),
(5, 'FREEOFF', 100.00, '2026-05-20');

-- ================= EVENT =================
INSERT INTO event (Event_ID, Event_Name, Date, Time, Price, Venue_ID, Category_ID) VALUES
(1, 'Rock Night', '2026-05-10', '19:00:00', 50.00, 1, 1),
(2, 'AI Summit', '2026-06-15', '09:00:00', 150.00, 2, 2),
(3, 'Charity Run', '2026-07-20', '07:00:00', 20.00, 3, 3),
(4, 'History Talk', '2026-08-05', '14:00:00', 10.00, 4, 4),
(5, 'Summer Mixer', '2026-09-12', '20:00:00', 30.00, 5, 5);

-- ================= EVENT SCHEDULE =================
INSERT INTO event_schedule (Schedule_ID, Date, Time, Event_ID) VALUES
(1, '2026-05-10', '19:00:00', 1),
(2, '2026-06-15', '09:00:00', 2),
(3, '2026-07-20', '07:00:00', 3),
(4, '2026-08-05', '14:00:00', 4),
(5, '2026-09-12', '20:00:00', 5);

-- ================= SEAT =================
INSERT INTO seat (Seat_ID, Seat_Number, Seat_Type, Event_ID) VALUES
(1, 'A1', 'VIP', 1),
(2, 'B10', 'Standard', 2),
(3, 'C5', 'Economy', 3),
(4, 'D1', 'VIP', 4),
(5, 'E15', 'Standard', 5);

-- ================= EVENT ORGANIZER =================
INSERT INTO event_organizer (Event_ID, Organizer_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- ================= USER EVENT =================
INSERT INTO user_event (User_ID, Event_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- ================= BOOKING =================
INSERT INTO booking (Booking_ID, Booking_Date, Total_Amount, User_ID, Event_ID, Coupon_ID) VALUES
(1, '2026-03-29', 40.00, 1, 1, 1),
(2, '2026-03-29', 130.00, 2, 2, 2),
(3, '2026-03-29', 20.00, 3, 3, NULL),
(4, '2026-03-29', 10.00, 4, 4, NULL),
(5, '2026-03-29', 15.00, 5, 5, 4);

-- ================= PAYMENT =================
INSERT INTO payment (Payment_ID, Payment_Date, Amount, Payment_Mode, Booking_ID) VALUES
(1, '2026-03-29', 40.00, 'Credit Card', 1),
(2, '2026-03-29', 130.00, 'PayPal', 2),
(3, '2026-03-29', 20.00, 'Debit Card', 3),
(4, '2026-03-29', 10.00, 'Cash', 4),
(5, '2026-03-29', 15.00, 'Credit Card', 5);

-- ================= ATTENDEE =================
INSERT INTO attendee (Attendee_ID, Name, Email, Phone, Booking_ID) VALUES
(1, 'Alice Johnson', 'alice@example.com', '1234567890', 1),
(2, 'Bob Smith', 'bob@example.com', '2345678901', 2),
(3, 'Charlie Brown', 'charlie@example.com', '3456789012', 3),
(4, 'Diana Prince', 'diana@example.com', '4567890123', 4),
(5, 'Ethan Hunt', 'ethan@example.com', '5678901234', 5);

-- ================= TICKET =================
INSERT INTO ticket (Ticket_ID, Seat_Number, Ticket_Type, Price, Issue_Date, Ticket_Status, Event_ID, Seat_ID) VALUES
(1, 'A1', 'VIP', 50.00, '2026-03-29', 'Confirmed', 1, 1),
(2, 'B10', 'Standard', 150.00, '2026-03-29', 'Confirmed', 2, 2),
(3, 'C5', 'Economy', 20.00, '2026-03-29', 'Confirmed', 3, 3),
(4, 'D1', 'VIP', 10.00, '2026-03-29', 'Confirmed', 4, 4),
(5, 'E15', 'Standard', 30.00, '2026-03-29', 'Confirmed', 5, 5);

-- ================= BOOKING-TICKET =================
INSERT INTO booking_ticket (Booking_ID, Ticket_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- (rest of inserts same as your file — already valid)

-- Enable FK
SET FOREIGN_KEY_CHECKS=1;

-- ================= QUERIES =================

/*1. Show all events*/

SELECT * FROM event;

/*2. Show all users who booked events*/

SELECT DISTINCT User_ID 
FROM booking;

/*3. Find events with price greater than 30*/

SELECT Event_Name, Price 
FROM event
WHERE Price > 30;

/*4. Count total bookings*/

SELECT COUNT(*) AS Total_Bookings 
FROM booking;

/*5. Total revenue generated*/

SELECT SUM(Total_Amount) AS Total_Revenue 
FROM booking;

/*6. Find number of attendees per booking*/

SELECT Booking_ID, COUNT(*) AS Attendee_Count
FROM attendee
GROUP BY Booking_ID;

/*7. Show user bookings with event names*/

SELECT b.Booking_ID, b.User_ID, e.Event_Name
FROM booking b
JOIN event e ON b.Event_ID = e.Event_ID;

/*8. Show payment details with booking info*/

SELECT p.Payment_ID, p.Amount, p.Payment_Mode, b.Booking_ID
FROM payment p
JOIN booking b ON p.Booking_ID = b.Booking_ID;

/*9. Show tickets with event and seat details*/

SELECT t.Ticket_ID, t.Ticket_Type, t.Price, e.Event_Name, s.Seat_Number
FROM ticket t
JOIN event e ON t.Event_ID = e.Event_ID
JOIN seat s ON t.Seat_ID = s.Seat_ID;

/*10. Show full booking details (User + Event + Payment)*/

SELECT b.Booking_ID, b.User_ID, e.Event_Name, p.Amount, p.Payment_Mode
FROM booking b
JOIN event e ON b.Event_ID = e.Event_ID
JOIN payment p ON b.Booking_ID = p.Booking_ID;

/*11. Find most expensive event booked*/

SELECT e.Event_Name, MAX(b.Total_Amount) AS Max_Amount
FROM booking b
JOIN event e ON b.Event_ID = e.Event_ID;
