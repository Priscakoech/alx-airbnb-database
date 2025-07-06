# Database Performance Monitoring Report

## Objective
To monitor the execution performance of frequently used queries and refine the schema to remove bottlenecks.

## Monitored Queries

### 1. Bookings by Property and Date
```sql
SELECT * FROM Booking 
WHERE property_id = 'abc-123' 
AND start_date BETWEEN '2024-06-01' AND '2024-06-30';
