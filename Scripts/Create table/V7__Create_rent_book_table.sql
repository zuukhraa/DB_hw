create table rent_book (
                         book_id integer not null,
                         rent_id integer not null,
                         foreign key (book_id) references book (book_id),
                         foreign key (rent_id) references rent (rent_id)
);