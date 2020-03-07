--#1 разделить слово функция
Select substr('слово',1,3)
--#2 разделить группу по символам
Select substr(st.n_group::varchar,1,1)
From students st
--#3 вывод студентов 2 и 3 курса и их среднего балла
Select substr(st.n_group::varchar,1,1), avg(st.score)
From students st
Group by substr(st.n_group::varchar,1,1)
