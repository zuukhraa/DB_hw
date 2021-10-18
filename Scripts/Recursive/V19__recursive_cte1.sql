//id аренд определённой книги 
with recursive cte1 (all_rent)
as 
(select distinct book_id from rent_book 
where book_id = 1
union all
select rent_id from rent_book
inner join cte1 on cte1.all_rent = rent_book.book_id)
select * from cte1;
