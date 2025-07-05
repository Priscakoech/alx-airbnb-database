SELECT
user.user_id,
user.first_name,

COUNT(booking.booking_id) AS total_bookings
RANK() OVER (ORDER BY COUNT(booking.booking_id) DESC) AS booking_rank
FROM
User
LEFT JOIN Booking ON User.user_id = Booking.user_id
GROUP BY
user.user_id,
user.first_name

SELECT
property.property_id,
property.name,
COUNT(Booking.booking_id) AS total_bookings
FROM
Property
LEFT JOIN Booking ON Property.property_id = Booking.property_id
GROUP BY
property.property_id,
property.name