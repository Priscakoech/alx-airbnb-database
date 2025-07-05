-- inner join to retrieve data from all bookings and the users who made them
SELECT
Booking.booking_id,
Booking.start_date,
Booking.end_date,
Booking.total_price,
Booking.status,
User.user_id,
User.first_name,
User.last_name,
User.email,

FROM
Booking
INNER JOIN User ON Booking.user_id = User.user_id
User ON Booking.user_id = User.user_id

-- left join retrieve all properties and their reviews, including properties without reviews, including properties with no reviews
SELECT
Property.property_id,
Property.name,
Property.location,
Review.rating,
Review.comment,
Review.created_at
FROM
Property
LEFT JOIN Review ON Property.property_id = Review.property_id;  

-- full outer join to retrieve all users and their bookings, including users with no bookings and bookings with no associated user
SELECT
User.user_id,
User.first_name,
User.last_name,
User.email,
Booking.booking_id,
Booking.property_id,
Booking.start_date,
Booking.status,
FROM
User
FULL OUTER JOIN Booking ON User.user_id = Booking.user_id;


