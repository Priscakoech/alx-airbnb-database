-- User table
CREATE TABLE User(
    user_id  UUID INDEXED PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NULL,
    role VARCHAR(50) NOT NULL DEFAULT 'guest','host','admin',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
);
-- Create an index on the email column
CREATE INDEX idx_user_email ON User(email);

--Property table
CREATE TABLE Property(
    property_id UUID INDEXED PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (host_id) REFERENCES User(user_id) ON DELETE CASCADE

);
-- create index on property_id
CREATE INDEX idx_property_id ON Property(property_id);

-- Booking table
CREATE TABLE Booking(
    booking_id UUID INDEXED PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id FOREIGN KEY REFERENCES User(user_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT (status in('pending', 'confirmed', 'cancelled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE
FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

--indexes on Booking table
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_user ON Booking(user_id);

--payment table
CREATE TABLE Payment(
    payment_id UUID INDEXED PRIMARY KEY,
    booking_id FOREIGN KEY REFERENCES Booking(booking_id) ON DELETE CASCADE,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')),

    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);
--indexes on Payment table
CREATE INDEX idx_payment_booking ON Payment(booking_id);    

--Review table
CREATE TABLE Review(
    review_id UUID INDEXED PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

--Message table
CREATE TABLE Message(
    message_id UUID INDEXED PRIMARY KEY,
    sender_id UUID NOT NULL,
    receiver_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES User(user_id) ON DELETE CASCADE
);
