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
