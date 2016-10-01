create table status (
  id int primary key auto_increment,
  content varchar(255) not null,
  topic_id int not null,
  created int not null
);

insert into 
status
      (content, topic_id, created) 
values
      ("OK", 1, 11),
      ("ERROR", 1, 12),
      ("WARNING", 1, 13),
      ("OK", 2, 21),
      ("WARNING", 2, 22),
      ("ERROR", 2, 23),
      ("WARNING", 3, 31),
      ("ERROR", 3, 32);
      
select l.* from status l
inner join 
(
   select topic_id, max(created) as latest from status 
   group by topic_id
) r

on l.topic_id = r.topic_id and l.created = r.latest      

