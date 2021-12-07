{\rtf1\ansi\ansicpg1251\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red252\green33\blue37;}
{\*\expandedcolortbl;;\cssrgb\c100000\c23137\c18824;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs26 \cf2 //\uc0\u1082 \u1086 \u1075 \u1076 \u1072  \u1085 \u1091 \u1078 \u1077 \u1085  \u1087 \u1086 \u1080 \u1089 \u1082  \u1087 \u1086  \u1075 \u1086 \u1076 \u1091 \
create index yearOfPublishing_index on book (yearOfPublishing) using BTREE;\
\
//\uc0\u1082 \u1086 \u1075 \u1076 \u1072  \u1085 \u1091 \u1078 \u1077 \u1085  \u1087 \u1086 \u1080 \u1089 \u1082  \u1087 \u1086  \u1092 \u1072 \u1084 \u1080 \u1083 \u1080 \u1080 \
create index visitor_lastName_index on library_card (visitor_lastName) using brin;}