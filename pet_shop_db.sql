
-- Discount (bảng phụ) 
-- Pet thiếu nhiều in4
drop database shop_pet;

create database shop_pet;

use shop_pet;

create  table shop_pet.`Account`(
	id int  NOT NULL AUTO_INCREMENT primary key,
    username nvarchar(100) not null,
    `password` nvarchar(100) not null,
	`role` nvarchar(100) not null,

created_at Date,
deactive_at Date,
deactive_reason nvarchar(1000) 
);

create table shop_pet.Customer(
id int  NOT NULL AUTO_INCREMENT primary key ,
	firstName nvarchar(100) not null,
    lastName nvarchar(100) not null,
    gender boolean not null,
    `address` nvarchar(100) not null,
    
    birth_of_date DATE not null,
    phone varchar(11) not null,
account_id int,
FOREIGN KEY (account_id) REFERENCES `Account`(id)
);
ALTER TABLE shop_pet.Customer
  ADD email nvarchar(100) not null
	AFTER`address`;
    
create table shop_pet.OrderInfo(
id int  NOT NULL AUTO_INCREMENT primary key ,
customer_name nvarchar(200) not null, 
phone varchar(11),
address_detail nvarchar(1000) not null,
street nvarchar(100) not null,
city nvarchar(100) not null,

account_id int,
FOREIGN KEY (account_id) REFERENCES `Account`(id)
);

create table shop_pet.Category (
id int  NOT NULL AUTO_INCREMENT primary key ,
`name` nvarchar(100) not null,
`description` nvarchar(1000) not null ,
image varchar(1000) 
);

create table shop_pet.SubCategory(
id int  NOT NULL AUTO_INCREMENT primary key ,
`name` nvarchar(100) not null,
`description` nvarchar(1000) not null,

category_id int not null,
FOREIGN KEY (category_id) REFERENCES Category(id)
);


create table shop_pet.Origin(
id int  NOT NULL AUTO_INCREMENT primary key ,
region nvarchar(100) not null
);

create table shop_pet.Pet(
id int  NOT NULL AUTO_INCREMENT primary key ,
date_of_birth DATE not null,
health_status nvarchar(100) not null,
gender boolean not null,
`weight` float not null,
color nvarchar(100) not null,
vaccinated boolean not null, -- tiem phong
identification nvarchar(1000) not null -- dac diem nhan dang


);

create table shop_pet.Product(
id int  NOT NULL AUTO_INCREMENT primary key,
`name` nvarchar(100) not null,
`code`  nvarchar(100) not null,
price float not null,
quantity int not null, 
`description` nvarchar(1000) not null,
deleted_at Date null,

pet_id int null,
FOREIGN KEY (pet_id) REFERENCES Pet(id),

subcategory_id int ,
FOREIGN KEY (subcategory_id) REFERENCES SubCategory(id),

origin_id int not null,
FOREIGN KEY (origin_id) REFERENCES Origin(id)
);

create  table shop_pet.`ProductImage`(
	id int  NOT NULL AUTO_INCREMENT primary key ,
    image_url nvarchar(1000) not null,

product_id int not null,
FOREIGN KEY (product_id) REFERENCES Product(id)
);

create table shop_pet.Shipping(
id int  NOT NULL AUTO_INCREMENT primary key ,
phone varchar(11) not null,
start_at Datetime not null,
done_at Datetime null,
cancel_at Datetime null,
shipping_price float not null
);

create table shop_pet.`Order` (
id int  NOT NULL AUTO_INCREMENT primary key ,
customer_name varchar(100) not null, 
customer_phone varchar (11) not null,
customer_address varchar (1000) not null,
created_at Datetime not null,
`status` varchar (100),  -- status of Admin access Odder
total_price float,

shipping_id int null,
FOREIGN KEY (shipping_id) REFERENCES Shipping(id),
account_id int,
FOREIGN KEY (account_id) REFERENCES `Account`(id)
);

create table shop_pet.OrderItem(
id int  NOT NULL AUTO_INCREMENT primary key,
product_name nvarchar(100) not null,
product_image varchar(1000) not null,
price float not null,
quantity int not null,

product_id int not null,
FOREIGN KEY (product_id) REFERENCES Product(id),
order_id int not null,
FOREIGN KEY (order_id) REFERENCES `Order`(id)
);

create table shop_pet.Feedback (
id int  NOT NULL AUTO_INCREMENT primary key ,
content nvarchar(100) not null,
star int not null,
created_at Datetime not null,
updated_at Datetime null,
is_deleted boolean null,

order_item_id int not null,
FOREIGN KEY (order_item_id) REFERENCES OrderItem(id)
);
create table shop_pet.Cart (
id int  NOT NULL AUTO_INCREMENT primary key,
price float not null,
account_id int not null,
FOREIGN KEY (account_id) REFERENCES Account(id)
);
create table shop_pet.CartItem(
id int  NOT NULL AUTO_INCREMENT primary key ,
quantity int not null,
cart_id int not null ,
FOREIGN KEY (cart_id) REFERENCES Cart(id),
product_id int not null,
FOREIGN KEY (product_id) REFERENCES Product(id)
);

-- insert accont (6)
INSERT INTO `Account` (id, username, `password`, `role`, created_at, deactive_at, deactive_reason)
VALUES (1 , 'Admin', '123', 'ADMIN' , '2022-12-12', null,null);
INSERT INTO `Account` (id, username, `password`, `role`, created_at, deactive_at, deactive_reason)
VALUES (2 , '0989898989', '123', 'SHIPPER' , '2022-11-12', null,null);
INSERT INTO `Account` (id, username, `password`, `role`, created_at, deactive_at, deactive_reason)
VALUES (3 , 'User2', '123', 'CUSTOMER' , '2022-10-12', null,null);
INSERT INTO `Account` (id, username, `password`, `role`, created_at, deactive_at, deactive_reason)
VALUES (4 , 'User3', '123', 'CUSTOMER' , '2022-8-1', null,null);
INSERT INTO `Account` (id, username, `password`, `role`, created_at, deactive_at, deactive_reason)
VALUES (5 , 'User4', '123', 'CUSTOMER' , '2021-6-11', null,null);
INSERT INTO `Account` (id, username, `password`, `role`, created_at, deactive_at, deactive_reason)
VALUES (6 , 'User5', '123', 'CUSTOMER' , '2021-7-11', null,null);
-- insert customer (5)
INSERT INTO Customer (id, firstname, lastName, gender, address,email, birth_of_date, phone,account_id)
VALUES (1 , 'Hieu', 'Ha', true ,'Long Bien','yamamoto1@gmail.com','2002-12-12', '095472947',2);
INSERT INTO Customer (id, firstname, lastName, gender, address,email, birth_of_date, phone,account_id)
VALUES (2 , 'Hoang', 'Long', true ,'Bien Phu','yamamoto2@gmail.com','2000-01-11', '094142247',3);
INSERT INTO Customer (id, firstname, lastName, gender, address,email, birth_of_date, phone,account_id)
VALUES (3 , 'ha', 'huynh', false ,'Son Tay','yamamoto3@gmail.com','2002-02-12', '095372947',4);
INSERT INTO Customer (id, firstname, lastName, gender, address,email, birth_of_date, phone,account_id)
VALUES (4 , 'ha', 'huy', true ,'Nam Dinh','yamamoto4@gmail.com','2002-02-12', '095482947',5);
INSERT INTO Customer (id, firstname, lastName, gender, address,email, birth_of_date, phone,account_id)
VALUES (5 , 'hong', 'huy', true ,'Thanh Cong','yamamoto5@gmail.com','2002-02-12', '095483947',6);
-- insert OrderInfo(5)
INSERT INTO OrderInfo (id, customer_name, phone, address_detail, street, city, account_id)
VALUES (1 , 'ha huynh', '095372947' ,'189','Son Tay','HaNoi',1 );
INSERT INTO OrderInfo (id, customer_name, phone, address_detail, street, city, account_id)
VALUES (2 , 'Hieu Ha', '095372947' ,'25','Long Bien','HaNoi',1 );
INSERT INTO OrderInfo (id, customer_name, phone, address_detail, street, city, account_id)
VALUES (3 , 'Hoang Long', '094142247' ,'10','Long Bien','HaNoi',1 );
INSERT INTO OrderInfo (id, customer_name, phone, address_detail, street, city, account_id)
VALUES (4 , 'ha huy', '095482947' ,'88','Long Bien','HaNoi',5 );
INSERT INTO OrderInfo (id, customer_name, phone, address_detail, street, city, account_id)
VALUES (5 , 'hong huy', '095483947' ,'99','Long Bien','HaNoi',6);
-- insert category
INSERT INTO Category (id, `name`,`description`,image)
VALUES (1 , 'dog', '','http://i.imgur.com/2HfIoOtl.jpg');
INSERT INTO Category (id, `name`,`description`,image)
VALUES (2 , 'cat', '','https://lebaotinhbmt.com/uploads/gioi-thieu/2020_04/con-meo.jpg');
INSERT INTO Category (id, `name`,`description`,image)
VALUES (3 , 'accessory', '','https://i.petmart.vn/ups/1651809992.kinh-nghiem-tim-va-nhap-nguon-hang-thu-cung-gia-buon-si3.jpg');
INSERT INTO Category (id, `name`,`description`,image)
VALUES (4 , 'Food', '','https://lh3.googleusercontent.com/-2C8gHRi8E7Q/XBnUGz2pNpI/AAAAAAAAXdQ/JzZrCaPJni0KPgoTOQdTXUI7FRaLxzYuQCLcBGAs/s0/thuc-an-hat-kho-cho-meo.png');

-- insert subcategory
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (1 , 'Bulls', '',1);
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (2 , 'Husky', '',1);
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (3 , 'Akita Inu', '',1);
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (4 , 'Corgi', '',1);
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (5 , 'NewFoundLand', '',1);
--
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (6 , 'EnglandCat', '',2);
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (7 , 'Scottish Flod', '',2);
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (8 , 'Tuxedo', '',2);
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (9 , 'Somali', '',2);
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (10 , 'RussianCat', '',2);
--
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (11 , 'Dog Cage', '',3);
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (12 , 'Cat Cage', '',3);
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (13 , 'Dog Leash', '',3);
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (14 , 'Necklace', '',3);
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (15 , 'Clothes', '',3);
--
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (16 , 'Cat Food', '',4);
INSERT INTO SubCategory (id, `name`,`description`,category_id)
VALUES (17 , 'Dog Food', '',4);


-- insert origin
INSERT INTO Origin (id, region)
VALUES (1 , 'England');
INSERT INTO Origin (id, region)
VALUES (2 , 'VietNam');
INSERT INTO Origin (id, region)
VALUES (3 , 'France');
INSERT INTO Origin (id, region)
VALUES (4 , 'Canada');
INSERT INTO Origin (id, region)
VALUES (5 , 'China');
INSERT INTO Origin (id, region)
VALUES (6 , 'Russian');
INSERT INTO Origin (id, region)
VALUES (7 , 'Japan');
INSERT INTO Origin (id, region)
VALUES (8 , 'Wales');
INSERT INTO Origin (id, region)
VALUES (9 , 'Socctis');
INSERT INTO Origin (id, region)
VALUES (10 , 'USA');
-- insert pet
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('1', '2022-02-02', 'good', true, '38.3', 'black,white', true, 'black,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('2', '2022-02-02', 'good', false, '38.3', 'gloden', true, 'gloden');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('3', '2022-02-02', 'good', true, '38.3', 'white,black', true, 'white,black');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('4', '2022-02-02', 'good', true, '38.3', 'white', true, 'white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('5', '2022-02-02', 'good', true, '38.3', 'black,white', true, 'black,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('6', '2022-02-02', 'good', true, '38.3', 'black,white', true, 'black,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('7', '2022-02-02', 'good', false, '38.3', 'black,white', true, 'black,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('8', '2022-02-02', 'good', true, '38.3', 'gloden,white', true, 'gloden,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('9', '2022-02-02', 'good', true, '38.3', 'gloden,white', true, 'gloden,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('10', '2022-02-02', 'good', true, '38.3', 'brown', true, 'brown');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('11', '2022-02-02', 'good', false, '38.3', 'silver', true, 'silver');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('12', '2022-02-02', 'good', true, '38.3', 'gloden', true, 'gloden');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('13', '2022-02-02', 'good', false, '38.3', 'gloden', true, 'gloden');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('14', '2022-02-02', 'good', true, '38.3', 'gloden', true, 'gloden');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('15', '2022-02-02', 'good', false, '38.3', 'gloden', true, 'gloden');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('16', '2022-02-02', 'good', false, '38.3', 'gloden', true, 'gloden');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('17', '2022-02-02', 'good', false, '38.3', 'black', true, 'black');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('18', '2022-02-02', 'good', true, '38.3', 'brown', true, 'brown');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('19', '2022-02-02', 'good', false, '38.3', 'black,white', true, 'black,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('20', '2022-02-02', 'good', false, '38.3', 'white', true, 'white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('21', '2022-02-02', 'good', false, '38.3', 'white', true, 'white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('22', '2022-02-02', 'good', true, '38.3', 'orange,white', true, 'orange,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('23', '2022-02-02', 'good', false, '38.3', 'silver,white', true, 'silver,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('24', '2022-02-02', 'good', false, '38.3', 'silver,white', true, 'silver,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('25', '2022-02-02', 'good', false, '38.3', 'silver,white', true, 'silver,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('26', '2022-02-02', 'good', true, '38.3', 'brown', true, 'brown');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('27', '2022-02-02', 'good', false, '38.3', 'silver,white', true, 'silver,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('28', '2022-02-02', 'good', false, '38.3', 'silver', true, 'silver');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('29', '2022-02-02', 'good', false, '38.3', 'black,white', true, 'black,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('30', '2022-02-02', 'good', true, '38.3', 'black,white', true, 'black,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('31', '2022-02-02', 'good', false, '38.3', 'black,white', true, 'black,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('32', '2022-02-02', 'good', false, '38.3', 'black,white', true, 'black,white');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('33', '2022-02-02', 'good', true, '38.3', 'orange', true, 'orange');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('34', '2022-02-02', 'good', false, '38.3', 'orange', true, 'orange');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('35', '2022-02-02', 'good', false, '38.3', 'orange', true, 'orange');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('36', '2022-02-02', 'good', true, '38.3', 'orange', true, 'orange');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('37', '2022-02-02', 'good', false, '38.3', 'silver', true, 'silver');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('38', '2022-02-02', 'good', false, '38.3', 'silver', true, 'silver');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('39', '2022-02-02', 'good', true, '38.3', 'silver', true, 'silver');
INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES ('40', '2022-02-02', 'good', true, '38.3', 'silver', true, 'silver');

-- insert product

INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('1', 'Pit Bull Terrier', 'dog1-1', '300', '1', 'The Bulldog is a medium-sized breed of dog that originated in England. It is a muscular and sturdy dog with a distinctive wrinkled face, broad shoulders, and a compact body. Bulldogs have a short, smooth coat that can come in various colors, such as white, fawn, brindle, and pied. Bulldogs are known for their loyal, courageous, and affectionate nature. They are often described as gentle and friendly dogs that love to be around their owners and families. Despite their tough appearance, they are not typically aggressive towards people and are often considered good family pets.','1', '1','3');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('2', 'Bulldog', 'dog1-2', '270', '1', 'The Bulldog is a medium-sized breed of dog that originated in England. It is a muscular and sturdy dog with a distinctive wrinkled face, broad shoulders, and a compact body. Bulldogs have a short, smooth coat that can come in various colors, such as white, fawn, brindle, and pied. Bulldogs are known for their loyal, courageous, and affectionate nature. They are often described as gentle and friendly dogs that love to be around their owners and families. Despite their tough appearance, they are not typically aggressive towards people and are often considered good family pets.','2', '1','3');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('3', 'American Bully', 'dog1-3', '280', '1', 'The Bulldog is a medium-sized breed of dog that originated in England. It is a muscular and sturdy dog with a distinctive wrinkled face, broad shoulders, and a compact body. Bulldogs have a short, smooth coat that can come in various colors, such as white, fawn, brindle, and pied. Bulldogs are known for their loyal, courageous, and affectionate nature. They are often described as gentle and friendly dogs that love to be around their owners and families. Despite their tough appearance, they are not typically aggressive towards people and are often considered good family pets.','3', '1','3');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('4', 'Bulldog Anh', 'dog1-4', '250', '1', 'The Bulldog is a medium-sized breed of dog that originated in England. It is a muscular and sturdy dog with a distinctive wrinkled face, broad shoulders, and a compact body. Bulldogs have a short, smooth coat that can come in various colors, such as white, fawn, brindle, and pied. Bulldogs are known for their loyal, courageous, and affectionate nature. They are often described as gentle and friendly dogs that love to be around their owners and families. Despite their tough appearance, they are not typically aggressive towards people and are often considered good family pets.','4', '1','3');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('5', 'Husky Siberian', 'dog2-1', '500', '1', 'The Husky is a medium-sized working dog that originated in Siberia, Russia. They are best known for their striking appearance with thick, plush fur that comes in a variety of colors, such as black, white, gray, and red. Their almond-shaped eyes, which can be blue, brown, or a combination of both, give them a distinctive and captivating look. Huskies are highly active and energetic dogs that were originally bred for pulling sleds over long distances in harsh weather conditions. They are intelligent, independent, and have a strong sense of adventure, which makes them ideal for outdoor activities such as hiking, camping, and running.','5', '2','4');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('6', 'Husky Sakhalin', 'dog2-2', '450', '1', 'The Husky is a medium-sized working dog that originated in Siberia, Russia. They are best known for their striking appearance with thick, plush fur that comes in a variety of colors, such as black, white, gray, and red. Their almond-shaped eyes, which can be blue, brown, or a combination of both, give them a distinctive and captivating look. Huskies are highly active and energetic dogs that were originally bred for pulling sleds over long distances in harsh weather conditions. They are intelligent, independent, and have a strong sense of adventure, which makes them ideal for outdoor activities such as hiking, camping, and running.','6', '2','4');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('7', 'Husky Labrador', 'dog2-3', '480', '1', 'The Husky is a medium-sized working dog that originated in Siberia, Russia. They are best known for their striking appearance with thick, plush fur that comes in a variety of colors, such as black, white, gray, and red. Their almond-shaped eyes, which can be blue, brown, or a combination of both, give them a distinctive and captivating look. Huskies are highly active and energetic dogs that were originally bred for pulling sleds over long distances in harsh weather conditions. They are intelligent, independent, and have a strong sense of adventure, which makes them ideal for outdoor activities such as hiking, camping, and running.', '7','2','4');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('8', 'Samoyed.', 'dog2-4', '400', '1', 'The Husky is a medium-sized working dog that originated in Siberia, Russia. They are best known for their striking appearance with thick, plush fur that comes in a variety of colors, such as black, white, gray, and red. Their almond-shaped eyes, which can be blue, brown, or a combination of both, give them a distinctive and captivating look. Huskies are highly active and energetic dogs that were originally bred for pulling sleds over long distances in harsh weather conditions. They are intelligent, independent, and have a strong sense of adventure, which makes them ideal for outdoor activities such as hiking, camping, and running.', '8','2','4');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('9', 'Akita Inu Americian', 'dog3-1', '320', '1', 'The Akita Inu is a large, powerful breed of dog that originated in Japan. They are known for their strong and muscular build, with a broad head, triangular ears, and a thick double coat that can come in various colors, including white, brindle, and red. Akitas are loyal and affectionate dogs that form strong bonds with their families. They are independent and have a dignified and aloof personality, which can make them somewhat reserved towards strangers. However, with proper socialization, they can become friendly and welcoming towards new people.','9', '3','7');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('10', 'Akita Inu Japan', 'dog3-2', '340', '1', 'The Akita Inu is a large, powerful breed of dog that originated in Japan. They are known for their strong and muscular build, with a broad head, triangular ears, and a thick double coat that can come in various colors, including white, brindle, and red. Akitas are loyal and affectionate dogs that form strong bonds with their families. They are independent and have a dignified and aloof personality, which can make them somewhat reserved towards strangers. However, with proper socialization, they can become friendly and welcoming towards new people.','10', '3','7');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('11', 'Akita Inu Fra', 'dog3-3', '330', '1', 'The Akita Inu is a large, powerful breed of dog that originated in Japan. They are known for their strong and muscular build, with a broad head, triangular ears, and a thick double coat that can come in various colors, including white, brindle, and red. Akitas are loyal and affectionate dogs that form strong bonds with their families. They are independent and have a dignified and aloof personality, which can make them somewhat reserved towards strangers. However, with proper socialization, they can become friendly and welcoming towards new people.', '11','3','7');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('12', 'Akita Inu Ori', 'dog3-4', '300', '1', 'The Akita Inu is a large, powerful breed of dog that originated in Japan. They are known for their strong and muscular build, with a broad head, triangular ears, and a thick double coat that can come in various colors, including white, brindle, and red. Akitas are loyal and affectionate dogs that form strong bonds with their families. They are independent and have a dignified and aloof personality, which can make them somewhat reserved towards strangers. However, with proper socialization, they can become friendly and welcoming towards new people.', '12','3','7');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('13', 'CPembroke Welsh Corgi ', 'dog4-1', '400', '1', 'The Corgi is a small breed of dog that originated in Wales, United Kingdom. They are known for their unique appearance, with a long body, short legs, and large, erect ears. They have a short, thick coat that can come in various colors, including red, sable, and tri-color. Corgis are friendly and playful dogs that have a big personality despite their small size. They are intelligent, trainable, and have a strong desire to please their owners, which makes them great family pets. Corgis are also known for their strong herding instincts, and they may try to herd their owners, children, or other animals in the household.', '13','4','8');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('14', 'Cardigan Welsh Corgi', 'dog4-2', '350', '1', 'The Corgi is a small breed of dog that originated in Wales, United Kingdom. They are known for their unique appearance, with a long body, short legs, and large, erect ears. They have a short, thick coat that can come in various colors, including red, sable, and tri-color. Corgis are friendly and playful dogs that have a big personality despite their small size. They are intelligent, trainable, and have a strong desire to please their owners, which makes them great family pets. Corgis are also known for their strong herding instincts, and they may try to herd their owners, children, or other animals in the household.', '14','4','8');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('15', 'Welsh Corgi', 'dog4-3', '600', '1', 'The Corgi is a small breed of dog that originated in Wales, United Kingdom. They are known for their unique appearance, with a long body, short legs, and large, erect ears. They have a short, thick coat that can come in various colors, including red, sable, and tri-color. Corgis are friendly and playful dogs that have a big personality despite their small size. They are intelligent, trainable, and have a strong desire to please their owners, which makes them great family pets. Corgis are also known for their strong herding instincts, and they may try to herd their owners, children, or other animals in the household.', '15','4','8');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('16', 'Corgi', 'dog4-4', '460', '1', 'The Corgi is a small breed of dog that originated in Wales, United Kingdom. They are known for their unique appearance, with a long body, short legs, and large, erect ears. They have a short, thick coat that can come in various colors, including red, sable, and tri-color. Corgis are friendly and playful dogs that have a big personality despite their small size. They are intelligent, trainable, and have a strong desire to please their owners, which makes them great family pets. Corgis are also known for their strong herding instincts, and they may try to herd their owners, children, or other animals in the household.', '16','4','8');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('17', 'NewFoundLand Landbado', 'dog5-1', '700', '1', 'The Newfoundland, also known as "Newfies," is a large breed of dog that originated in Newfoundland, Canada. They are known for their impressive size and strength, with a thick, water-resistant coat that can come in various colors, such as black, brown, and gray. Newfoundlands are friendly, loyal, and gentle dogs that have a reputation for being excellent family pets. They are highly intelligent and trainable, and their calm and patient nature makes them great with children and other pets. Newfies are also known for their love of water and are excellent swimmers.','17', '5','7');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('18', 'NewFoundLand Tanza', 'dog5-2', '750', '1', 'The Newfoundland, also known as "Newfies," is a large breed of dog that originated in Newfoundland, Canada. They are known for their impressive size and strength, with a thick, water-resistant coat that can come in various colors, such as black, brown, and gray. Newfoundlands are friendly, loyal, and gentle dogs that have a reputation for being excellent family pets. They are highly intelligent and trainable, and their calm and patient nature makes them great with children and other pets. Newfies are also known for their love of water and are excellent swimmers.','18', '5','7');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('19', 'NewFoundLand Vizzi', 'dog5-3', '800', '1', 'The Newfoundland, also known as "Newfies," is a large breed of dog that originated in Newfoundland, Canada. They are known for their impressive size and strength, with a thick, water-resistant coat that can come in various colors, such as black, brown, and gray. Newfoundlands are friendly, loyal, and gentle dogs that have a reputation for being excellent family pets. They are highly intelligent and trainable, and their calm and patient nature makes them great with children and other pets. Newfies are also known for their love of water and are excellent swimmers.', '19','5','7');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('20', 'NewFoundLand Likka', 'dog5-4', '1000', '1', 'The Newfoundland, also known as "Newfies," is a large breed of dog that originated in Newfoundland, Canada. They are known for their impressive size and strength, with a thick, water-resistant coat that can come in various colors, such as black, brown, and gray. Newfoundlands are friendly, loyal, and gentle dogs that have a reputation for being excellent family pets. They are highly intelligent and trainable, and their calm and patient nature makes them great with children and other pets. Newfies are also known for their love of water and are excellent swimmers.','20', '5','7');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('21', 'EnglandCat Liver', 'cat1-1', '400', '1', 'The EnglandCat is a medium-sized breed of cat that originated in Scotland. They are known for their distinctive ears, which fold forward and downward, giving them a unique and adorable appearance. Their ears are a result of a natural genetic mutation. Scottish Folds have a round face, large, round eyes, and a sturdy build. They have a dense, plush coat that can come in a variety of colors and patterns, including tabby, solid, and bicolor.','21' ,'6','1');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('22', 'EnglandCat Cheseal', 'cat1-2', '380', '1', 'The EngLandCat  is a medium-sized breed of cat that originated in Scotland. They are known for their distinctive ears, which fold forward and downward, giving them a unique and adorable appearance. Their ears are a result of a natural genetic mutation. Scottish Folds have a round face, large, round eyes, and a sturdy build. They have a dense, plush coat that can come in a variety of colors and patterns, including tabby, solid, and bicolor','22', '6','1');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('23', 'EnglandCat Northwith', 'cat1-3', '360', '1', 'The EngLandCat  is a medium-sized breed of cat that originated in Scotland. They are known for their distinctive ears, which fold forward and downward, giving them a unique and adorable appearance. Their ears are a result of a natural genetic mutation. Scottish Folds have a round face, large, round eyes, and a sturdy build. They have a dense, plush coat that can come in a variety of colors and patterns, including tabby, solid, and bicolor','23', '6','1');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('24', 'EnglandCat Manchester', 'cat1-4', '450', '1', 'The EnglandCat is a medium-sized breed of cat that originated in Scotland. They are known for their distinctive ears, which fold forward and downward, giving them a unique and adorable appearance. Their ears are a result of a natural genetic mutation. Scottish Folds have a round face, large, round eyes, and a sturdy build. They have a dense, plush coat that can come in a variety of colors and patterns, including tabby, solid, and bicolor', '24','6','1');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('25', 'Scottish Flod Monza', 'cat2-1', '540', '1', 'The Scottish Fold is a medium-sized breed of cat that originated in Scotland. They are known for their distinctive ears, which fold forward and downward, giving them a unique and adorable appearance. Their ears are a result of a natural genetic mutation. Scottish Folds have a round face, large, round eyes, and a sturdy build. They have a dense, plush coat that can come in a variety of colors and patterns, including tabby, solid, and bicolor','25', '7','9');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('26', 'Scottish Flod Linki', 'cat2-2', '555', '1', 'The Scottish Fold is a medium-sized breed of cat that originated in Scotland. They are known for their distinctive ears, which fold forward and downward, giving them a unique and adorable appearance. Their ears are a result of a natural genetic mutation. Scottish Folds have a round face, large, round eyes, and a sturdy build. They have a dense, plush coat that can come in a variety of colors and patterns, including tabby, solid, and bicolor','26', '7','9');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('27', 'Scottish Flod Paris', 'cat2-3', '480', '1', 'The Scottish Fold is a medium-sized breed of cat that originated in Scotland. They are known for their distinctive ears, which fold forward and downward, giving them a unique and adorable appearance. Their ears are a result of a natural genetic mutation. Scottish Folds have a round face, large, round eyes, and a sturdy build. They have a dense, plush coat that can come in a variety of colors and patterns, including tabby, solid, and bicolor','27', '7','9');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('28', 'Scottish Flod Tangta', 'cat2-4', '320', '1', 'The Scottish Fold is a medium-sized breed of cat that originated in Scotland. They are known for their distinctive ears, which fold forward and downward, giving them a unique and adorable appearance. Their ears are a result of a natural genetic mutation. Scottish Folds have a round face, large, round eyes, and a sturdy build. They have a dense, plush coat that can come in a variety of colors and patterns, including tabby, solid, and bicolor','28', '7','9');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('29', 'Tuxedo Bomza', 'cat3-1', '607.9', '1', 'A Tuxedo cat is a type of domestic shorthair or longhair cat breed that has a distinctive black and white coat pattern that resembles a tuxedo suit. Tuxedo cats have black fur on their backs, tails, and legs, and white fur on their chests, bellies, and paws. Their distinctive coat pattern gives them a formal and sophisticated appearance, much like a person wearing a tuxedo. Tuxedo cats are not a specific breed, but rather a coat pattern that can be found in many different breeds, including the American Shorthair, the British Shorthair, and the Maine Coon.','29', '8','2');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('30', 'Tuxedo Tenki', 'cat3-2', '490', '1', 'A Tuxedo cat is a type of domestic shorthair or longhair cat breed that has a distinctive black and white coat pattern that resembles a tuxedo suit. Tuxedo cats have black fur on their backs, tails, and legs, and white fur on their chests, bellies, and paws. Their distinctive coat pattern gives them a formal and sophisticated appearance, much like a person wearing a tuxedo. Tuxedo cats are not a specific breed, but rather a coat pattern that can be found in many different breeds, including the American Shorthair, the British Shorthair, and the Maine Coon.', '30','8','2');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('31', 'Tuxedo Osaka', 'cat3-3', '477', '1', 'A Tuxedo cat is a type of domestic shorthair or longhair cat breed that has a distinctive black and white coat pattern that resembles a tuxedo suit. Tuxedo cats have black fur on their backs, tails, and legs, and white fur on their chests, bellies, and paws. Their distinctive coat pattern gives them a formal and sophisticated appearance, much like a person wearing a tuxedo. Tuxedo cats are not a specific breed, but rather a coat pattern that can be found in many different breeds, including the American Shorthair, the British Shorthair, and the Maine Coon.', '31','8','2');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('32', 'Tuxedo Landta', 'cat3-4', '543.5', '1', 'A Tuxedo cat is a type of domestic shorthair or longhair cat breed that has a distinctive black and white coat pattern that resembles a tuxedo suit. Tuxedo cats have black fur on their backs, tails, and legs, and white fur on their chests, bellies, and paws. Their distinctive coat pattern gives them a formal and sophisticated appearance, much like a person wearing a tuxedo. Tuxedo cats are not a specific breed, but rather a coat pattern that can be found in many different breeds, including the American Shorthair, the British Shorthair, and the Maine Coon.', '32','8','2');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('33', 'Somali Rome', 'cat4-1', '570', '1', 'The Somali cat is a breed of domestic cat that originated in the United States. It is a medium-sized cat with a long, slender body, long legs, and a bushy tail. The Somali cat fur is its most distinctive feature, with a long, silky coat that comes in various shades of red, ruddy, blue, and fawn. The coat is ticked, meaning that each individual hair has bands of different colors, giving it a wild, exotic look. The Somali cat has large, almond-shaped eyes that are usually green or gold, and a small, triangular head with large, pointy ears. They are intelligent, active, and affectionate cats that enjoy playing and interacting with their owners. The Somali cat is also known for being vocal and having a chirpy, trilling meow that is unique to the breed.', '33','9','10');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('34', 'Somali Juve', 'cat4-2', '550', '1', 'The Somali cat is a breed of domestic cat that originated in the United States. It is a medium-sized cat with a long, slender body, long legs, and a bushy tail. The Somali cat fur is its most distinctive feature, with a long, silky coat that comes in various shades of red, ruddy, blue, and fawn. The coat is ticked, meaning that each individual hair has bands of different colors, giving it a wild, exotic look. The Somali cat has large, almond-shaped eyes that are usually green or gold, and a small, triangular head with large, pointy ears. They are intelligent, active, and affectionate cats that enjoy playing and interacting with their owners. The Somali cat is also known for being vocal and having a chirpy, trilling meow that is unique to the breed.', '34','9','10');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('35', 'Somali Venncie', 'cat4-3', '490', '1', 'The Somali cat is a breed of domestic cat that originated in the United States. It is a medium-sized cat with a long, slender body, long legs, and a bushy tail. The Somali cat fur is its most distinctive feature, with a long, silky coat that comes in various shades of red, ruddy, blue, and fawn. The coat is ticked, meaning that each individual hair has bands of different colors, giving it a wild, exotic look. The Somali cat has large, almond-shaped eyes that are usually green or gold, and a small, triangular head with large, pointy ears. They are intelligent, active, and affectionate cats that enjoy playing and interacting with their owners. The Somali cat is also known for being vocal and having a chirpy, trilling meow that is unique to the breed.','35', '9','10');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('36', 'Somali Milan', 'cat4-4', '450', '1', 'The Somali cat is a breed of domestic cat that originated in the United States. It is a medium-sized cat with a long, slender body, long legs, and a bushy tail. The Somali cat fur is its most distinctive feature, with a long, silky coat that comes in various shades of red, ruddy, blue, and fawn. The coat is ticked, meaning that each individual hair has bands of different colors, giving it a wild, exotic look. The Somali cat has large, almond-shaped eyes that are usually green or gold, and a small, triangular head with large, pointy ears. They are intelligent, active, and affectionate cats that enjoy playing and interacting with their owners. The Somali cat is also known for being vocal and having a chirpy, trilling meow that is unique to the breed.', '36','9','10');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('37', 'RussianCat Masscova', 'cat5-1', '800', '1', 'The Russian Blue cat is a breed of domestic cat that originated in Russia. It is a medium-sized cat with a lean, muscular body and a short, dense, blue-gray coat that gives it a distinctive silvery appearance. The Russian Blue cat has a wedge-shaped head with large, pointed ears, and bright green eyes that are almond-shaped. They are known for being intelligent, affectionate, and playful cats that enjoy interactive play with their owners. The Russian Blue cat is also known for being quiet and gentle, making it a popular choice as a pet for families with children or for people who live in apartments. ','37', '10','6');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('38', 'RussianCat Moscow', 'cat5-2', '900', '1', 'The Russian Blue cat is a breed of domestic cat that originated in Russia. It is a medium-sized cat with a lean, muscular body and a short, dense, blue-gray coat that gives it a distinctive silvery appearance. The Russian Blue cat has a wedge-shaped head with large, pointed ears, and bright green eyes that are almond-shaped. They are known for being intelligent, affectionate, and playful cats that enjoy interactive play with their owners. The Russian Blue cat is also known for being quiet and gentle, making it a popular choice as a pet for families with children or for people who live in apartments. ','38', '10','6');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('39', 'RussianCat Kazan', 'cat5-3', '1200', '1', 'The Russian Blue cat is a breed of domestic cat that originated in Russia. It is a medium-sized cat with a lean, muscular body and a short, dense, blue-gray coat that gives it a distinctive silvery appearance. The Russian Blue cat has a wedge-shaped head with large, pointed ears, and bright green eyes that are almond-shaped. They are known for being intelligent, affectionate, and playful cats that enjoy interactive play with their owners. The Russian Blue cat is also known for being quiet and gentle, making it a popular choice as a pet for families with children or for people who live in apartments. ','39', '10','6');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES ('40', 'RussianCat sankt_peterburg', 'cat5-4', '1300', '1', 'The Russian Blue cat is a breed of domestic cat that originated in Russia. It is a medium-sized cat with a lean, muscular body and a short, dense, blue-gray coat that gives it a distinctive silvery appearance. The Russian Blue cat has a wedge-shaped head with large, pointed ears, and bright green eyes that are almond-shaped. They are known for being intelligent, affectionate, and playful cats that enjoy interactive play with their owners. The Russian Blue cat is also known for being quiet and gentle, making it a popular choice as a pet for families with children or for people who live in apartments. ','40', '10','6');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`, `subcategory_id`,`origin_id`) VALUES ('46', 'Dog Cage', 'dc-1', '799', '16', 'Dog cages are usually made of metal, plastic, or wire mesh, and come in a variety of sizes and shapes to accommodate different dog breeds and sizes. They typically have a door on one side for the dog to enter and exit, and may have a removable tray at the bottom for easy cleaning. Dog cages can be used for a variety of purposes, such as house training, travel, and providing a safe place for dogs to rest and relax. When used properly, a dog cage can help prevent destructive behavior, reduce stress and anxiety, and provide a sense of security for the dog. ', '11','5');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`, `subcategory_id`,`origin_id`) VALUES ('47', 'Cat Cage', 'cc-1', '499', '12', 'Cat cages are usually made of plastic, wire mesh, or a combination of both, and come in a variety of sizes and styles to accommodate different cat breeds and sizes. They typically have a door on one side for the cat to enter and exit, and may have a removable tray at the bottom for easy cleaning. Cat cages can be used for a variety of purposes, such as trips to the veterinarian, travel, and providing a safe place for cats to rest and relax.', '12','5');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`, `subcategory_id`,`origin_id`) VALUES ('48', 'Dog Leash', 'leash-1', '199', '35', 'A dog leash is a long, narrow strap or rope designed to attach to a dogs collar or harness and provide control and guidance while walking, running, or training. Dog leashes are usually made of nylon, leather, or other durable materials, and come in a variety of lengths and styles to accommodate different dog breeds and sizes. ', '13','5');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`, `subcategory_id`,`origin_id`) VALUES ('49', 'Necklace-Addidas', 'neck1', '29', '30', 'A necklace is a piece of jewelry that is worn around the neck. Necklaces come in a variety of styles and materials, including gold, silver, platinum, pearls, beads, and precious or semi-precious stones. They can be short or long, and may have a pendant or charm attached to them. Necklaces are often worn as a decorative accessory to complement an outfit or to add a touch of elegance to a formal occasion. Some necklaces are also worn for cultural or religious reasons. Necklaces can be purchased from a variety of jewelry stores or online retailers, and can range in price from affordable costume jewelry to high-end designer pieces.', '14','5');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`, `subcategory_id`,`origin_id`) VALUES ('41', 'Necklace-Nike', 'neck2', '199', '39', 'A necklace is a piece of jewelry that is worn around the neck. Necklaces come in a variety of styles and materials, including gold, silver, platinum, pearls, beads, and precious or semi-precious stones. They can be short or long, and may have a pendant or charm attached to them. Necklaces are often worn as a decorative accessory to complement an outfit or to add a touch of elegance to a formal occasion. Some necklaces are also worn for cultural or religious reasons. Necklaces can be purchased from a variety of jewelry stores or online retailers, and can range in price from affordable costume jewelry to high-end designer pieces.', '14','5');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`, `subcategory_id`,`origin_id`) VALUES ('42', 'Dog-Food', 'food1', '99', '56', 'Dog food is a type of food specifically formulated for dogs to provide them with the nutrients they need for healthy growth and maintenance. Dog food is available in a variety of types, including dry kibble, wet canned food, and semi-moist food. It is typically made with a combination of meat, grains, vegetables, and vitamins and minerals, and may be customized to meet the needs of different life stages, breeds, and health conditions. Some dog food is formulated for specific dietary needs, such as grain-free or hypoallergenic, and may be recommended by a veterinarian for dogs with food sensitivities or allergies.', '17','5');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`, `subcategory_id`,`origin_id`) VALUES ('43', 'Cat-Food', 'food2', '79', '47', 'Cat food is a type of food specifically formulated for cats to provide them with the nutrients they need for healthy growth and maintenance. Cat food is available in a variety of types, including dry kibble, wet canned food, and semi-moist food. It is typically made with a combination of meat, grains, vegetables, and vitamins and minerals, and may be customized to meet the needs of different life stages, breeds, and health conditions. Some cat food is formulated for specific dietary needs, such as grain-free or hypoallergenic, and may be recommended by a veterinarian for cats with food sensitivities or allergies. ', '16','5');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`, `subcategory_id`,`origin_id`) VALUES ('44', 'Clothes-dog-kaka', 'clo1', '29', '49', ' Clothing comes in a variety of styles, materials, and sizes, and can be worn for various occasions, including casual wear, work attire, and formal events.', '15','5');
INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`, `subcategory_id`,`origin_id`) VALUES ('45', 'Clothes-cat-haha', 'clo2', '19', '56', ' Clothing comes in a variety of styles, materials, and sizes, and can be worn for various occasions, including casual wear, work attire, and formal events.', '15','5');


-- product img
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('1', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12069-1-1.jpg', '1');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('2', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12069-11-1.jpg', '1');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('3', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12069-8-1.jpg', '1');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('4', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12070-0.jpg', '2');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('5', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12070-10-1.jpg', '2');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('6', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12070-7-1.jpg', '2');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('7', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12067-0.jpg', '3');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('8', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12067-8-1.jpg', '3');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('9', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12067-7-1.jpg', '3');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('10', 'https://azpet.com.vn/wp-content/uploads/2021/08/Bull-Phap-Trang-C12359-1.jpg', '4');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('11', 'https://azpet.com.vn/wp-content/uploads/2021/08/Bull-Phap-Trang-C12359-5.jpg', '4');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('12', 'https://azpet.com.vn/wp-content/uploads/2021/08/Bull-Phap-Trang-C12359-7.jpg', '4');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('13', 'https://azpet.com.vn/wp-content/uploads/2022/06/C2285-C12955-1.jpg', '5');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('14', 'https://azpet.com.vn/wp-content/uploads/2022/06/C2285-C12955-5.jpg', '5');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('15', 'https://azpet.com.vn/wp-content/uploads/2022/06/C2285-C12955-3.jpg', '5');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('16', 'https://azpet.com.vn/wp-content/uploads/2022/08/C2653-C13155-1.jpg', '6');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('17', 'https://azpet.com.vn/wp-content/uploads/2022/08/C2653-C13155-3.jpg', '6');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('18', 'https://azpet.com.vn/wp-content/uploads/2022/08/C2653-C13155-4.jpg', '6');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('19', 'https://azpet.com.vn/wp-content/uploads/2022/05/C2215-C12918-1.jpg', '7');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('20', 'https://azpet.com.vn/wp-content/uploads/2022/05/C2215-C12918-4.jpg', '7');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('21', 'https://azpet.com.vn/wp-content/uploads/2022/05/C2215-C12918-3.jpg', '7');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('22', 'https://azpet.com.vn/wp-content/uploads/2021/12/C12585-1.jpg', '8');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('23', 'https://azpet.com.vn/wp-content/uploads/2021/12/C12585-4.jpg', '8');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('24', 'https://azpet.com.vn/wp-content/uploads/2021/12/C12585-3.jpg', '8');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('25', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12010-1.jpg', '9');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('26', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12010-3.jpg', '9');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('27', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12010-5.jpg', '9');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('28', 'https://azpet.com.vn/wp-content/uploads/2021/07/Akita-Inu-Do-Chay-C12011-1.jpg', '10');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('29', 'https://azpet.com.vn/wp-content/uploads/2021/07/Akita-Inu-Do-Chay-C12011-3.jpg', '10');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('30', 'https://azpet.com.vn/wp-content/uploads/2021/07/Akita-Inu-Do-Chay-C12011-9.jpg', '10');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('31', 'https://azpet.com.vn/wp-content/uploads/2021/10/Akita-Ven-C12473-1.jpg', '11');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('32', 'https://azpet.com.vn/wp-content/uploads/2021/10/Akita-Ven-C12473-6.jpg', '11');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('33', 'https://azpet.com.vn/wp-content/uploads/2021/10/Akita-Ven-C12473-2.jpg', '11');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('34', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12017-1.jpg', '12');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('35', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12017-8.jpg', '12');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('36', 'https://azpet.com.vn/wp-content/uploads/2021/06/C12017-4.jpg', '12');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('37', 'https://azpet.com.vn/wp-content/uploads/2022/09/C2783-C13195-1.jpg', '13');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('38', 'https://azpet.com.vn/wp-content/uploads/2022/09/C2783-C13195-4.jpg', '13');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('39', 'https://azpet.com.vn/wp-content/uploads/2022/09/C2783-C13195-3.jpg', '13');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('40', 'https://azpet.com.vn/wp-content/uploads/2022/09/C2722-C13172-1.jpg', '14');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('41', 'https://azpet.com.vn/wp-content/uploads/2022/09/C2722-C13172-4.jpg', '14');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('42', 'https://azpet.com.vn/wp-content/uploads/2022/09/C2722-C13172-6.jpg', '14');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('43', 'https://azpet.com.vn/wp-content/uploads/2022/09/C2723-C13173-1.jpg', '15');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('44', 'https://azpet.com.vn/wp-content/uploads/2022/09/C2723-C13173-3.jpg', '15');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('45', 'https://azpet.com.vn/wp-content/uploads/2022/09/C2722-C13172-6.jpg', '15');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('46', 'https://azpet.com.vn/wp-content/uploads/2022/09/C2756-C13194-2.jpg', '16');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('47', 'https://azpet.com.vn/wp-content/uploads/2022/09/C2756-C13194-5.jpg', '16');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('48', 'https://azpet.com.vn/wp-content/uploads/2022/09/C2756-C13194-1-1.jpg', '16');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('49', 'https://cdn.britannica.com/28/236728-050-CB8B5557/Black-Newfoundland-dog.jpg', '17');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('50', 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F47%2F2021%2F06%2F02%2Fnewfoundland-black-standing-grass-249332530-2000.jpg', '17');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('51', 'https://static.wikia.nocookie.net/thecompletedog/images/7/7a/NewDog-1.jpg/revision/latest?cb=20140207190322', '17');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('52', 'https://www.purina.co.uk/sites/default/files/styles/square_medium_440x440/public/2022-07/Newfoundland%202.jpg?h=adbf13f6&itok=2Zqkt4BU', '18');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('53', 'data:image/gif;base64,R0lGODlhAQABAIAAAP///////yH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==', '18');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('54', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN3CWm-BvvhZp4fSeFGjjxhb4rYPgrGws8eQ&usqp=CAU', '18');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('55', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcSLs_Ms7GK-wQFF27KrrMonvc9RhzyhV5OA&usqp=CAU', '19');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('56', 'https://newfoundlandpuppies.co.uk/images/index/puppy1.jpg', '19');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('57', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCqsBMmR9Rvga4IiJyWwgSm-riH83nPpfaROD9a8AltBIVBVM27qPdakz8LlMBhRFVOjM&usqp=CAU', '19');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('58', 'https://i.pinimg.com/originals/64/93/33/649333120cb3fedecd61b0cf9b6d77ce.jpg', '20');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('59', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqPhopQnIhWy17c6TLe-OOY4BrU_XroKx_10eDlueJS43jTEpTZTkz1gqLd5_lERn9Q6k&usqp=CAU', '20');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('60', 'https://www.akc.org/wp-content/uploads/2017/11/Great-Pyrenees-puppy-sittin-in-a-chair-outdoors.jpg', '20');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('61', 'https://azpet.com.vn/wp-content/uploads/2022/03/M680-M12391-1.jpg', '21');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('62', 'https://azpet.com.vn/wp-content/uploads/2022/03/M680-M12391-6.jpg', '21');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('63', 'https://azpet.com.vn/wp-content/uploads/2022/03/M680-M12391-5.jpg', '21');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('64', 'https://azpet.com.vn/wp-content/uploads/2022/05/M725-M12447-1.jpg', '22');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('65', 'https://azpet.com.vn/wp-content/uploads/2022/05/M725-M12447-5.jpg', '22');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('66', 'https://azpet.com.vn/wp-content/uploads/2022/05/M725-M12447-4.jpg', '22');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('67', 'https://azpet.com.vn/wp-content/uploads/2022/09/M836-M12537-1.jpg', '23');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('68', 'https://azpet.com.vn/wp-content/uploads/2022/09/M836-M12537-4.jpg', '23');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('69', 'https://azpet.com.vn/wp-content/uploads/2022/09/M836-M12537-3.jpg', '23');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('70', 'https://azpet.com.vn/wp-content/uploads/2022/09/M834-M12535-1.jpg', '24');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('71', 'https://azpet.com.vn/wp-content/uploads/2022/09/M834-M12535-2.jpg', '24');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('72', 'https://azpet.com.vn/wp-content/uploads/2022/09/M834-M12535-4.jpg', '24');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('73', 'https://azpet.com.vn/wp-content/uploads/2022/09/M833-M12534-1.jpg', '25');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('74', 'https://azpet.com.vn/wp-content/uploads/2022/09/M833-M12534-3.jpg', '25');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('75', 'https://azpet.com.vn/wp-content/uploads/2022/09/M833-M12534-5.jpg', '25');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('76', 'https://azpet.com.vn/wp-content/uploads/2022/09/M831-M12533-1.jpg', '26');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('77', 'https://azpet.com.vn/wp-content/uploads/2022/09/M831-M12533-3.jpg', '26');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('78', 'https://azpet.com.vn/wp-content/uploads/2022/09/M831-M12533-2.jpg', '26');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('79', 'https://azpet.com.vn/wp-content/uploads/2022/08/M823-M12524-1.jpg', '27');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('80', 'https://azpet.com.vn/wp-content/uploads/2022/08/M823-M12524-3.jpg', '27');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('81', 'https://azpet.com.vn/wp-content/uploads/2022/08/M823-M12524-4.jpg', '27');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('82', 'https://azpet.com.vn/wp-content/uploads/2022/08/M808-M12512-2.jpg', '28');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('83', 'https://azpet.com.vn/wp-content/uploads/2022/08/M808-M12512-5.jpg', '28');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('84', 'https://azpet.com.vn/wp-content/uploads/2022/08/M808-M12512-1.jpg', '28');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('85', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12089-1.jpg', '29');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('86', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12089-3.jpg', '29');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('87', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12089-4.jpg', '29');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('88', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12090-1.jpg', '30');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('89', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12090-4.jpg', '30');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('90', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12090-3.jpg', '30');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('91', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12088-1.jpg', '31');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('92', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12088-6.jpg', '31');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('93', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12088-7.jpg', '31');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('94', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12091-1.jpg', '32');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('95', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12091-6.jpg', '32');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('96', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12091-4.jpg', '32');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('97', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12109-1.jpg', '33');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('98', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12109-4.jpg', '33');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('99', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12109-7.jpg', '33');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('100', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12108-1.jpg', '34');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('101', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12108-4.jpg', '34');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('102', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12108-5.jpg', '34');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('103', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12107-1.jpg', '35');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('104', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12107-2.jpg', '35');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('105', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12107-5.jpg', '35');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('106', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12106-1.jpg', '36');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('107', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12106-6.jpg', '36');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('108', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12106-4.jpg', '36');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('109', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12097-1.jpg', '37');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('110', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12097-5.jpg', '37');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('111', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12097-2.jpg', '37');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('112', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12094-1.jpg', '38');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('113', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12094-7.jpg', '38');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('114', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12094-6.jpg', '38');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('115', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12096-1.jpg', '39');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('116', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12096-3.jpg', '39');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('117', 'https://azpet.com.vn/wp-content/uploads/2021/06/M12096-5.jpg', '39');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('118', 'https://www.thesprucepets.com/thmb/ElVgYbOSq5btlgsY9VhlTd5c4EY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/SiberianCatGettyJeanMichelSegaudEyeEm-48078e579913406a9303e5d954084d15.jpg', '40');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('119', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSprEl-2B5unW7Q_FsLt67nWI-rFGcz5mIdIxX81UQFX1bTdVX7P0oq6cb4n2TwYPrn7qI&usqp=CAU', '40');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('120', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkejk4hMjG6Q1k4Kp2lwVPHi3OABTlpLdBPLic1cb4YI_PgUyM4VGG1dTJptXbeLlKQ7w&usqp=CAU', '40');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('121', 'http://mobileimages.lowes.com/productimages/0412ea7a-2f00-4d8c-b1b6-728b237f1bd4/61260673.jpg', '46');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('122', 'https://m.media-amazon.com/images/I/51GBcDtKMzL._AC_.jpg', '47');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('123', 'https://m.media-amazon.com/images/I/71yFFUQNTuL.jpg', '48');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('124', 'https://i.pinimg.com/originals/e2/1d/9c/e21d9c12ee0f2a54f354fcbca1cf7882.jpg','49');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('125', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYD3zNTv6yWbcDE6qRztyxfH73P3Jf_v0iVQ&usqp=CAU', '41');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('126', 'https://happydog_en_sb.cstatic.io/440x440/f/69110/480x480/c90b13149a/hd-vet-new-product-slider-packshots-sensible-11kg-300g.png', '42');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('127', 'https://i5.walmartimages.com/asr/e8293bf3-224a-44ed-900e-50bcd5b05f53.fa165ce62944927e0a75aec98ae7775f.jpeg', '43');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('128', 'http://cdn.shopify.com/s/files/1/2150/0093/products/OliveSweatshirt_1.png?v=1641108240', '44');
INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES ('129', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLEiAxwrWOvWo0y5umHeFKCBZ_PR04D74XwQ&usqp=CAU', '45');
-- insert shipping
INSERT INTO `shop_pet`.`Shipping` (`id`, `phone`, `start_at`, `done_at`, `shipping_price`) VALUES ('1', '093456789', '2023-02-09 00:01:00', '2023-02-10 00:00:00', '100');
INSERT INTO `shop_pet`.`Shipping` (`id`, `phone`, `start_at`, `cancel_at`, `shipping_price`) VALUES ('2', '0809112233', '2023-02-09 00:02:00', '2023-02-10 00:00:00', '100');
INSERT INTO `shop_pet`.`Shipping` (`id`, `phone`, `start_at`,  `shipping_price`) VALUES ('3', '0977998822', '2023-03-09 00:00:00', '100');
INSERT INTO `shop_pet`.`Shipping` (`id`, `phone`, `start_at`, `done_at`, `shipping_price`) VALUES ('4', '0123458899', '2023-01-09 00:00:00', '2023-02-10 00:00:00', '100');

-- insert order
INSERT INTO `shop_pet`.`order` (`id`, `customer_name`, `customer_phone`, `customer_address`,  `created_at`, `status`,`total_price`, `shipping_id`, `account_id`) VALUES ('1','ha huynh', '095372947' ,'189 Son Tay, HaNoi', '2023-02-02 00:00:00', 'ACCEPT',1000, '1', '1');
INSERT INTO `shop_pet`.`order` (`id`, `customer_name`, `customer_phone`, `customer_address`, `created_at`, `status`,`total_price`, `shipping_id`, `account_id`) VALUES ('2', 'ha huynh', '095372947' ,'189 Son Tay, HaNoi', '2023-02-03 00:00:00', 'ACCEPT',1000, '2', '1');
INSERT INTO `shop_pet`.`order` (`id`, `customer_name`, `customer_phone`, `customer_address`, `created_at`,`status`,`total_price`, `shipping_id`, `account_id`) VALUES ('3','ha huynh', '095372947' ,'189 Son Tay, HaNoi', '2023-02-04 00:00:00', 'ACCEPT',1000, '3', '1');

INSERT INTO `shop_pet`.`order` (`id`, `customer_name`, `customer_phone`, `customer_address`, `created_at`, `status`,`total_price`, `shipping_id`, `account_id`) VALUES ('4', 'ha huynh', '095372947' ,'189 Son Tay, HaNoi', '2023-02-03 00:00:00', 'DENY',1000, null, '1');
INSERT INTO `shop_pet`.`order` (`id`, `customer_name`, `customer_phone`, `customer_address`, `created_at`,`status`,`total_price`, `shipping_id`, `account_id`) VALUES ('5','ha huynh', '095372947' ,'189 Son Tay, HaNoi', '2023-02-04 00:00:00', null,1000, null, '1');



-- insert orderitems
INSERT INTO `shop_pet`.`OrderItem` (`id`, `product_name`,`product_image`, `price`, `quantity`, `product_id`, `order_id`) VALUES ('1', 'Bulls-1','https://o.rada.vn/data/image/2021/04/15/Bo-phim-tom-and-jerry.jpg', '3000', '1', '1', '1');
INSERT INTO `shop_pet`.`OrderItem` (`id`, `product_name`, `product_image`,`price`, `quantity`, `product_id`, `order_id`) VALUES ('2', 'Husky-1','https://o.rada.vn/data/image/2021/04/15/Bo-phim-tom-and-jerry.jpg', '5000', '1', '5', '1');
INSERT INTO `shop_pet`.`OrderItem` (`id`, `product_name`, `product_image`,`price`, `quantity`, `product_id`, `order_id`) VALUES ('3', 'EnglandCat-1','https://o.rada.vn/data/image/2021/04/15/Bo-phim-tom-and-jerry.jpg', '4000', '1', '21', '1');

-- insert feedback
INSERT INTO `shop_pet`.`Feedback` (`id`, `content`, `star`, `created_at`, `order_item_id`) VALUES ('1', 'Its so cute', '4', '2023-02-02 00:00:00', '1');
INSERT INTO `shop_pet`.`Feedback` (`id`, `content`, `star`, `created_at`, `order_item_id`) VALUES ('2', 'Nice shop - i had best friend', '4', '2023-02-02 00:00:00', '2');

-- insert cart
INSERT INTO `shop_pet`.`Cart` (`id`, `price`, `account_id`) VALUES ('1', '3000', '2');
INSERT INTO `shop_pet`.`Cart` (`id`, `price`, `account_id`) VALUES ('2', '5000', '3');
-- insert cart-items
INSERT INTO `shop_pet`.`cartitem` (`id`, `quantity`, `cart_id`, `product_id`) VALUES ('1', '1', '1', '1');
INSERT INTO `shop_pet`.`cartitem` (`id`, `quantity`, `cart_id`, `product_id`) VALUES ('2', '1', '2', '3');
INSERT INTO `shop_pet`.`cartitem` (`id`, `quantity`, `cart_id`, `product_id`) VALUES ('3', '1', '2', '2');


