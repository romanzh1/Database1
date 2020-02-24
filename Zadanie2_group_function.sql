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
--#4
Select count(avg(st.n_group))
From students st
Where st.ngroup like '20__' or st.ngroup like '22__'
