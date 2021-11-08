 create table rent (
     id serial primary key,
     data_of_issue varchar(20) check(char_length(data_of_issue) > 1),
     return_date varchar(20) check(char_length(return_date) > 1),
     library_card_id integer not null,
     foreign key (library_card_id) references library_card (library_card_id)
 );
