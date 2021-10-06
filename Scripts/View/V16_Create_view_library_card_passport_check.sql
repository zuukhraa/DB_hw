create view library_card_passport_check
as select * from library_card
where passport = 9066424581
with local check option;
