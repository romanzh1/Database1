--#1
Select st.n_group, count(st.n_group)
From students st
Group by st.n_group
Order by st.n_group desc
--#2
Select st.n_group, avg(st.score)
From students st
Group by st.n_group
Order by st.n_group desc
--#3
Select count(distinct st.name)
From students st
--#5-
Select avg(st.score)
From students st
--#6 ?
                 
--#7 ?
Select count(st.n_group), avg(st.score), st.n_group
From students st
Where avg(st.score) > 3.5
Group by n_group
