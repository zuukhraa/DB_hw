create table publishing_house (
                                  publishing_house_id serial primary key,
                                  name varchar(255) check(char_length(name) > 1),
                                  city varchar(100) check(char_length(city) > 1),
                                  telephoneNumber integer constraint number_length check(telephoneNumber > 0),
                                  email varchar(100) check(char_length(email) > 1),
                                  website varchar(100) check(char_length(website) > 1)
);
