{\rtf1\ansi\ansicpg1251\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs26 \cf0 //\uc0\u1074 \u1089 \u1077  \u1082 \u1085 \u1080 \u1075 \u1080  \u1086 \u1087 \u1088 \u1077 \u1076 \u1077 \u1083 \u1105 \u1085 \u1085 \u1086 \u1075 \u1086  \u1072 \u1074 \u1090 \u1086 \u1088 \u1072  \
with recursive cte1 (book_author)\
as \
(select distinct author_id from book \
where author_id = 1\
union all\
select book_id from book\
inner join cte1 on cte1.book_author = book.author_id)\
select * from cte1;}