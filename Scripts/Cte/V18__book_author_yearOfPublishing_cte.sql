//выбор книги по автору и дате публикации
with book_author_yearOfPublishing_cte as (
from book
where author_id = 2 AND yearOfPublishing = '1813'
returning *
)
select * from book_author_yearOfPublishing_cte;