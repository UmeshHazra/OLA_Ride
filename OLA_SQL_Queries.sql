create database OLA;
use ola;
select * from ola_dataset;

#1. Retrieve all successful bookings.
select * from ola_dataset
where Booking_Status = 'Success';

#2. Find the average ride distance for each vehicle type
select Vehicle_Type, round(avg(Ride_Distance),2) as Avg_Ride_Distance
from ola_dataset
group by vehicle_Type;

#3. Get the total number of cancelled rides by customers.
select count(*) as total_customer_Cancelation
from ola_dataset
where Canceled_Rides_by_Customer = 'Yes';

#4. List the top 5 customers who booked the highest number of rides.
select Customer_ID, count(*) as Total_Rides
from ola_dataset
group by Customer_ID
order by Total_Rides desc
limit 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues.
SELECT 
    SUM(Canceled_Rides_by_Driver) AS total_driver_cancellations
FROM ola_dataset
WHERE Incomplete_Rides_Reason IN ('Personal Issue', 'Vehicle Breakdown');

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings.
select 
max(Driver_Ratings) as Max_driver_ratings,
min(Driver_Ratings) as Min_driver_ratings
from ola_dataset
where Vehicle_Type = 'Prime Sedan' and Booking_Status = 'Success';

#7. Retrieve all rides where payment was made using UPI.
select * from ola_dataset
where Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type.
select Vehicle_Type, avg(Customer_Rating) as Avg_Customer_Rating
from ola_dataset
group by Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully.
select sum(Booking_Value) as Total_Booking_Value
from ola_dataset
where Booking_Status = 'Success';

#10. List all incomplete rides along with the reason.
select Customer_ID,
Incomplete_Rides,
Incomplete_Rides_Reason,
Vehicle_Type
from ola_dataset
where Incomplete_Rides = 'Yes';

