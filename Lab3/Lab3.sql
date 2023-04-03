CREATE TABLE Genre(
genre_id DECIMAL(12) NOT NULL PRIMARY KEY,
genre_name VARCHAR(64) NOT NULL);

CREATE TABLE Creator(
creator_id DECIMAL(12) NOT NULL PRIMARY KEY,
first_name VARCHAR(64) NOT NULL,
last_name VARCHAR(64) NOT NULL);

CREATE TABLE Movie_series(
movie_series_id DECIMAL(12) NOT NULL PRIMARY KEY,
genre_id DECIMAL(12) NOT NULL,
creator_id DECIMAL(12) NOT NULL,
series_name VARCHAR(255) NOT NULL,
suggested_price DECIMAL(8,2) NULL,
FOREIGN KEY (genre_id) references Genre(genre_id),
FOREIGN KEY (creator_id) references CREATOR(creator_id));

CREATE TABLE Movie(
movie_id DECIMAL(12) NOT NULL PRIMARY KEY,
movie_series_id DECIMAL(12) NOT NULL,
movie_name VARCHAR(64) NOT NULL,
length_in_minutes DECIMAL(4),
FOREIGN KEY (movie_series_id) references Movie_series(movie_series_id));



insert into Genre(genre_id, genre_name)
values(1,'Fantasy');
insert into Genre(genre_id, genre_name)
values(2,'Family Film');
insert into Genre(genre_id, genre_name)
values(3,'Action');

insert into Creator(creator_id, first_name, last_name)
values(11,'George', 'Lucas');
insert into Creator(creator_id, first_name, last_name)
values(12,'John', 'Lasseter');
insert into Creator(creator_id, first_name, last_name)
values(13,'John', 'Tolkien');
insert into Creator(creator_id, first_name, last_name)
values(14,'Jun', 'Favreau');

insert into Movie_series(movie_series_id, genre_id, creator_id, series_name, suggested_price)
values(101,1,11,'Star wars',129.99);
insert into Movie_series(movie_series_id, genre_id, creator_id, series_name, suggested_price)
values(102,2,12,'Toy Story',22.13);
insert into Movie_series(movie_series_id, genre_id, creator_id, series_name, suggested_price)
values(103,1,13,'Lord of the Ring',NULL);
insert into Movie_series(movie_series_id, genre_id, creator_id, series_name, suggested_price)
values(104,3,14,'007',55.87);



insert into Movie(movie_id, movie_series_id, movie_name, length_in_minutes)
values(1001,101,'Episode I: The Phantom Menace',136);
insert into Movie(movie_id, movie_series_id, movie_name, length_in_minutes)
values(1002,101,'Episode II: Attack of the Clones',142);
insert into Movie(movie_id, movie_series_id, movie_name, length_in_minutes)
values(1003,101,'Episode III: Revenge of the Sith',140);
insert into Movie(movie_id, movie_series_id, movie_name, length_in_minutes)
values(1004,101,'Episode IV: A New Hope',121);
insert into Movie(movie_id, movie_series_id, movie_name, length_in_minutes)
values(1005,102,'Toy Story',121);
insert into Movie(movie_id, movie_series_id, movie_name, length_in_minutes)
values(1006,102,'Toy Story 2',135);
insert into Movie(movie_id, movie_series_id, movie_name, length_in_minutes)
values(1007,102,'Toy Story 3',148);
insert into Movie(movie_id, movie_series_id, movie_name, length_in_minutes)
values(1008,103,'The Lord of the Rings: The Fellowship of the Ring',228);
insert into Movie(movie_id, movie_series_id, movie_name, length_in_minutes)
values(1009,103,'The Lord of the Rings: The Two Towers',235);
insert into Movie(movie_id, movie_series_id, movie_name, length_in_minutes)
values(1010,103,'The Lord of the Rings: The Return of the King',200);
insert into Movie(movie_id, movie_series_id, movie_name, length_in_minutes)
values(1011,104,'007',126);
insert into Movie(movie_id, movie_series_id, movie_name, length_in_minutes)
values(1012,104,'007 2',122);
insert into Movie(movie_id, movie_series_id, movie_name, length_in_minutes)
values(1013,104,'007 3',131);



select count(*) AS movie_id
from Movie


select format(min(suggested_price), '$.00') AS least_price 
from Movie_series;

select format(max(suggested_price), '$.00') AS most_expensice
from Movie_series


Select series_name, format(max(suggested_price), '$.00') AS price,
count(distinct movie_id) AS number_of_movie 
from Movie_series
join Movie on Movie.movie_series_id = Movie_series.movie_series_id
group by series_name;


Select genre_name, count(distinct movie_id) AS number_of_movie 
from Movie_series
join Genre on Genre.genre_id = Movie_series.genre_id
left join Movie
on Movie_series.movie_series_id = Movie.movie_series_id
group by genre_name
having count(distinct movie_name)>=7;



select series_name, sum(length_in_minutes) AS sun_time
from Movie_series
join Movie on Movie.movie_series_id = Movie_series.movie_series_id
group by series_name
having sum(length_in_minutes)>=600;


select concat(first_name,' ',last_name) AS Creators,
count(Movie.movie_name) AS number_Fantasy_Movies
from Movie_series
join Movie on Movie_series.movie_series_id = Movie.movie_series_id
join Genre on Movie_series.genre_id = Genre.genre_id
and genre.genre_name = 'Family Film'
right join Creator on Creator.creator_id = Movie_series.creator_id
group by concat(first_name,' ',last_name)
order by number_Fantasy_Movies DESC;