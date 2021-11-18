{\rtf1\ansi\ansicpg1251\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red252\green33\blue37;}
{\*\expandedcolortbl;;\cssrgb\c100000\c23137\c18824;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs26 \cf2 create table graph(\
                      id serial primary key,\
                      from_node varchar,\
                      to_node varchar,\
                      weight integer\
);\
\
insert into graph(from_node, to_node, weight) VALUES ('X', 'U', 1);\
insert into graph(from_node, to_node, weight) VALUES ('X', 'Y', 6);\
insert into graph(from_node, to_node, weight) VALUES ('X', 'V', 4);\
insert into graph(from_node, to_node, weight) VALUES ('Y', 'V', 7);\
insert into graph(from_node, to_node, weight) VALUES ('Y', 'S', 3);\
insert into graph(from_node, to_node, weight) VALUES ('S', 'U', 3);\
insert into graph(from_node, to_node, weight) VALUES ('S', 'X', 5);\
insert into graph(from_node, to_node, weight) VALUES ('U', 'V', 6);\
insert into graph(from_node, to_node, weight) VALUES ('U', 'X', 2);\
insert into graph(from_node, to_node, weight) VALUES ('V', 'Y', 2);\
\
with recursive graph_cte as (\
    select distinct from_node as to_node2, array[from_node] as path, false as cycle, 0 as weight, 'S' as way\
    from graph\
    where from_node = 'S'\
    UNION ALL\
    select graph.to_node,\
           graph_cte.path || graph.to_node,\
           graph.to_node = any (graph_cte.path),\
           graph.weight + graph_cte.weight,\
           graph_cte.way || ',' || graph.to_node\
    from graph inner join graph_cte on (graph_cte.to_node2 = graph.from_node) and not cycle)\
select * from graph_cte where to_node2 = 'Y' and cycle is false;\
\
with recursive graph_cte as (\
    select distinct from_node as to_node2, array[from_node] as path, false as cycle, 0 as weight, 'S' as way\
    from graph\
    where from_node = 'S'\
    UNION ALL\
    select graph.to_node,\
           graph_cte.path || graph.to_node,\
           graph.to_node = any (graph_cte.path),\
           graph.weight + graph_cte.weight,\
           graph_cte.way || ',' || graph.to_node\
    from graph inner join graph_cte on (graph_cte.to_node2 = graph.from_node) and not cycle),\
    short (weight) as (select min(weight) from graph_cte where to_node2 = 'Y')\
select to_node2, way, graph_cte.weight from graph_cte inner join short s on graph_cte.weight = s.weight;}