//когда нужен поиск по году
create index yearOfPublishing_index on book (yearOfPublishing) using BTREE;

//когда нужен поиск по фамилии
create index visitor_lastName_index on library_card (visitor_lastName) using brin;
