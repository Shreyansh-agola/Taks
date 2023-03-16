create database amazon;
use amazon;

create table food(

   foodId int auto_increment,
   restaurantId int,
   itemname varchar(10),
   itemdescription varchar(30),
   quntity varchar(15),
   price int,
   foodreview int,
   
   primary key (foodId),
   foreign key (restaurantId)references restaurant(restaurantId)

);

insert into food 
values ('1', '2', 'sev-khamni', 'spicy', '120 g', '80/-', '4.8');

insert into food 
values ('2', '1', 'mexican', 'hot&spicy', '180 g', '180/-', '3.8');


insert into food 
values ('3', '3', 'italiyan', 'sweet', '2.5 Kg', '480/-', '2');

insert into food 
values ('4', '2', 'gujrati', 'yammy', '120 g', '180/-', '4');

create table orderinfo(
   
   orderId int auto_increment,
   foodId int,
   customerId int,
   restaurantId int,
   
   orderitem varchar(50),
   orderdate varchar(10),
   ordertime varchar(10),
   numberofitem int,
   totalprice int,
   
   primary key(orderId),
   foreign key(foodId) references food(foodId),
   foreign key(customerId) references customer(customerId),
   foreign key(restaurantId) references restaurant(restaurantId)
);

insert into orderinfo
values ('1', '1', '1', '1', 'maxican and gujrati', '1/1/23', '4:00 pm', '2', '580');

insert into orderinfo
values ('2', '3', '4', '4', 'south indian', '3/3/23', '5:00 pm', '1', '240');

insert into orderinfo
values ('3', '4', '2', '3', 'maxican', '2/3/23', '6:00 pm', '1', '180');

insert into orderinfo
values ('4', '2', '1', '2', 'italiyan', '1/3/23', '7:00 pm', '1', '320');


create table delivery(

   deliveryId int auto_increment,
   customerId int,
   restaurantId int,
   orderId int,
   paymentId int,
   
   deliveryboyname varchar(25),
   deliveryaddress varchar(30),
   estimatedtime varchar(20),
   deliverypersongender varchar(5),
   
   primary key (deliveryId),
   foreign key(customerId) references customer(customerId),
   foreign key(restaurantId) references restaurant(restaurantId),
   foreign key(orderId) references orderinfo(orderId),
   foreign key(paymentId) references payment(paymentId)
);

insert into delivery
values ('1','4','1','4','1','diwan','12, madhav ni pol','20 min', 'male');

insert into delivery
values ('2','3','2','2','4','suresh','70, girivar banglows','45 min', 'male');

insert into delivery
values ('3','2','3','3','2','jyoti','tamari iicha hoy tya','11 min', 'female');

insert into delivery
values ('4','1','4','1','3','hitehs','tops technologies','05 min', 'male');

create table payment(

   paymentId int auto_increment,
   customerId int,
   orderId int,
   
   methodofpayment varchar(10),
   paymentdetails varchar(20),
   paymentprice int,
   success varchar(3),
   fail varchar(2),
   
   primary key(paymentId),
   foreign key(customerId)references customer(customerId),
   foreign key(orderId)references orderinfo(orderId)

);

insert into payment
values ('1', '2', '4', 'cash', '280 rupes cash', '280', 'yes', 'no');

insert into payment
values ('2', '1', '3', 'online', 'gpay', '320', 'yes', 'no');

insert into payment
values ('3', '4', '2', 'card', 'card number: 12457896', '560', 'yes', 'no');

insert into payment
values ('4', '3', '1', 'cash', '400 rupes cash', '400', 'yes', 'no');