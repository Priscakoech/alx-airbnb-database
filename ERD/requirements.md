**ENTITIES AND ATTRIBUTES**
**User**
user_id (PK)

first_name

last_name

email (UNIQUE, Indexed)

password_hash

phone_number (nullable)

role (ENUM: guest, host, admin)

created_at

**Property**
property_id (PK)

host_id (FK → User.user_id)

name

description

location

price_per_night

created_at

updated_at

**Booking**

booking_id (PK)

property_id (FK → Property.property_id)

user_id (FK → User.user_id)

start_date

end_date

total_price

status (ENUM: pending, confirmed, canceled)

created_at

**Payment**
payment_id (PK)

booking_id (FK → Booking.booking_id)

amount

payment_date

payment_method (ENUM: credit_card, paypal, stripe)

**Review**
review_id (PK)

property_id (FK → Property.property_id)

user_id (FK → User.user_id)

rating (1 to 5)

comment

created_at

**Message**
message_id (PK)

sender_id (FK → User.user_id)

recipient_id (FK → User.user_id)

message_body

sent_at

 2. Relationships
Relationship	Type	Description
User ↔ Property	1 → Many	A host (User) can own many Properties
User ↔ Booking	1 → Many	A guest (User) can make many Bookings
Property ↔ Booking	1 → Many	A Property can have many Bookings
Booking ↔ Payment	1 → 1	Each Booking has one Payment
Property ↔ Review	1 → Many	A Property can have many Reviews
User ↔ Review	1 → Many	A User can write many Reviews
User ↔ Message	1 → Many (Sender), 1 → Many (Recipient)	Users can message each other

