SELECT
property_id
name,
location,

FROM
Property

WHERE
property_id IN (
    SELECT
        property_id
    FROM
        Review
    HAVING 
        AVG(rating) > 4.0
);

SELECT
user.user_id,
user.first_name,
user.last_name,
user.email,

FROM
User
WHERE
(
    SELECT
        COUNT(*)
    FROM
        Booking
    WHERE
        Booking.user_id = User.user_id  
) > 3;