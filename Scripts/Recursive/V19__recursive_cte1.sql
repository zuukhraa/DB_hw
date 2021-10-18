//все книги определённого автора 
with recursive cte1 (book_author)
as 
(select distinct author_id from book 
where author_id = 1
union all
select book_id from book
inner join cte1 on cte1.book_author = book.author_id)
select * from cte1;
