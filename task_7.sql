create database task7
go
use task7
go
create table actor(
act_id int primary key,
act_fname char(20),
act_lname char(20),
act_gender char(1)
)
create table director(
dir_id int primary key,
dir_fname char(20),
dir_lname char(20)
)
create table movie(
mov_id int primary key,
mov_title char(50),
mov_year int,
mov_time int ,
mov_long char(50),
mov_dt_rel datetime2,
mov_rel_country char(5)
)
create table movie_direction(
dir_id int ,
mov_id int ,
primary key(dir_id,mov_id),
foreign key (dir_id) references director(dir_id), 
foreign key (mov_id) references movie(mov_id) 
)

create table movie_cast(
act_id int,
mov_id int,
role char(30),
primary key(act_id,mov_id),
foreign key (mov_id)references movie(mov_id),
foreign key (act_id) references actor(act_id)
)
create table reviewer(
rev_id int primary key,
rev_name char(30)
)
create table genres(
gen_id int primary key,
gen_title char(20)
)
create table movie_genres(
mov_id int,
gen_id int,
primary key(mov_id,gen_id),
foreign key (mov_id)references movie(mov_id),
foreign key (gen_id) references genres(gen_id)
)
create table rating(
mov_id int,
rev_id int,
rev_stars int,
num_o_ratings int,
primary key(mov_id,rev_id),
foreign key (mov_id)references movie(mov_id),
foreign key (rev_id) references reviewer(rev_id)
)