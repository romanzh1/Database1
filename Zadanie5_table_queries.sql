--#1
Select st.*
From store st
Where substr(city,1,12) like 'North Callie'
Group by st.id
Having st.opening_date > current_date
--#2
Select sc.*, st.name as store_name
From schedule sc
Inner join employee_store es on sc.employee_id = es.employee_id
Inner join store st on es.store_id = st.id
Where sc.day like 'Thursday' and st.name = 'Johns and Sons'
--#3
Select cl.*, sum(pu.price) as sum_purchase
From purchase pu
Inner join client cl on cl.id = pu.client_id
Where current_date - pu.date_purchase < 15
Group by cl.id
Having sum(pu.price) > 10000
--#4
Select cl.*, sum(pu.price) as sum_purchase
From purchase pu
Inner join client cl on cl.id = pu.client_id
Where current_date - pu.date_purchase < 240 / 24
Group by cl.id
Order by sum_purchase desc
Limit (Select count(*) * 34 / 100 from (Select cl.*, sum(pu.price) as sum_purchase
From purchase pu
Inner join client cl on cl.id = pu.client_id
Where current_date - pu.date_purchase < 240 / 24
Group by cl.id
Order by sum_purchase desc) as uk)
--#5
Select cl.*, sum(pu.price) as sum_purchase, round(avg(pu.price)) as avg_purchase
From purchase pu
Inner join client cl on cl.id = pu.client_id
Where current_date - pu.date_purchase < 240 / 24
Group by cl.id
Order by sum_purchase desc
Limit (Select count(*) * 50 / 100 from (Select cl.*, sum(pu.price) as sum_purchase
From purchase pu
Inner join client cl on cl.id = pu.client_id
Where current_date - pu.date_purchase < 240 / 24
Group by cl.id
Order by sum_purchase desc) as uk)
--#8
Select *
From schedule
Where employee_id = 6
--#10
Select pu.client_id, to_char(pu.date_purchase, 'Day') as often_day, to_char(pu.time_purchase, 'HH12:MI:SS') as often_time
From purchase pu
Group by pu.client_id, often_day, often_time
Order by pu.client_id
--#11
/*
Если пользователь отказывается от карты лояльности, то необходимо удалить данные нём, кроме его ID,
поскольку если удалить всю информацию о пользователе, то также пропадёт информация о 
времени его покупок и структура базы данных будет нарушена.
Сделать это можно следующим запросом, используя его ID без кавычек
*/
Update client
Set email = null and phone = null and full_name = null
Where id = 0
--#12
Select em.*, count(em.id) as coun_supply
From employee em
Inner join supply su on su.employee_id = em.id
Where store_id = 9 and supplier_id = 4
Group by em.id
Order by em.id desc
Limit 1
--#15
/*
Лучше всего хранить зарплату сотрудников в таблице сотрудников, где и укаазаны все их данные
Для начала добавим новый столбец с дефолтным значением в 30000
*/
Alter table employee
Add column salary numeric(9, 2) default 30000
-- Наша зарплата не может быть NULL, поэтому добавим NOT NULL в столбец
Alter table employee alter column salary
Set not null
-- Запрплата всех сотрудников на данный момент 30000, далее можно написать Update и изменять её
-- Например следующим запросом можно установить её = 40000 7 сотруднику
Update employee
Set salary = 40000
Where id = 7