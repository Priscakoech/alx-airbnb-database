-- Seed data for the User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('1', 'Alice', 'Smith', 'alice@example.com', 'hashed_password_1', '123-456-7890', 'admin'),
('2', 'Bob', 'Johnson', 'johnson@example.com', 'hashed_password_2', '234-567-8901', 'user'),

-- Seed data for the Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('1', '1', 'Cozy Cottage', 'A cozy cottage in the countryside.', 'Countryside', 100.00),
('2', '2', 'Downtown Apartment', 'A modern apartment in the city center.', 'City Center', 150.00);
-- Seed data for the Booking table
INSERT INTO Booking (booking_id, user_id, property_id, start_date, end_date, total_price, status)
VALUES
('1', '2', '1', '2023-10-01', '2023-10-05', 400.00, 'confirmed'),
('2', '1', '2', '2023-11-01', '2023-11-07', 1050.00, 'pending');
-- Seed data for the Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
('1', '1', 400.00, '2023-10-01', 'credit_card'),
('2', '2', 1050.00, '2023-11-01', 'paypal');
-- Seed data for the Review table
INSERT INTO Review (review_id, user_id, property_id, rating, comment, created_at)
VALUES
('1', '2', '1', 5, 'Wonderful stay! Highly recommend.', '2023-10-02'),
('2', '1', '2', 4,  'Great location, but a bit noisy at night.', '2023-11-02');
-- Seed data for the Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
('1', '2', '1', 'Hi Alice, I loved your cottage! Will definitely come back.', '2023-10-03'),
('2', '1', '2', 'Bob, thanks for the feedback! We are working on soundproofing.', '2023-11-03');

