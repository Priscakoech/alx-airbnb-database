-- rename original table
ALTER TABLE Booking RENAME TO Booking_old;
-- create new partitioned table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    Property_id UUID REFERENCES Property(property_id),
    User_id UUID REFERENCES "User"(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status TEXT CHECK (status IN ('pending', 'confirmed', 'cancelled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
)PARTITION BY RANGE (start_date);

-- create partitions for each year
CREATE TABLE Booking_2023 PARTITION OF Booking FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
CREATE TABLE Booking_2024 PARTITION OF Booking FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
CREATE TABLE Booking_2025 PARTITION OF Booking FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

-- insert data from old table to new partitioned table
INSERT INTO Booking
SELECT * FROM Booking_old;

EXPLAIN ANALYZE
SELECT * FROM Booking 
WHERE start_date >= '2023-01-01' AND start_date < '2024-01-01';