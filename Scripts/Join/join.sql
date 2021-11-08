//inner_join
//таблица названий книг с авторами

select book.name, author.first_name, author.last_name
from book
join author on author.author_id  = book.author_id;

//left_join
//таблица с названием книг, годом публикации и названием жанра, даже если в таблице "Жанр" нет совпадений

select book.name, book.yearOfPublishing, genre_department.name
from book
left join genre_department on book.genre_department_id = genre_department.genre_department_id;

//right_join
//таблица с названием книг, годом публикации и названием жанра, даже если в таблице "Книга" нет совпадений

select book.name, book.yearOfPublishing, genre_department.name
from book
right join genre_department on book.genre_department_id = genre_department.genre_department_id;

//full_join
//таблица авторов всех книг и книг всех авторов

select book.name, author.first_name, author.last_name
from author full join "book"
on author.author_id = "book".author_id;

//cross_join
//таблица всевозможных вариантов таблиц читательского билета и аренды

select * from library_card cross join rent;

//natural_join
//таблица, которая включает в себя данные читательского билета и аренды. Столбец id аренды не повторяется

select * from library_card cross join rent;

//self_join
//из таблицы "Книга" создаем таблицу, в которой будут хранится id, название и года публикаций книг, у которых год публикации меньше книги с id = 1

select a.book_id, a.name, a.yearOfPublishing
from book a, book b
where a.yearOfPublishing < b.yearOfPublishing
 and b.book_id = 1;

//anti_join
//таблица, в которой хранятся id жанров таких книг, которых нет в наличии в библиотеке

select b.genre_department_id
from "book" b
where not exists(select 1
from genre_department g
where g.genre_department_id = b.genre_department_id);

//semi_join
//таблица, в которой хранятся id жанров таких книг, которые есть в библиотеке

select b.genre_department_id
from "book" b
where exists(select 1
from genre_department g
where g.genre_department_id = b.genre_department_id);
