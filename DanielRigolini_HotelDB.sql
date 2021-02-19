drop database if exists HotelDB;

create database HotelDB;

use HotelDB;

create table Rooms (
	Room_ID Int primary key NOT NULL,
    Room_Type varchar(6) NOT NULL,
    ADA varchar(3) NOT NULL,
    Occupancy Int NOT NULL,
    Max_Occup Int NOT NULL,
    Price varchar(20) NOT NULL,
    Extra varchar(10)
);
create table Amenitites (
	Amentity_ID Int primary key auto_increment NOT NULL,
	Amentity_Type varchar(50) NOT NULL 
);
create table RoomAmenities (
	Room_Am_ID Int primary key auto_increment NOT NULL,
	Room_ID Int NOT NULL,
	Amentity_ID Int NOT NULL,
	foreign key fk_RoomAmenities_Amentity_ID (Amentity_ID)
		references Amenitites(Amentity_ID),
	foreign key fk_RoomAmenities_Room_ID (Room_ID)
		references Rooms(Room_ID)
);
create table Guests (
	Guest_ID Int primary key auto_increment NOT NULL,
	Guest_Name varchar(50) NOT NULL UNIQUE,
	Address varchar(50) NOT NULL,
	City varchar(50) NOT NULL,
	State varchar(2) NOT NULL,
	Zipcode Int NOT NULL,
	Phone varchar(20)
);
create table Reservations (
	Reserv_ID Int primary key auto_increment,
	Room_ID Int NOT NULL,
	Guest_Name varchar(50) NOT NULL,
	Adults Int NOT NULL,
	Children Int,
	Check_IN date NOT NULL,
	Check_OUT date NOT NULL,
	Total varchar(20),
	foreign key fk_Reservations_Room_ID (Room_ID)
		references Rooms(Room_ID),
	foreign key fk_Reservations_Guest_Name (Guest_Name)
		references Guests(Guest_Name) 
);