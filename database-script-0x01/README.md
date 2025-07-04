
# Airbnb-Style Database Schema

This schema defines the relational database for an Airbnb-style application. It includes tables for users, properties, bookings, payments, reviews, and messages.

## Tables and Relationships

### 1. User
Stores user account data.

- `user_id`: Primary Key (UUID)
- `role`: ENUM ('guest', 'host', 'admin')
- Unique index on `email`

### 2. Property
Each property belongs to a host.

- `property_id`: Primary Key
- `host_id`: Foreign Key → User(user_id)
- `pricepernight`: DECIMAL

### 3. Booking
Links users to property bookings.

- `booking_id`: Primary Key
- `property_id`: Foreign Key
- `user_id`: Foreign Key
- `status`: ENUM ('pending', 'confirmed', 'canceled')
- Indexes on `property_id`, `user_id`

### 4. Payment
Tracks payments for bookings.

- `payment_id`: Primary Key
- `booking_id`: Foreign Key
- `payment_method`: ENUM ('credit_card', 'paypal', 'stripe')

### 5. Review
User reviews for properties.

- `review_id`: Primary Key
- `property_id`, `user_id`: Foreign Keys
- `rating`: INTEGER (1–5)

### 6. Message
Private messages between users.

- `message_id`: Primary Key
- `sender_id`, `recipient_id`: Foreign Keys

## Constraints & Indexes
- All PKs and FKs are defined
- ENUMs use CHECK constraints
- Email, booking_id, and property_id are indexed
- ON DELETE CASCADE for relational integrity



