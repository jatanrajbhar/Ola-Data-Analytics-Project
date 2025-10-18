USE ola;
-- imported data

-- 1. Retrieve all successful 
CREATE VIEW Successful_Booking AS
 SELECT * FROM bookings
 WHERE Booking_Status = 'Success';
 
 SELECT * FROM Successful_Booking;
 -- 2. Find the average ride distance for each vehicle type:
 CREATE VIEW Average_distance AS
 SELECT Vehicle_Type, ROUND(AVG(Ride_Distance),2) FROM bookings
 GROUP BY Vehicle_Type
 
 SELECT * FROM Average_Distance;
-- 3. Get the total number of cancelled rides by customers:
SELECT * FROM bookings
WHERE Booking_Status ='Canceled by Customer';
-- 4. List the top 5 customers who booked the highest number of rides:
 SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings GROUP BY
 Customer_ID ORDER BY total_rides DESC LIMIT 5;
-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(Booking_Status) FROM bookings
WHERE Booking_Status = 'Canceled by Driver'
 -- 6. Find the maximum and minimum driver ratings for Prime Sedan booking
  SELECT MAX(Driver_Ratings), MIN(Driver_Ratings)  
 FROM bookings
WHERE Vehicle_type = 'Prime Sedan'
 -- 7. Retrieve all rides where payment was made using UPI:
  SELECT * FROM bookings
  WHERE Payment_Method = 'UPI';

--  8. Find the average customer rating per vehicle type:
 SELECT Vehicle_Type, ROUND(AVG(Customer_Rating),2) AS Coustomerrating
 FROM bookings
 GROUP BY Vehicle_Type
--  9. Calculate the total booking value of rides completed successfully:
 SELECT SUM(Booking_Value)
 FROM bookings 
 WHERE Booking_Status = 'Success';
 -- 10. List all incomplete rides along with the reason
  SELECT Booking_ID, Incomplete_Rides_Reason 
  FROM bookings 
  WHERE Incomplete_Rides ='Yes';