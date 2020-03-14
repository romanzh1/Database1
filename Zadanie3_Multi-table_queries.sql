--#1
Select st.name, st.surname, h.name
From students st
Inner join hobbies h
On st.id = h.id
--#2
Select st.*, min(sth.date_start)
From students st
Inner join students_hobbies sth
On st.id = sth.id
Where sth.date_finish is null
Group by st.id
Order by min
Limit 1
--#3
Select st.name, st.surname, st.score, avg(st.score), sum(h.risk)
From students st
Inner join students_hobbies sth
On st.id = sth.student_id
Inner join hobbies h
On h.id = sth.hobby_id
Group by st.name, st.surname, st.score
Having sum(h.risk) > 0.9 and st.score > (select avg(score) from students)
--#4
Select st.name, h.name, sth.date_finish, sth.date_start, 
(extract (month from age(sth.date_finish,sth.date_start)) + extract(year from age(sth.date_finish,sth.date_start)*12)) as mounth
From students st
Inner join students_hobbies sth
On st.id = sth.student_id
Inner join hobbies h
On h.id = sth.hobby_id
Where not sth.date_finish is null
Group by st.name, h.name, sth.date_finish, sth.date_start, mounth
--#5
WITH act_hob1 as (
select sth.student_id
From students_hobbies sth
Where sth.date_finish is null
Group by sth.student_id
Having count(*) > 1
)

Select st.name, st.surname, st.birth_date
From students st
Inner join act_hob1 ah
On st.id = ah.student_id
Where extract(year from age(now(),st.birth_date)) >= 20
--#6
Select st.n_group, avg(st.score)
From students st
Inner join students_hobbies sth
On st.id = sth.student_id
Where date_finish is null
Group by st.n_group
--#7
Select st.surname, st.n_group, h.risk, h.name, sth.date_start
From students st
Inner join students_hobbies sth
On st.id = sth.student_id
Inner join hobbies h
On h.id = sth.hobby_id
Where sth.date_finish is null
Order by sth.date_start
Limit 1
--#8
Select distinct h.name
From students st
Inner join students_hobbies sth
On st.id = sth.student_id
Inner join hobbies h
On h.id = sth.hobby_id
Where st.score = (Select max(score) from students)
--#9
Select st.surname, h.name
From students st
Inner join students_hobbies sth
On st.id = sth.student_id
Inner join hobbies h
On h.id = sth.hobby_id
Where st.score::varchar like '4%' and st.n_group::varchar like '2%' and sth.date_finish is null
