CREATE TABLE Aircraft
(
  AIRCRAFT_ID INT NOT NULL,
  AIRCRAFT_TYPE VARCHAR2(100) NOT NULL,
  CAPACITY INT NOT NULL,
  PRIMARY KEY (AIRCRAFT_ID)
);

CREATE TABLE Airlines
(
  AIRLINE_ID INT NOT NULL,
  AIRLINE_NAME VARCHAR2(100) NOT NULL,
  PRIMARY KEY (AIRLINE_ID)
);

CREATE TABLE Airports
(
  AIRPORT_ID INT NOT NULL,
  AIRPORT_NAME VARCHAR2(50) NOT NULL,
  LOCATION VARCHAR2(100) NOT NULL,
  PRIMARY KEY (AIRPORT_ID)
);

CREATE TABLE Passengers
(
  PASSENGER_ID INT NOT NULL,
  PASSENGER_NAME VARCHAR2(100) NOT NULL,
  PASSENGER_PHONE VARCHAR2(50) NOT NULL,
  PASSENGER_EMAIL VARCHAR2(150) NOT NULL,
  PASSPORT_NUMBER VARCHAR2(100) NOT NULL,
  PASSENGER_AGE INT NOT NULL,
  PRIMARY KEY (PASSENGER_ID)
);

CREATE TABLE Flights
(
  FLIGHT_ID INT NOT NULL,
  FLIGHT_NUMBER VARCHAR2(15) NOT NULL,
  DEPARTURE_TIME DATE NOT NULL,
  ARRIVAL_TIME DATE NOT NULL,
  DEPARTURE_AIRPORT INT NOT NULL,
  ARRIVAL_AIRPORT INT NOT NULL,
  FLIGHT_STATUS VARCHAR2(50) NOT NULL,
  AIRCRAFT_ID INT NOT NULL,
  AIRLINE_ID INT NOT NULL,
  PRIMARY KEY (FLIGHT_ID),
  FOREIGN KEY (AIRCRAFT_ID) REFERENCES Aircraft(AIRCRAFT_ID),
  FOREIGN KEY (AIRLINE_ID) REFERENCES Airlines(AIRLINE_ID),
  FOREIGN KEY (DEPARTURE_AIRPORT) REFERENCES Airports(AIRPORT_ID),
  FOREIGN KEY (ARRIVAL_AIRPORT) REFERENCES Airports(AIRPORT_ID)
);

CREATE TABLE Bookings
(
  BOOKING_ID INT NOT NULL,
  SEAT_NUMBER VARCHAR2(10) NOT NULL,
  BOOKING_DATE DATE NOT NULL,
  PASSENGER_ID INT NOT NULL,
  FLIGHT_ID INT NOT NULL,
  PRIMARY KEY (BOOKING_ID, PASSENGER_ID, FLIGHT_ID),
  FOREIGN KEY (PASSENGER_ID) REFERENCES Passengers(PASSENGER_ID),
  FOREIGN KEY (FLIGHT_ID) REFERENCES Flights(FLIGHT_ID)
);

CREATE TABLE CrewMembers
(
  CREW_ID INT NOT NULL,
  CREW_NAME VARCHAR2(100) NOT NULL,
  CREW_ROLE VARCHAR2(50) NOT NULL,
  FLIGHT_ID INT NOT NULL,
  PRIMARY KEY (CREW_ID),
  FOREIGN KEY (FLIGHT_ID) REFERENCES Flights(FLIGHT_ID)
);
