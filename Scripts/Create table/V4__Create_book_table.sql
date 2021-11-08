create table book (
                      book_id serial primary key,
                      name varchar(255) check(char_length(name) > 1),
                      yearOfPublishing varchar(15) check(char_length(yearOfPublishing) > 1),
                      author_id integer not null,
                      publishing_house_id integer not null,
                      genre_department_id integer not null,
                      foreign key (author_id) references author (author_id),
                      foreign key (publishing_house_id) references publishing_house (publishing_house_id),
                      foreign key (genre_department_id) references genre_department (genre_department_id)
);
