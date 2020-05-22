CREATE TABLE store (
    id SERIAL PRIMARY KEY, 
    department_branch_id integer(10) references NOT NULL UNIQUE, 
    name_ varchar(255) NOT NULL UNIQUE, 
    city varchar(255) NOT NULL, 
    street varchar(255) NOT NULL, 
    house_number integer(10) NOT NULL, 
    coordinate_x float(10) NOT NULL, 
    coordinate_y float(10) NOT NULL, 
    opening_date date NOT NULL, 
    closing_date date, 
    count_product integer(10) NOT NULL, 
    count_product_stockroom integer(10) NOT NULL
);
CREATE TABLE client (
    id SERIAL PRIMARY KEY, 
    email varchar(255) UNIQUE, 
    phone varchar(255) UNIQUE, 
    full_name varchar(255) NOT NULL
);
CREATE TABLE product (
    id SERIAL PRIMARY KEY, 
    name_ varchar(255) NOT NULL UNIQUE, 
    price numeric(19, 0) NOT NULL
    descryption varchar(255)
);
CREATE TABLE department (
    id SERIAL PRIMARY KEY, 
    name_ varchar(255) NOT NULL UNIQUE, 
    opening_date date NOT NULL
    closing_date date
);
CREATE TABLE department_branch (
    id SERIAL PRIMARY KEY, 
    department_id integer(10) references NOT NULL UNIQUE, 
    name_ varchar(255) NOT NULL UNIQUE, 
    specification varchar(255) NOT NULL, 
    opening_date date NOT NULL
    closing_date date
);
CREATE TABLE employee (
    id SERIAL PRIMARY KEY, 
    full_name varchar(255) NOT NULL, 
    phone varchar(255) NOT NULL UNIQUE,
    email varchar(255) NOT NULL UNIQUE, 
    registration varchar(255) NOT NULL, 
    birth_date date NOT NULL
);
CREATE TABLE supplier (
    id SERIAL PRIMARY KEY, 
    name_ varchar(255) NOT NULL UNIQUE, 
    phone varchar(255) NOT NULL UNIQUE, 
    email varchar(255) NOT NULL UNIQUE, 
    city varchar(255) NOT NULL, 
    street varchar(255) NOT NULL, 
    house_number integer(10) NOT NULL
);
CREATE TABLE supply (
    id SERIAL PRIMARY KEY, 
    product_id integer(10) references NOT NULL UNIQUE, 
    supplier_id integer(10) references NOT NULL UNIQUE, 
    employee_id integer(10) references NOT NULL UNIQUE, 
    store_id integer(10) references NOT NULL UNIQUE, 
    count_product integer(10) NOT NULL, 
    date_delivery date NOT NULL, 
    price numeric(19, 0) NOT NULL
);
CREATE TABLE employee_department_branch (
    id SERIAL PRIMARY KEY, 
    employee_id integer(10) references NOT NULL UNIQUE, 
    department_branch_id integer(10) references NOT NULL UNIQUE, 
    date_start date NOT NULL, 
    date_finish date 
);
CREATE TABLE employee_store (
    id SERIAL PRIMARY KEY,     
    employee_id integer(10) references NOT NULL UNIQUE, 
    store_id integer(10) references NOT NULL UNIQUE, 
    date_start date NOT NULL, 
    date_finish date
);
CREATE TABLE employee_department (
    id SERIAL PRIMARY KEY, 
    employee_id integer(10) references NOT NULL UNIQUE, 
    department_id integer(10) references NOT NULL UNIQUE, 
    date_start date NOT NULL, 
    date_finish date
);
CREATE TABLE schedule (
    id SERIAL PRIMARY KEY, 
    employee_id integer(10) references NOT NULL UNIQUE, 
    time_start timestamp NOT NULL, 
    time_end timestamp NOT NULL
);
CREATE TABLE stock (
    id SERIAL PRIMARY KEY, 
    name_ varchar(255) NOT NULL UNIQUE, 
    value_ varchar(255) NOT NULL
);
CREATE TABLE purchase (
    id SERIAL PRIMARY KEY, 
    client_id integer(10) references NOT NULL UNIQUE, 
    stock_id integer(10) references NOT NULL UNIQUE, 
    store_id integer(10) references NOT NULL UNIQUE, 
    date_purchase date NOT NULL, 
    price numeric(19, 0) NOT NULL
);
CREATE TABLE price_history (
    id SERIAL PRIMARY KEY, 
    product_id integer(10) references NOT NULL UNIQUE, 
    date_change date NOT NULL, 
    new_price numeric(19, 0) NOT NULL
);
CREATE TABLE product_store (
    id SERIAL PRIMARY KEY, 
    product_id integer(10) references NOT NULL UNIQUE, 
    store_id integer(10) references NOT NULL UNIQUE 
);
CREATE TABLE product_propeties (
    id SERIAL PRIMARY KEY,  
    product_id integer(10) references NOT NULL UNIQUE, 
    attribute varchar(255) NOT NULL, 
    value_propeties varchar(255) NOT NULL
);

INSERT INTO store (department_branch_id ,name_, city, street, house, coordinate_x, coordinate_y, street, opening_date, closing_date, count_product, count_product_stockroom)
VALUES(8,'Thompson Group', 'North Hailieshire', 'Norma Landing', 17, 634.5, 895.8, 'Norma Landing', '2018-02-18T10:32:53.507Z', '2019-12-05T08:08:19.238Z', 13, 16),   
(11,'Schmeler - Prosacco', 'Lake Weston', 'Carlo Place', 159, 4150, 547, 'Carlo Place', '2013-04-26T13:14:04.613Z', '2014-05-20T06:50:48.711Z', 129, 63),
(6,'Predovic Group', 'Port Gregory', 'Bartholome Via', 144, 4086, 470, 'Bartholome Via', '2015-05-17T05:45:59.087Z', '2015-12-24T19:59:08.072Z', 225, 491),
(1,'Zboncak - Donnelly', 'Chetton', 'Karelle Neck', 19, 610, 678.2857142857143, 'Karelle Neck', '2015-01-16T04:23:50.776Z', , 203, 319),     
(3,'Champlin LLC', 'Vivienborough', 'Funk Village', 85, 632.2, 861.5, 'Funk Village', '2012-04-19T11:14:02.131Z', , 299, 405),
(2,'Dietrich, Beier and Torp', 'East Wilhelmine', 'Carmella Trafficway', 183, 179.875, 2378, 'Carmella Trafficway', '2016-11-03T02:30:12.139Z', '2017-03-05T10:12:51.855Z', 185, 477),
(10,'Koch, Paucek and Runolfsson', 'Kirlinland', 'Blanche Skyway', 50, 408.3333333333333, 519.2, 'Blanche Skyway', '2010-10-20T05:29:44.664Z', , 150, 466),
(7,'Ledner Group', 'Lake Kelvinfurt', 'Nayeli Forges', 163, 346.6, 1097.25, 'Nayeli Forges', '2019-06-19T11:50:02.909Z', , 93, 195),
(4,'Johns and Sons', 'Alessandroshire', 'Tromp Village', 91, 549.4285714285714, 270.75, 'Tromp Village', '2016-06-24T13:06:32.516Z', , 172, 255),
(9,'Strosin, Krajcik and Kreiger', 'Sipesfurt', 'Kane Burgs', 73, 340.125, 985.3333333333334, 'Kane Burgs', '2017-01-25T07:55:25.552Z', , 174, 193),
(5,'Douglas, Streich and OReilly', 'Janicktown', 'Leta Mountain', 139, 712.6666666666666, 221.5, 'Leta Mountain', '2013-03-28T03:14:22.373Z', , 9, 2);
INSERT INTO client (email, phone, full_name)
VALUES('Keven_Runte@gmail.com', '730.975.6345 x752', 'Roxanne Pagac'),
('Casimer_Herman92@hotmail.com', '(188) 877-5781 x401', 'Dax Hirthe'),
('Theodore.Heidenreich@yahoo.com', '1-457-577-2424', 'Lillian Mitchell'),
('Wyman.Cassin32@yahoo.com', '(091) 040-7911', 'Jeffry Carroll'),
('Sarah_Shanahan@yahoo.com', '131.963.4910', 'Vallie Smith'),
('Aryanna.Gorczany@yahoo.com', '661-953-5913 x2566', 'Sim Murazik'),
('Delilah.Walsh@yahoo.com', '390.180.9862 x9516', 'Beaulah Koss'),
('Noel.Swift@hotmail.com', '(588) 161-8722 x794', 'Keven Raynor'),
('Vladimir.Emard@yahoo.com', '055.995.5597', 'Ubaldo Wilderman'),
('Aliza0@hotmail.com', '893.212.4010', 'Michale Hammes'),
('Eveline1@hotmail.com', '829-193-7281 x4640', 'Ansel Wuckert');
INSERT INTO product (name_, price)
VALUES('Chicken', '700.00'),
('Fish', '516.00'),
('Bacon', '173.00'),
('Soap', '289.00'),
('Pizza', '424.00'),
('Car', '440.00'),
('Hat', '606.00'),
('Gloves', '101.00'),
('Pizza', '756.00'),
('Roulette', '151.00'),
('Cherry', '852.00');
INSERT INTO department (name_, opening_date, closing_date)
VALUES('Cormier - Connelly', '2014-03-04T12:20:04.098Z', '2018-02-03T08:02:04.803Z'),
('Schaefer, Kub and Larson', '2016-07-14T16:42:37.939Z', ),
('Gutkowski LLC', '2016-07-05T18:27:19.955Z', '2018-07-13T09:58:59.829Z'),
('Will - Zieme', '2012-05-04T23:08:52.682Z', ),
('Kohler - Greenholt', '2014-08-03T03:28:31.478Z', '2015-09-22T13:35:38.834Z'),
('Hermiston Inc', '2014-08-30T09:34:57.997Z', '2015-04-08T11:06:56.477Z'),
('Yost LLC', '2019-09-14T04:10:38.282Z', '2020-12-03T05:47:04.672Z'),
('Gibson Inc', '2011-11-05T13:07:53.097Z', ),
('Hayes, Bechtelar and Bartoletti', '2013-04-04T08:38:09.447Z', '2017-01-11T23:33:02.829Z'),
('Ledner and Sons', '2016-01-11T21:38:27.072Z', '2018-03-26T01:09:54.077Z'),
('Stiedemann LLC', '2014-01-24T17:45:32.743Z', '2014-11-11T17:53:48.844Z');
INSERT INTO department_branch (department_branch_id, name_, specification, opening_date, closing_date)
VALUES(11, 'Johns Group', 'Grocery', '2010-06-26T14:53:42.444Z', ),
(7, 'Herman, Jerde and Christiansen', 'Baby', '2012-12-16T11:02:53.245Z', '2013-05-08T15:43:05.257Z'),
(9, 'Rempel, Wintheiser and Williamson', 'Home', '2018-07-11T01:55:20.906Z', ),
(6, 'Stark, Aufderhar and Jenkins', 'Clothing', '2018-07-21T01:09:58.383Z', ),
(3, 'Frami - Lind', 'Toys', '2015-09-22T05:52:30.473Z', ),
(10, 'Keeling, Feest and Ankunding', 'Health', '2012-01-02T04:19:42.562Z', ),
(2, 'Orn Group', 'Movies', '2012-08-07T19:00:15.038Z', ),
(1, 'Schimmel - Lockman', 'Beauty', '2014-03-28T19:27:38.612Z', ),
(5, 'Hilll, Adams and Mohr', 'Industrial', '2017-01-31T03:15:30.343Z', '2018-06-07T17:40:36.839Z'),
(4, 'Green - Hills', 'Outdoors', '2013-11-16T11:07:57.829Z', '2018-10-16T16:09:44.945Z'),
(8, 'Cummerata Inc', 'Music', '2014-06-26T18:09:21.913Z', );
INSERT INTO employee (full_name, phone, email, registration, birth_date)
VALUES('Izabella Marvin', '162-721-8498', 'Marietta_Reinger@yahoo.com', 'Padberg Bypass 47', '2017-02-02T00:42:17.354Z'),
('Jayson Parker', '998-999-3701 x551', 'John_Metz@hotmail.com', 'Boyer Valley 106', '2011-04-11T22:08:13.734Z'),
('Jaunita Wintheiser', '745-187-2224', 'Cara_Lehner@hotmail.com', 'Thiel Crossroad 200', '2019-04-24T07:40:17.580Z'),
('Constantin Herman', '971.216.4984 x953', 'Lamar.Turcotte@yahoo.com', 'Rice Stravenue 186', '2016-09-09T08:42:14.485Z'),
('Elmo Bruen', '155-739-4306', 'Audie.Cronin79@hotmail.com', 'Dallin Roads 182', '2014-01-17T09:45:20.438Z'),
('Ariel Senger', '981-000-5749', 'Elena34@yahoo.com', 'Christiansen Streets 49', '2010-09-22T12:51:42.905Z'),
('Vanessa Renner', '(912) 260-3849 x66207', 'Arthur_Lindgren@hotmail.com', 'Powlowski Union 145', '2013-06-08T02:33:13.909Z'),
('Quinn Bashirian', '(066) 139-3199 x93005', 'Halle.Bins@hotmail.com', 'McClure Glen 159', '2016-08-05T07:37:41.369Z'),
('Alexanne Kirlin', '933-167-0749 x3864', 'Modesto.Aufderhar@yahoo.com', 'Romaguera Lodge 21', '2015-08-13T13:10:03.019Z'),
('Moriah Kihn', '1-383-203-8188', 'Aleen_Walker@gmail.com', 'Tracy Divide 94', '2018-04-14T04:15:50.584Z'),
('Cassandre Crist', '(162) 586-1653 x44288', 'Mack.Considine19@gmail.com', 'Kovacek Meadow 137', '2012-04-06T07:58:47.245Z');
INSERT INTO supplier (name_, city, street, house, phone, email)
VALUES('Bosco Inc', '740-619-9176', 'Nestor_Cronin94@gmail.com', 'New Kielville', 'Kasandra Isle', 19),
('Ryan Inc', '685.462.4849 x80583', 'Lea_Leannon@hotmail.com', 'Rhiannonfort', 'Gina Cliffs', 42),
('Hilll Group', '1-603-080-7455 x492', 'Kamron.Baumbach@yahoo.com', 'Crooksview', 'McClure Fields', 94),
('Gulgowski Inc', '(867) 195-0312', 'Elyse23@hotmail.com', 'New Brielle', 'Danny Ranch', 11),
('Rutherford - Lockman', '1-033-173-3384 x2942', 'Macey95@hotmail.com', 'East Jayce', 'Schmeler Lodge', 30),
('Lemke Inc', '502-155-8131 x1835', 'Abe76@hotmail.com', 'Howeland', 'Friesen Cliff', 167),
('Yost and Sons', '1-968-774-6110', 'Rowan.Block@hotmail.com', 'Pollichmouth', 'Kathlyn Fort', 55),
('Kessler Group', '1-059-791-5591', 'Luis_Jacobson@gmail.com', 'Buckridgeland', 'Leonard Villages', 134),
('Leffler and Sons', '1-417-604-4885 x6641', 'Ned99@yahoo.com', 'New Tressie', 'King Square', 171),
('Vandervort, Keebler and Raynor', '710-366-8427 x9407', 'Rubie28@hotmail.com', 'Tristintown', 'Marcia Ports', 136),
('Nader, Schiller and Mueller', '391-113-3678 x37494', 'Jordi32@yahoo.com', 'North Daija', 'Leopold Bypass', 158);
INSERT INTO supply (product_id, supplier_id, employee_id, store_id, count_product, date_delivery, price)
VALUES(1, 2, 9, 1, 342, '2016-10-17T12:32:51.310Z', 207.00),
(2, 3, 3, 5, 258, '2016-09-13T06:13:04.424Z', 319.00),
(12, 7, 6, 8, 8, '2013-10-01T10:47:34.752Z', 519.00),
(6, 11, 8, 2, 10, '2014-06-23T06:17:55.764Z', 247.00),
(9, 6, 4, 11, 10, '2015-10-25T09:17:15.375Z', 766.00),
(11, 10, 2, 10, 382, '2018-09-05T11:47:59.952Z', 88.00),
(10, 9, 11, 4, 161, '2014-10-26T16:28:34.593Z', 680.00),
(8, 4, 5, 9, 310, '2011-12-24T19:14:57.908Z', 457.00),
(4, 8, 10, 12, 354, '2014-11-22T21:35:59.067Z', 157.00),
(5, 5, 7, 7, 359, '2019-03-04T22:40:34.595Z', 251.00),
(7, 1, 1, 6, 13, '2020-04-06T22:04:54.637Z', 745.00);
INSERT INTO employee_department_branch(employee_id, department_branch_id, date_start, date_finish)
VALUES(5, 5, '2016-02-04T10:17:22.246Z', 2012-10-05T12:19:37.108Z),
(11, 4, '2014-03-07T05:42:03.525Z', ),
(7, 10, '2017-11-10T10:59:40.252Z', ),
(10, 9, '2014-09-09T05:59:50.303Z', ),
(8, 11, '2015-12-19T13:49:50.047Z', ),
(1, 6, '2014-06-20T07:47:37.998Z', ),
(6, 2, '2011-07-07T15:46:35.841Z', ),
(2, 3, '2018-03-12T05:26:00.911Z', '2018-12-18T13:40:53.842Z'),
(3, 8, '2020-04-16T05:41:10.922Z', ),
(9, 1, '2019-08-25T20:39:14.024Z', '2019-11-02T18:32:16.022Z'),
(4, 7, '2012-01-09T05:27:28.112Z', '2018-06-13T15:58:12.610Z');
INSERT INTO employee_store(employee_id, store_id, date_start, date_finish)
VALUES(1, 4, '2019-05-08T05:15:45.509Z', ),
(11, 2, '2018-11-08T15:01:33.873Z', '2019-03-09T08:48:31.882Z'),
(3, 1, '2013-04-23T20:30:35.655Z', '2018-12-07T23:57:21.174Z'),
(10, 8, '2015-02-23T06:40:36.962Z', ),
(5, 6, '2014-12-07T12:16:00.758Z', ),
(7, 10, '2015-03-09T11:53:21.119Z', '2016-10-16T22:15:29.957Z'),
(9, 7, '2014-10-13T10:47:44.688Z', ),
(8, 3, '2017-08-16T17:43:10.900Z', '2018-07-04T07:01:49.055Z'),
(4, 11, '2014-02-08T15:35:43.832Z', ),
(2, 9, '2013-04-06T05:15:13.647Z', '2015-06-07T23:32:48.510Z'),
(6, 5, '2012-01-10T04:35:17.727Z', );
INSERT INTO employee_department(employee_id, department_id, date_start, date_finish)
VALUE(1, 6, '2013-06-25T08:53:01.481Z', 2017-02-17T22:05:30.676Z),
(2, 7, '2017-10-24T18:10:58.702Z', ),
(3, 3, '2016-02-26T00:29:48.666Z', '2017-02-19T12:05:55.371Z'),
(10, 5, '2017-02-23T18:35:49.351Z', ),
(9, 9, '2011-08-30T00:58:00.335Z', '2018-10-27T19:38:51.013Z'),
(8, 4, '2013-07-18T06:01:04.206Z', ),
(7, 8, '2020-04-09T08:46:49.670Z', ),
(5, 1, '2015-10-12T00:39:23.076Z', '2017-11-23T03:28:50.526Z'),
(6, 10, '2012-04-07T15:40:02.454Z', ),
(11, 2, '2012-10-14T15:07:39.927Z', '2012-11-19T08:07:16.873Z'),
(4, 11, '2014-12-23T22:13:29.715Z', '2016-04-11T12:01:28.026Z');
INSERT INTO schedule(employee_id, time_start, time_end)
VALUES(4, 'Fri May 22 2020 8:00:00 GMT+0300 (GMT+03:00)', 'Fri May 22 2020 18:00:00 GMT+0300 (GMT+03:00)'),
(8, 'Fri May 22 2020 8:00:00 GMT+0300 (GMT+03:00)', 'Fri May 22 2020 18:00:00 GMT+0300 (GMT+03:00)'),
(7, 'Fri May 22 2020 8:00:00 GMT+0300 (GMT+03:00)', 'Fri May 22 2020 18:00:00 GMT+0300 (GMT+03:00)'),
(2, 'Fri May 22 2020 8:00:00 GMT+0300 (GMT+03:00)', 'Fri May 22 2020 18:00:00 GMT+0300 (GMT+03:00)'),
(3, 'Fri May 22 2020 8:00:00 GMT+0300 (GMT+03:00)', 'Thu May 21 2020 18:00:00 GMT+0300 (GMT+03:00)'),
(5, 'Fri May 22 2020 8:00:00 GMT+0300 (GMT+03:00)', 'Fri May 22 2020 18:00:00 GMT+0300 (GMT+03:00)'),
(6, 'Fri May 22 2020 13:00:00 GMT+0300 (GMT+03:00)', 'Fri May 22 2020 23:00:00 GMT+0300 (GMT+03:00)'),
(11, 'Fri May 22 2020 13:00:00 GMT+0300 (GMT+03:00)', 'Fri May 22 2020 23:00:00 GMT+0300 (GMT+03:00)'),
(10, 'Fri May 22 2020 13:00:00 GMT+0300 (GMT+03:00)', 'Fri May 22 2020 23:00:00 GMT+0300 (GMT+03:00)'),
(9, 'Fri May 22 2020 13:00:00 GMT+0300 (GMT+03:00)', 'Fri May 22 2020 23:00:00 GMT+0300 (GMT+03:00)'),
(1, 'Fri May 22 2020 17:00:00 GMT+0300 (GMT+03:00)', 'Fri May 22 2020 3:00:00 GMT+0300 (GMT+03:00)');
INSERT INTO stock (name_, value_)
VALUES('Hat', '76%'),
('Vegetables', '41%'),
('Becon', '26%'),
('Sports', '45%'),
('Music', '75%'),
('Grocery', '56%'),
('Industrial', '69%'),
('Tools', '67%'),
('Jewelery', '49%'),
('Roulette', '7%'),
('Health', '12%');
INSERT INTO purchase(client_id, stock_id, store_id, date_purchase, price)
VALUES(1, 2, 9, '2018-10-17T12:32:51.310Z', 2007.00),
(2, 3, 3, '2016-09-13T06:13:04.424Z', 3139.00),
(12, 7, 6, '2016-07-01T10:47:34.752Z', 519.00),
(6, 11, 8, '2018-12-23T06:17:55.764Z', 2417.00),
(9, 6, 4, '2017-10-25T09:17:15.375Z', 766.00),
(11, 10, 2, '2018-09-05T11:47:59.952Z', 838.00),
(10, 9, 11, '2014-01-26T16:28:34.593Z', 660.00),
(8, 4, 5, '2017-12-24T19:14:57.908Z', 517.00),
(4, 8, 10, '2014-11-22T21:35:59.067Z', 1587.00),
(5, 5, 7, '2020-03-04T22:40:34.595Z', 2561.00),
(7, 1, 1, '2020-04-06T22:04:54.637Z', 365.00);
INSERT INTO (product_id, date_change, new_price)
VALUES(4, '2018-11-11T08:53:42.988Z', 443.00),
(1, '2014-06-25T02:54:47.810Z', 625.00),
(2, '2014-10-15T19:12:49.174Z', 90.00),
(8, '2013-08-23T04:30:33.426Z', 79.00),
(5, '2017-02-13T07:45:29.658Z', 731.00),
(7, '2018-12-14T08:05:09.811Z', 478.00),
(10, '2012-06-02T20:42:04.917Z', 115.00),
(3, '2018-11-30T10:15:32.429Z', 169.00),
(9, '2014-11-16T10:38:42.625Z', 56.00),
(11, '2012-06-28T12:59:58.307Z', 406.00),
(6, '2017-06-22T13:42:21.329Z', 683.00);
INSERT INTO product_store (product_id, store_id)
VALUES(10, 4),
(8, 7),
(7, 5),
(11, 3),
(4, 2),
(3, 9),
(5, 10),
(1, 1),
(6, 8),
(9, 11),
(2, 6);
INSERT INTO product_propeties (product_id, attribute, value_propeties)
VALUES(1, 'Weight', '5'),
(5, 'Color', 'Black'),
(2, 'Color', 'White'),
(7, 'Mass fraction of solids', '9.0 %'),
(10, 'Size', '5x10'),
(11, 'Weight', '3'),
(3, 'Weight', '1'),
(4, 'Weight', '0.5'),
(6, 'Fat content', '80.5%'),
(8, 'Size', '2x3'),
(9, 'Size', '5x7');