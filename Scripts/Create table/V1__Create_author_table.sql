create table author (
                        author_id serial primary key,
                        first_name varchar(255) check(char_length(first_name) > 1),
                        last_name varchar(255) check(char_length(last_name) > 1)
);
