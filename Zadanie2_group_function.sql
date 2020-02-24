Select st.n_group, count(st.n_group)
From students st
Group by st.n_group
Order by st.n_group desc
