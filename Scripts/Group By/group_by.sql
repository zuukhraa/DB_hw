//группируем по названияи книг, которые взяли в ареннду
select book.name, Count(rent_book.book_id) from book
    join rent_book on rent_book.book_id = book.book_id
group by book.id;

//группируем книги по названиям
select name, COUNT(*) AS BookCount
FROM book
group by name;
