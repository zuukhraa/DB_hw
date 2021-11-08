create table genre_department (
                                  genre_department_id serial primary key,
                                  name varchar (25) check(char_length(name) > 1)
);
