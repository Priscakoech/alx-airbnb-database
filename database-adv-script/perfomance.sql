-- initial unoptimized query
SELECT
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    user.user_id,
    user.first_name,
    user.last_name,
    user.email,
    user.phone_number,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Property.price_per_night,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_date,
    Payment.payment_method,

FROM
    Booking
JOIN
    user ON Booking.user_id = user.user_id
JOIN
    Property ON Booking.property_id = Property.property_id
LEFT JOIN
    Payment ON Booking.booking_id = Payment.booking_id

EXPLAIN ANALYZE
SELECT
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    user.user_id,
    user.first_name,
    user.last_name,
    user.email,
    user.phone_number,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Property.price_per_night,
    Payment.payment_id,     
    Payment.amount,
    Payment.payment_date,
    Payment.payment_method
FROM
    Booking
JOIN
    user ON Booking.user_id = user.user_id
JOIN
    Property ON Booking.property_id = Property.property_id
LEFT JOIN
    Payment ON Booking.booking_id = Payment.booking_id

-- Optimized query 
SELECT
    Booking.booking_id,
    Booking.start_date,
    Booking.total_price,
    user.first_name,
    user.email,
    Property.name AS property_name,,     
    Payment.amount,

FROM
    Booking
JOIN
    user ON Booking.user_id = user.user_id
JOIN
    Property ON Booking.property_id = Property.property_id
LEFT JOIN
    Payment ON Booking.booking_id = Payment.booking_id
WHERE
    Booking.start_date >= CURRENT_DATE - INTERVAL '30 days';
    AND Booking.status = 'confirmed'

