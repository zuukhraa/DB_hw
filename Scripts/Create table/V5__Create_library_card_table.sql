create table library_card (
                              library_card_id serial primary key,
                              visitor_firstName varchar(255) check(char_length(visitor_firstName) > 1),
                              visitor_lastName varchar(255) check(char_length(visitor_lastName) > 1),
                              passport integer constraint passport_length check(passport = 10),
                              home_address varchar (75) check(char_length(home_address) > 1)
);
