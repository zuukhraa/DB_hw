create table library_card (
                              library_card_id serial primary key,
                              visitor_firstName varchar(255) not null,
                              visitor_lastName varchar(255) not null,
                              passport integer not null,
                              home_address varchar (75) not null
);