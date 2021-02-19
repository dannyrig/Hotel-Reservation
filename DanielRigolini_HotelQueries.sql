use HotelDB;

-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, 
-- the room number(s), and the reservation dates.
Select Guest_Name, Room_ID, Check_IN, Check_Out 
From reservations
Where Check_OUT Between '2023-07-01' And '2023-07-31';
-- Results: 4 row(s) returned
-- Room_ID, Guest_Name, Check_IN, Check_Out
-- '205', 'Daniel Rigolini', '2023-06-28', '2023-07-02'
-- '204', 'Walter Holaway', '2023-07-13', '2023-07-14'
-- '401', 'Wilfred Vise', '2023-07-18', '2023-07-21'
-- '303', 'Bettyann Seery', '2023-07-28', '2023-07-29'

-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, 
-- the room number, and the dates of the reservation.
Select Guest_Name, reservations.Room_ID, Check_IN, Check_Out
From reservations
INNER JOIN roomamenities ON roomamenities.Room_ID = reservations.Room_ID
Where Amentity_ID = 2;
-- Results: 11 row(s) returned
-- Guest_Name, Room_ID, Check_IN, Check_Out
-- 'Karie Yang', '201', '2023-03-06', '2023-03-07'
-- 'Bettyann Seery', '203', '2023-02-05', '2023-02-10'
-- 'Karie Yang', '203', '2023-09-13', '2023-09-15'
-- 'Daniel Rigolini', '205', '2023-06-28', '2023-07-02'
-- 'Wilfred Vise', '207', '2023-04-23', '2023-04-24'
-- 'Walter Holaway', '301', '2023-04-09', '2023-04-13'
-- 'Mack Simmer', '301', '2023-11-22', '2023-11-25'
-- 'Bettyann Seery', '303', '2023-07-28', '2023-07-29'
-- 'Duane Cullison', '305', '2023-02-22', '2023-02-24'
-- 'Bettyann Seery', '305', '2023-08-30', '2023-09-01'
-- 'Daniel Rigolini', '307', '2023-03-17', '2023-03-20'

-- 3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, 
-- the starting date of the reservation, and how many people were included in the reservation. 
-- (Choose a guest's name from the existing data.)
Select Guest_Name, Room_ID, Check_IN, Adults + Children as People
From reservations 
Where Guest_Name = "Bettyann Seery";
-- Results: 3 row(s) returned
-- Guest_Name, Room_ID, Check_IN, People
-- 'Bettyann Seery', '203', '2023-02-05', '3'
-- 'Bettyann Seery', '303', '2023-07-28', '3'
-- 'Bettyann Seery', '305', '2023-08-30', '1'

-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
-- The results should include all rooms, whether or not there is a reservation associated with the room.
Select rooms.Room_ID, reservations.Reserv_ID, reservations.Total
From reservations
RIGHT JOIN rooms on rooms.Room_ID = reservations.Room_ID;
-- Results: 26 row(s) returned
-- Room_ID, Reserv_ID, Total
-- '201', '4', '$199.99'
-- '202', '7', '$349.98'
-- '203', '2', '$999.95'
-- '203', '21', '$399.98'
-- '204', '16', '$184.99'
-- '205', '15', '$699.96'
-- '206', '12', '$599.96'
-- '206', '23', '$449.97'
-- '207', '10', '$174.99'
-- '208', '13', '$599.96'
-- '208', '20', '$149.99'
-- '301', '9', '$799.96'
-- '301', '24', '$599.97'
-- '302', '6', '$924.95'
-- '302', '25', '$699.96'
-- '303', '18', '$199.99'
-- '304', '14', '$184.99'
-- '305', '3', '$349.98'
-- '305', '19', '$349.98'
-- '306', NULL, NULL
-- '307', '5', '$524.97'
-- '308', '1', '$299.98'
-- '401', '11', '$1,199.97'
-- '401', '17', '$1,259.97'
-- '401', '22', '$1,199.97'
-- '402', NULL, NULL


-- 5. Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.
Select Room_ID
From reservations
Where Adults + Children >= 3 And Check_IN between '2023-04-01' And '2023-04-30';
-- Results: 0 row(s) returned

-- 6. Write a query that returns a list of all guest names and the number of reservations per guest, 
--  sorted starting with the guest with the most reservations and then by the guest's last name.
Select guests.Guest_Name, count(guests.Guest_ID) as reservation_count
From guests
LEFT JOIN reservations on reservations.Guest_Name = guests.Guest_Name
Group by guests.Guest_ID
Order by reservation_count DESC,  SUBSTRING_INDEX((guests.Guest_Name)," ",-1);
-- Results: 11 row(s) returned
-- Guest_Name, reservation_count
-- 'Mack Simmer', '4'
-- 'Bettyann Seery', '3'
-- 'Duane Cullison', '2'
-- 'Walter Holaway', '2'
-- 'Aurore Lipton', '2'
-- 'Daniel Rigolini', '2'
-- 'Maritza Tilton', '2'
-- 'Joleen Tison', '2'
-- 'Wilfred Vise', '2'
-- 'Karie Yang', '2'
-- 'Zachery Luechtefeld', '1'

-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number. 
-- (Choose a phone number from the existing data.)
Select Guest_Name, Address, Phone
From guests
Where Phone = "(336) 712-5641";
-- Results: 1 row(s) returned
-- Guest_Name, Address, Phone
-- 'Daniel Rigolini', '110 Arbor Hill Ave', '(336) 712-5641'
