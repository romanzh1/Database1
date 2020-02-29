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
Select st.name, h.name, sth.date_finish, sth.date_start, (sth.date_finish-sth.date_start)/30 as mounth
From students st
Inner join students_hobbies sth
On st.id = sth.student_id
Inner join hobbies h
On h.id = sth.hobby_id
Where not sth.date_finish is null
Group by st.name, h.name, sth.date_finish, sth.date_start
