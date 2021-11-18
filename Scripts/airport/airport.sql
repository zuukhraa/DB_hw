{\rtf1\ansi\ansicpg1251\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;\red252\green33\blue37;}
{\*\expandedcolortbl;;\cssrgb\c100000\c23137\c18824;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs26 \cf2 create table airport (\
    airport_id serial primary key,\
    airport_name varchar(40) check (char_length(airport_name) > 1)\
);\
\
insert into airport(airport_name)\
values ('Domodedovo International Airport');\
insert into airport(airport_name)\
values ('Vancouver International Airport');\
insert into airport(airport_name)\
values ('Helsinki Airport');\
\
create table airplane (\
    airplane_id serial primary key,\
    name varchar(40) check (char_length(name) > 1)\
);\
\
insert into airplane(name)\
values ('Airbus A350-900');\
insert into airplane(name)\
values ('Sukhoi SuperJet 100');\
insert into airplane(name)\
values ('Boeing 777-300ER');\
\
create table flights (\
    flight_id serial primary key,\
    flight_number varchar(40) check (char_length(flight_number) > 1),\
    flight_duration integer constraint duration_length check (flight_duration > 0),\
    date date not null,\
    airplane_id integer not null,\
    foreign key (airplane_id) references airplane (airplane_id),\
    departure_airport_id integer not null,\
    foreign key (departure_airport_id) references airport (airport_id),\
    city_departure varchar(40) check (char_length(city_departure) > 1),\
    city_arrival varchar(40) check (char_length(city_arrival) > 1)\
);\
\
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)\
values ('SU106', '10', '2021-08-12', 1, 1, 'Moscow', 'New-York');\
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)\
values ('LO805', '5', '2021-06-23', 2, 1, 'Moscow', 'Paris');\
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)\
values ('FR112', '8', '2020-05-14', 3, 2, 'Vancouver', 'Moscow');\
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)\
values ('PO782', '7', '2020-05-14', 1, 1, 'Milan', 'Kazan');\
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)\
values ('GE008', '6', '2020-05-14', 2, 1, 'Amsterdam', 'Novosibirsk');\
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)\
values ('L\uc0\u1053 \u1045 80', '5', '2021-06-23', 3, 2, 'Moscow', 'Paris');\
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)\
values ('TTG43', '6', '2021-08-12', 2, 3, 'Helsinki', 'Yerevan');\
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)\
values ('WER78', '7', '2020-04-22', 3, 3, 'Helsinki', 'Minsk');\
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)\
values ('UY068', '9', '2020-04-22', 1, 1, 'Moscow', 'Brasilia');\
insert into flights(flight_number, flight_duration, date, airplane_id, departure_airport_id, city_departure, city_arrival)\
values ('HH551', '2', '2021-03-03', 1, 1, 'Moscow', 'Kazan');\
\
create table passengers (\
    passenger_id serial primary key,\
    first_name varchar(100) check (char_length(first_name) > 1),\
    last_name varchar(100) check (char_length(last_name) > 1),\
    flight_id integer not null,\
    foreign key (flight_id) references flights (flight_id)\
    );\
\
insert into passengers(first_name, last_name, flight_id)\
values ('Zukhra', 'Shagiakhmetova', 1);\
insert into passengers(first_name, last_name, flight_id)\
values ('Zukhra', 'Shagiakhmetova', 2);\
insert into passengers(first_name, last_name, flight_id)\
values ('Elmira', 'Baigulova', 2);\
insert into passengers(first_name, last_name, flight_id)\
values ('Yana', 'Nasyrova', 1);\
\
create table crew (\
    crew_id serial primary key,\
    name varchar(255) check (char_length(name) > 1),\
    type_of_position varchar(100) check (char_length(type_of_position) > 1),\
    airplane_id integer not null,\
    foreign key (airplane_id) references airplane (airplane_id)\
);
\f1 \cf0 \
\

\f0 \cf2 insert into crew (name, type_of_position, airplane_id)\
values ('Ivan Abramov', 'pilot', 1);\
insert into crew (name, type_of_position, airplane_id)\
values ('Maria Volkova', 'stewardess', 1);\
insert into crew (name, type_of_position, airplane_id)\
values ('Timur Arslanov', 'technician', 1);\
\
-- 3) \uc0\u1042 \u1099 \u1074 \u1077 \u1089 \u1090 \u1080  \u1089 \u1072 \u1084 \u1099 \u1081  \u1087 \u1088 \u1086 \u1076 \u1086 \u1083 \u1078 \u1080 \u1090 \u1077 \u1083 \u1100 \u1085 \u1099 \u1081  \u1087 \u1086  \u1074 \u1088 \u1077 \u1084 \u1077 \u1085 \u1080  \u1088 \u1077 \u1081 \u1089 .\
select * from flights\
where flights.flight_duration = (select max(flights.flight_duration) from flights);\
\
-- 4) \uc0\u1042 \u1099 \u1074 \u1077 \u1089 \u1090 \u1080  \u1082 \u1086 \u1083 \u1080 \u1095 \u1077 \u1089 \u1090 \u1074 \u1086  \u1088 \u1077 \u1081 \u1089 \u1086 \u1074  \u1076 \u1083 \u1103  \u1082 \u1072 \u1078 \u1076 \u1086 \u1075 \u1086  \u1072 \u1101 \u1088 \u1086 \u1087 \u1086 \u1088 \u1090 \u1072  \u1079 \u1072  \u1091 \u1082 \u1072 \u1079 \u1072 \u1085 \u1085 \u1099 \u1081  \u1076 \u1077 \u1085 \u1100  (\u1086 \u1076 \u1085 \u1080 \u1084  \u1079 \u1072 \u1087 \u1088 \u1086 \u1089 \u1086 \u1084 ).\
select airport_name, count(distinct flight_id) as count_of_flights from flights, airport\
where flights.departure_airport_id = airport.airport_id\
and flights.date = ?\
group by airport.airport_name;\
\
-- 5) \uc0\u1042 \u1099 \u1074 \u1077 \u1089 \u1090 \u1080  \u1060 \u1048 \u1054  \u1087 \u1072 \u1089 \u1089 \u1072 \u1078 \u1080 \u1088 \u1072 , \u1082 \u1086 \u1090 \u1086 \u1088 \u1099 \u1081  \u1087 \u1088 \u1086 \u1074 \u1077 \u1083  \u1074  \u1087 \u1086 \u1083 \u1077 \u1090 \u1072 \u1093  \u1085 \u1072 \u1080 \u1073 \u1086 \u1083 \u1100 \u1096 \u1077 \u1077  \u1082 \u1086 \u1083 \u1080 \u1095 \u1077 \u1089 \u1090 \u1074 \u1086  \u1095 \u1072 \u1089 \u1086 \u1074  \u1080  \u1085 \u1072 \u1080 \u1084 \u1077 \u1085 \u1100 \u1096 \u1077 \u1077 . \u1055 \u1086  \u1074 \u1086 \u1079 \u1084 \u1086 \u1078 \u1085 \u1086 \u1089 \u1090 \u1080  \u1089 \u1076 \u1077 \u1083 \u1072 \u1090 \u1100  \u1101 \u1090 \u1086  \u1086 \u1076 \u1085 \u1080 \u1084  \u1079 \u1072 \u1087 \u1088 \u1086 \u1089 \u1086 \u1084 .\
with t1 as (\
    select first_name as firstName, last_name as lastName, sum(flight_duration) as total\
    from passengers join flights f on passengers.flight_id = f.flight_id group by first_name, last_name\
)\
select firstName, lastName, total as hours from t1 where total = (select min(total) from t1)\
UNION\
select firstName, lastName, total as hours from t1 where total = (select max(total) from t1);\
\
-- 6) \uc0\u1044 \u1083 \u1103  \u1082 \u1072 \u1078 \u1076 \u1086 \u1075 \u1086  \u1087 \u1080 \u1083 \u1086 \u1090 \u1072  \u1074 \u1099 \u1074 \u1077 \u1089 \u1090 \u1080  \u1094 \u1077 \u1087 \u1086 \u1095 \u1082 \u1091  \u1075 \u1086 \u1088 \u1086 \u1076 \u1086 \u1074 , \u1087 \u1086  \u1082 \u1086 \u1090 \u1086 \u1088 \u1099 \u1084  \u1086 \u1085  \u1083 \u1077 \u1090 \u1072 \u1083 .}