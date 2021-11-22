create table airport (
    airport_id serial primary key,
    airport_name varchar(40) check (char_length(airport_name) > 1)
);

insert into airport(airport_name)
values ('Domodedovo International Airport');
insert into airport(airport_name)
values ('Vancouver International Airport');
insert into airport(airport_name)
values ('Helsinki Airport');

create table airplane (
    airplane_id serial primary key,
    name varchar(40) check (char_length(name) > 1)
);

insert into airplane(name)
values ('Airbus A350-900');
insert into airplane(name)
values ('Sukhoi SuperJet 100');
insert into airplane(name)
values ('Boeing 777-300ER');

create table flights (
    flight_id serial primary key,
    flight_number varchar(40) check (char_length(flight_number) > 1),
    flight_duration integer constraint duration_length check (flight_duration > 0),
    date date not null,
    airplane_id integer not null,
    foreign key (airplane_id) references airplane (airplane_id),
    departure_airport_id integer not null,
    foreign key (departure_airport_id) references airport (airport_id),
    city_departure varchar(40) check (char_length(city_departure) > 1),
    city_arrival varchar(40) check (char_length(city_arrival) > 1)
);

insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('SU106', '10', '2021-08-12', 1, 1, 'Moscow', 'New-York');
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('LO805', '5', '2021-06-23', 2, 1, 'Moscow', 'Paris');
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('FR112', '8', '2020-05-14', 3, 2, 'Vancouver', 'Moscow');
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('PO782', '7', '2020-05-14', 1, 1, 'Milan', 'Kazan');
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('GE008', '6', '2020-05-14', 2, 1, 'Amsterdam', 'Novosibirsk');
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('LНЕ80', '5', '2021-06-23', 3, 2, 'Moscow', 'Paris');
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('TTG43', '6', '2021-08-12', 2, 3, 'Helsinki', 'Yerevan');
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('WER78', '7', '2020-04-22', 3, 3, 'Helsinki', 'Minsk');
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('UY068', '9', '2020-04-22', 1, 1, 'Moscow', 'Brasilia');
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('HH551', '2', '2021-03-03', 1, 1, 'Moscow', 'Kazan');

create table passengers (
    passenger_id serial primary key,
    first_name varchar(100) check (char_length(first_name) > 1),
    last_name varchar(100) check (char_length(last_name) > 1),
    flight_id integer not null,
    foreign key (flight_id) references flights (flight_id)
    );

insert into passengers(first_name, last_name, flight_id)
values ('Zukhra', 'Shagiakhmetova', 1);
insert into passengers(first_name, last_name, flight_id)
values ('Zukhra', 'Shagiakhmetova', 2);
insert into passengers(first_name, last_name, flight_id)
values ('Elmira', 'Baigulova', 2);
insert into passengers(first_name, last_name, flight_id)
values ('Yana', 'Nasyrova', 1);

create table crew (
    crew_id serial primary key,
    name varchar(255) check (char_length(name) > 1),
    type_of_position varchar(100) check (char_length(type_of_position) > 1),
    airplane_id integer not null,
    foreign key (airplane_id) references airplane (airplane_id)
);

insert into crew (name, type_of_position, airplane_id)
values ('Ivan Abramov', 'pilot', 1);
insert into crew (name, type_of_position, airplane_id)
values ('Maria Volkova', 'stewardess', 1);
insert into crew (name, type_of_position, airplane_id)
values ('Timur Arslanov', 'technician', 1);

-- 3) Вывести самый продолжительный по времени рейс.
select * from flights
where flights.flight_duration = (select max(flights.flight_duration) from flights);

-- 4) Вывести количество рейсов для каждого аэропорта за указанный день (одним запросом).
select airport_name, count(distinct flight_id) as count_of_flights from flights, airport
where flights.departure_airport_id = airport.airport_id
and flights.date = ?
group by airport.airport_name;

-- 5) Вывести ФИО пассажира, который провел в полетах наибольшее количество часов и наименьшее. По возможности сделать это одним запросом.
with t1 as (
    select first_name as firstName, last_name as lastName, sum(flight_duration) as total
    from passengers join flights f on passengers.flight_id = f.flight_id group by first_name, last_name
)
select firstName, lastName, total as hours from t1 where total = (select min(total) from t1)
UNION
select firstName, lastName, total as hours from t1 where total = (select max(total) from t1);

-- 6) Для каждого пилота вывести цепочку городов, по которым он летал.
select crew.name, array_agg(flights.city_arrival order by flights.departure_airport_id asc) towndown
from crew
         right join airplane on crew.airplane_id = airplane.airplane_id
         right join flights on flights.airplane_id = airplane.airplane_id
         right join airport on flights.departure_airport_id = airport.airport_id
where type_of_position = 'pilot'
group by crew.name;
