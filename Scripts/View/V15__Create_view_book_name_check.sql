create view book_name_check
as select * from book
where name = 'Anna Karenina'
with local check option;
