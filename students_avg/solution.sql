create table students (
  id int not null,
  name varchar(100) not null default 'abc',
  primary key(id)
);
  
insert into students (id, name)
values (1,'abc'),(2,'def'),(3,'ghi');

create table courses (
  id int not null,
  name varchar(50) not null,
  primary key(id)
);

insert into courses (id, name)
values (1,'math'),(2,'literature');

create table grades (
  id int not null,
  studentId int not null,
  courseId int not null,
  grade int not null default 0,
  primary key(id),
  foreign key (studentId)
  	references students(id),
  foreign key (courseId)
  	references courses(id)
);

insert into grades (id, studentId, courseId, grade)
values (1,1,1,8),(2,1,2,9),(3,2,1,7),(4,2,2,9);

-- Solution
select s.name, avg(g.grade) as average
from students s
inner join grades g
on s.id = g.studentId
group by g.studentId
having average > 8;
