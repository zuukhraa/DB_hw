//1

create materialized view book_name_view as
select *
from book;

insert into book(name, yearOfPublishing, author_id, publishing_house_id, genre_department_id)
values ('It', '1986', 1, 2, 1);

select * from book_name_view;
refresh materialized view book_name_view;
select * from book_name_view;

//2

create materialized view author_view as
select *
from publishing_house
where publishing_house_id = 1;

select * from author_view;
