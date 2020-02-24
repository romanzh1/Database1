--#1.1
Select st.name, st.surname
From students st
Where st.score >= 4 and st.score <= 4.5
--#1.2
Select st.name, st.surname
From students st
Where not st.score < 4 and not st.score > 4.5
--#1.3
Select st.name, st.surname
From students st
Where st.score between 4 and 4.5
--#1.4
Select st.name, st.surname
From students st
Where not st.score between 0 and 4 and not st.score between 4.5 and 5
--#2
Select st.name, st.surname
From students st
WHERE st.n_group::varchar like '2%'
--#3
Select st.n_group, st.name, st.surname
From students st
Order by st.n_group, st.name
--#4
Select st.n_group, st.name, st.surname
From students st
Order by st.n_group, st.name
--#5
Select h.name, h.risk
From hobbies h
Where h.name = 'Футбол' or h.name = 'Хоккей'
--#6
Select sth.student_id, sth.hobby_id
From students_hobbies sth
Where sth.date_start > '2012-02-01' and sth.date_finish < '2019-12-01' and sth.student_id > 10
--#7
Select st.name, st. surname, st.score
From students st
Where st.score > 4.5
Order by st.score desc
--#8.1
Select st.name, st. surname, st.score
From students st
Where st.score > 4.5
Order by st.score desc
Limit 5
--#8.2
Select st.name, st. surname, st.score
From students st
Where st.score > 4.5
Order by st.score desc
Offset 2 limit 5
--#8.3
Select st.name, st. surname, st.score
From students st
Where st.score > 4.5
Order by st.score
Offset 8
--#9
Select h.name,
Case
	When h.risk >= 8 Then 'Очень высокий'
	When h.risk >= 6 and h.risk < 8 Then 'Высокий'
	When h.risk >= 4 and h.risk < 6 Then 'Средний'
	When h.risk >= 2 and h.risk < 4 Then 'Низкий'
	When h.risk < 2 Then 'Очень низкий'
End as risk
From hobbies h
--#10
Select h.name
From hobbies h
Order by h.risk desc
Limit 3
