--#1
Select st.n_group, count(st.n_group)
From students st
Group by st.n_group
Order by st.n_group desc
--#2
Select st.n_group, max(st.score)
From students st
Group by st.n_group
Order by st.n_group desc
--#3
Select count(distinct st.name)
From students st
--#5
SELECT st.n_group, Avg(st.score)
From Students st
Group by st.n_group
Order by st.n_group
--#6
Select st.n_group, Avg(st.score)
From Students st
Group by st.n_group
Order by avg desc
Limit 1                 
--#7
Select st.n_group, Avg(st.score)
From Students st
Group by st.n_group
Having avg(st.score) <= 4.5
Order by avg
--#8
Select st.n_group, count(st.name), max(st.score),avg(st.score), min(st.score)
From Students st
Group by st.n_group
Order by st.n_group

