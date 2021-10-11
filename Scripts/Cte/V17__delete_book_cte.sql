with delete_book_cte (id) as (
    select * from book
    where author_id = 3
)
delete from book
where book_id in (select id from delete_book_cte);
