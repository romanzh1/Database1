SELECT st.name, st.surname, h.name
FROM students st
INNER JOIN hobbies h
ON st.id = h.id
