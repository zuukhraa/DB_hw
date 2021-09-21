create table author (
    id serial primary key,
    first_name varchar(255) not null,
    last_name varchar(255) not null
);

create table publishingHouse (
    id serial primary key,
    name varchar(255) not null,
    city varchar(255) not null,
    telephoneNumber integer not null,
    email varchar(255) not null,
    website varchar(255) not null
);

create table genreDepartment (
    id serial primary key,
    name varchar (255) not null
);

create table book (
    id serial primary key,
    name varchar(255) not null,
    yearOfPublishing varchar(15) not null,
    author_id integer not null,
    publishingHouse_id integer not null,
    genreDepartment_id integer not null,
    foreign key (author_id) references author (id),
    foreign key (publishingHouse_id) references publishingHouse (id),
    foreign key (genreDepartment_id) references genreDepartment (id)
 );

 create table library_card (
     id serial primary key,
     visitor_firstName varchar(255) not null,
     visitor_lastName varchar(255) not null,
     passport integer not null,
     home_address varchar (255) not null
 );

 create table rent (
     id serial primary key,
     data_of_issue varchar(255) not null,
     return_date varchar(255) not null,
     libraryCard_id integer not null,
     foreign key (libraryCard_id) references library_card (id)
 );

 create table rent_book (
     book_id integer not null,
     rent_id integer not null,
     foreign key (book_id) references book (id),
     foreign key (rent_id) references rent (id)
 );