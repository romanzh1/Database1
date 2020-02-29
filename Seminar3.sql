--Вывод пересечений студентов и хобби
Select st.*
From  students st
Inner join students_hobbies sh
On st.id = sh.student_id
--Вывод студентов которые есть на пересечениях и нет на пересечениях
Select *
From  students st
Left join students_hobbies sh
On st.id = sh.student_id
--Вывод студентов которые есть в хобби(каждому хобби присвоен студент)
Select *
From  students st
Right join students_hobbies sh
On st.id = sh.student_id
--совпадает с left
Select *
From  students st
Full outer join students_hobbies sh
On st.id = sh.student_id
--нет связи студента с хобби, у студента нет хобби
Select *
From  students st
Full outer join students_hobbies sh
On st.id = sh.student_id
Where sh.student_id is null
--Вывод пересечений всех трёх таблиц
Select *
From  students st
Inner join students_hobbies sh
On st.id = sh.student_id
Inner join hobbies h
On h.id = sh.hobby_id
--Вывод одноимёнцев из одной таблицы
Select *
From  students st1
Inner join students st2
On st1.id != st2.id and st1.surname = st2.surname
