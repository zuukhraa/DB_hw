create table publishing_house (
                                  publishing_house_id serial primary key,
                                  name varchar(255) not null,
                                  city varchar(100) not null,
                                  telephoneNumber integer not null,
                                  email varchar(100) not null,
                                  website varchar(100) not null
);
