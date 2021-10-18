with recursive cte2 as (
select book_id, name, yearOfPublishing, author_id, publishing_house_id, genre_department_id from book 
where author_id = 1
union 
select book.book_id, book.name, book.yearOfPublishing, book.author_id, book.publishing_house_id, book. genre_department_id from book
join cte2 on book.author_id = cte2.author_id
)
select * from cte2; 
