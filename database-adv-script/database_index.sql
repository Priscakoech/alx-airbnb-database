--  USER TABLE
-- Index on email for quick lookups
CREATE INDEX idx_user_email ON User(email);

-- Index on role to optimize filtering by user roles
CREATE INDEX idx_user_role ON User(role);

-- 📌 PROPERTY TABLE
-- Index on host_id to speed up joins with User
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Index on location to optimize search/filtering
CREATE INDEX idx_property_location ON Property(location);

-- 📌 BOOKING TABLE
-- Index on user_id to speed up joins with User
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index on property_id to optimize joins with Property
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index on start_date for date-based queries and partitioning
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- 📌 REVIEW TABLE (optional for performance in JOINs or filtering)
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);

-- measure performance 
EXPALIN ANALYZE
SELECT
    User.first_name,
    User.email,
    Booking.start_date,
    Booking.end_date,

FROM
Booking
JOIN User ON Booking.user_id = User.user_id
WHERE
    Booking.start_date >= '2023-01-01';
    
