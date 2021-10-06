 create table rent (
     id serial primary key,
     data_of_issue varchar(20) not null,
     return_date varchar(20) not null,
     library_card_id integer not null,
     foreign key (library_card_id) references library_card (library_card_id)
 );