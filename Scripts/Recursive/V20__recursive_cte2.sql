{\rtf1\ansi\ansicpg1251\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;\red31\green107\blue192;}
{\*\expandedcolortbl;;\cssrgb\c14118\c50588\c80000;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs26 \cf0 with recursive cte2 as (\
select book_id, name, yearOfPublishing, author_id, publishing_house_id, genre_department_id from book where author_id = 1\
union \
select book.book_id, \cf2 book.name\cf0 , book.yearOfPublishing, book.author_id, book.publishing_house_id, book. genre_department_id from book\
join cte2 on book.author_id = cte2.author_id\
)\
select * from cte2; \
}