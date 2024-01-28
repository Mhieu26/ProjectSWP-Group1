
CREATE DATABASE SWP391;

USE SWP391;


ALTER DATABASE swp391 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE Role 
(
	id bigint not null primary key auto_increment,
    role varchar(50)
);

CREATE TABLE Category
(
	id bigint not null primary key auto_increment,
    category varchar(50),
	parentCategory bigint null
);

alter table Category add constraint fk_Category_parentCategory foreign key (parentCategory) references Category(id);


CREATE TABLE BlogCategory
(
	id bigint not null primary key auto_increment,
    category varchar(50)
);

CREATE TABLE User
(
	id bigint not null primary key auto_increment,
    email varchar(150) not null,
    password varchar(255) not null,
    name varchar(150) not null,
    phone varchar(10) not null,
    address text not null,
    sex boolean not null,
    status boolean null,
    verificationCode varchar(255) null,
    roleid bigint not null
);

Alter table User add constraint fk_User_Role foreign key (roleid) references Role(id);


CREATE TABLE Orders
(
	id bigint not null primary key auto_increment,
    orderdate timestamp not null,
    total double not null,
    status varchar(100) not null,
    userid bigint not null
);

Alter table Orders add constraint fk_Orders_User foreign key (userid) references User(id);


CREATE TABLE Product
(
	id bigint not null primary key auto_increment,
	name varchar(150) not null,
    price double not null,
    description text null,
    maker varchar(100) not null,
    status boolean not null,
    inventory int not null,
    categoryid bigint not null
);

Alter table Product add constraint fk_Product_Category foreign key (categoryid) references Category(id);



CREATE TABLE OrderLine
(
	id bigint not null primary key auto_increment,
    quantity int not null,    
    price double not null,
    orderid bigint not null,
    saleid bigint not null,
    productid bigint not null
);



Alter table OrderLine add constraint fk_OrderLine_Product foreign key (productid) references Product(id);
Alter table OrderLine add constraint fk_OrderLine_Sale foreign key (saleid) references User(id);
Alter table OrderLine add constraint fk_OrderLine_Orders foreign key (orderid) references Orders(id);


CREATE TABLE Cart
(
	id bigint not null primary key auto_increment,
    total double not null,
    userid bigint not null
);

Alter table Cart add constraint fk_Cart_User foreign key (userid) references User(id);


CREATE TABLE CartItem
(
	id bigint not null primary key auto_increment,
    quantity int not null,
    price double not null,
    cartid bigint not null,
    productid bigint not null
);

Alter table CartItem add constraint fk_CartItem_Cart foreign key (cartid) references Cart(id);
Alter table CartItem add constraint fk_CartItem_Product foreign key (productid) references Product(id);


CREATE TABLE Feedback
(
	id bigint not null primary key auto_increment,
	content text not null,
    star int not null,
    postdate timestamp not null,
    status boolean not null,
    userid bigint not null,
    productid bigint not null,
    parentFeedback bigint null
);

Alter table Feedback add constraint fk_Feedback_User foreign key (userid) references User(id);
Alter table Feedback add constraint fk_Feedback_Product foreign key (productid) references Product(id);
Alter table Feedback add constraint fk_Feedback_parentFeedback foreign key (parentFeedback) references Feedback(id);



CREATE TABLE Slider
(
	id bigint not null primary key auto_increment,
	title varchar(255) not null,
    backlink text not null,
    status boolean not null
);


CREATE TABLE Blog
(
	id bigint not null primary key auto_increment,
	title text not null,
    briefinfor text not null,
    content text not null,
    author varchar (50) not null,
    postdate timestamp not null,
    status boolean not null,
    blogcategoryid bigint not null    
);
alter table Blog add constraint fk_Blog_BlogCategory foreign key (blogcategoryid) references BlogCategory(id);

CREATE TABLE Comments
(
	id bigint not null primary key auto_increment,
	content text not null,
    postdate timestamp not null,
    userid bigint not null,
    blogid bigint not null,
    parentComment bigint null
);
Alter table Comments add constraint fk_Comments_Blog foreign key (blogid) references Blog(id);
Alter table Comments add constraint fk_Comments_User foreign key (userid) references User(id);
Alter table Comments add constraint fk_Comments_parentComment foreign key (parentComment) references Comments(id);

CREATE TABLE Image
(
	id bigint not null primary key auto_increment,
	source text not null,
    type varchar(100) not null,
    productid bigint null,
    blogid bigint null,
    sliderid bigint null,
    userid bigint null
);

Alter table Image add constraint fk_Image_Product foreign key (productid) references Product(id);
Alter table Image add constraint fk_Image_Blog foreign key (blogid) references Blog(id);
Alter table Image add constraint fk_Image_Slider foreign key (sliderid) references Slider(id);
Alter table Image add constraint fk_Image_User foreign key (userid) references User(id);



CREATE TABLE Specification
(
	id bigint not null primary key auto_increment,
    name varchar(150) not null,
    value varchar(255) null,
    productid bigint not null,
    categoryid bigint not null
);
alter table Specification add constraint fk_Specification_Product foreign key (productid) references Product(id);
alter table Specification add constraint fk_Specification_Category foreign key (categoryid) references Category(id);



CREATE TABLE ModifyHistory
(
	id bigint not null primary key auto_increment,
    name varchar(50) not null,
    valueBefore varchar(255) null,
    valueAfter varchar(255) null,
    updatedBy varchar(255) null,
    updatedDate timestamp,
    userid bigint not null
);

alter table ModifyHistory add constraint fk_ModifyHistory_User foreign key (userid) references User(id);



insert into role(role)
values("customer");
insert into role(role)
values("admin");
insert into role(role)
values("sale");
insert into role(role)
values("salemanager");
insert into role(role)
values("mkt");


select * from category;

insert into category(category)
values("smartphone");
insert into category(category)
values("laptop");
insert into category(category)
values("smartwatch");
insert into category(category)
values("audio");
insert into category(category)
values("accessory");


insert into user(email, password, name, phone, address, sex, status, verificationCode, roleid)
values("abc@gmail.com", "123", "admin1", "0123456789","Vietnam", true, true, null, 2);
insert into user(email, password, name, phone, address, sex, status, verificationCode, roleid)
values("abc2@gmail.com", "123", "customer1", "0123426789","Vietnam", true, true, null, 1);
insert into user(email, password, name, phone, address, sex, status, verificationCode, roleid)
values("abc3@gmail.com", "123", "customer2", "0122456789","Vietnam", true, true, null, 1);
insert into user(email, password, name, phone, address, sex, status, verificationCode, roleid)
values("abc4@gmail.com", "123", "sale1", "0123456289","Vietnam", true, true, null, 3);
insert into user(email, password, name, phone, address, sex, status, verificationCode, roleid)
values("abc5@gmail.com", "123", "salemanager1", "0121456789","Vietnam", true, true, null, 4);
insert into user(email, password, name, phone, address, sex, status, verificationCode, roleid)
values("abc6@gmail.com", "123", "mkt", "0121451789","Vietnam", true, true, null, 5);

select* from category;


insert into product(name,price,description,maker,status,inventory,categoryid)
values("Samsung Galaxy Z Flip5 512GB", 20590000, null, "samsung", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-z-flip-5-256gb_1_5.png",
		"thumbnail", 1);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/a/galaxy_z_flip5_-_1.png",
		"detail", 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/a/galaxy_z_flip5_-_3.png",
		"detail", 1);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-z-flip5-tim-4.jpg",
		"detail", 1);
        



insert into product(name,price,description,maker,status,inventory,categoryid)
values("iPhone 14 Pro 128GB | Chính hãng VN/A", 25190000, null, "apple", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-14-pro_2__4.png",
		"thumbnail", 2);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-14-pro-1tb-2.png",
		"detail", 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_14_pro_1tb_-_1_1_.png",
		"detail", 2);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/2/1/21.7.png",
		"detail", 2);


  
  
  
  
insert into product(name,price,description,maker,status,inventory,categoryid)
values("Xiaomi 13 8GB 256GB", 18090000, null, "xiaomi", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi-13.png",
		"thumbnail", 3);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi-13.png",
		"detail", 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/p/m/pms_1670745756.94572133.png",
		"detail", 3);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/p/m/pms_1670745783.81546234.png",
		"detail", 3);  
  
  
insert into specification(name, value, productid, categoryid)
values("screensize", "6.36", 3, 1);
insert into specification(name, value, productid, categoryid)
values("screentype", "amoled", 3, 1);
insert into specification(name, value, productid, categoryid)
values("refreshrate", "120", 3, 1);
insert into specification(name, value, productid, categoryid)
values("chipset", "snapdragon 8", 3, 1);
insert into specification(name, value, productid, categoryid)
values("ram", "8", 3, 1);
insert into specification(name, value, productid, categoryid)
values("drive", "256", 3, 1);

/*add them*/

insert into product(name,price,description,maker,status,inventory,categoryid)
values("iPhone 15 Pro Max 256GB", 31990000, null, "apple", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-15-pro-max_3.png",
		"thumbnail", 4);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_15_pro_max_256gb_-_2.png",
		"detail", 4);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_15_pro_max_256gb_-_4.png",
		"detail", 4);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_15_pro_128tb_-_3.png",
		"detail", 4);
        insert into product(name,price,description,maker,status,inventory,categoryid)
values("iPhone 15 128GB ", 21690000, null, "apple", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-15-plus_1__1.png",
		"thumbnail", 5);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_15_128gb_-_1_1.png",
		"detail", 5);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_15_128gb_-_3_3.png",
		"detail", 5);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_15_128gb_-_7_3.png",
		"detail", 5);
              insert into product(name,price,description,maker,status,inventory,categoryid)
values("iPhone 13 128GB ", 15690000, null, "apple", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-13_2_.png",
		"thumbnail", 7);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_13_128gb_-_1_1_.png",
		"detail", 7);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_13_128gb_-_3_1_.png",
		"detail", 7);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_13_128gb_-_8_1_.png",
		"detail", 7);
        
        
        
        /* cate2-----------------------------------------------------*/
        
        
        insert into product(name,price,description,maker,status,inventory,categoryid)
values("Apple MacBook Air M1 256GB 2020", 18690000, null, "apple", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/i/air_m2.png",
		"thumbnail", 8);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/m/a/mac_air_ksp.png",
		"detail", 8);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-2020-m1_2_.png",
		"detail", 8);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-2020-m1_5_.png",
		"detail", 8);
        
                insert into product(name,price,description,maker,status,inventory,categoryid)
values("Apple Macbook Air M2 2022 8GB 256GB", 26290000, null, "apple", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook_air_m22.png",
		"thumbnail", 9);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/2/_/2_54_9.png",
		"detail", 9);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/3/_/3_40_7.png",
		"detail", 9);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/4/_/4_33_8.png",
		"detail", 9);
        
                  insert into product(name,price,description,maker,status,inventory,categoryid)
values("Laptop Asus VivoBook Go 14", 12790000, null, "Asus", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_-_2023-06-08t005130.908.png",
		"thumbnail", 10);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_-_2023-06-08t001431.312_2.png",
		"detail", 10);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_-_2023-06-08t005150.492.png",
		"detail", 10);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_-_2023-06-08t001516.526_1.png",
		"detail", 10);
        
                        insert into product(name,price,description,maker,status,inventory,categoryid)
values("Laptop Asus TUF GAMING F15", 16390000, null, "Asus", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-tuf-gaming-f15-fx506hf-hn014w.png",
		"thumbnail", 11);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-tuf-gaming-f15-fx506hf-hn014w-1.png",
		"detail", 11);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-tuf-gaming-f15-fx506hf-hn014w-6.png",
		"detail", 11);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-tuf-gaming-f15-fx506hf-hn014w-5.png",
		"detail", 11);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Laptop Lenovo Yoga Duet 7", 18990000, null, "Asus", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/a/gaming_003_3__3.png",
		"thumbnail", 12);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/f/g/fgege.jpg",
		"detail", 12);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/h/k/hkgk.jpg",
		"detail", 12);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/f/f/ffafef.jpg",
		"detail", 12);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Laptop Lenovo LOQ", 22990000, null, "Lenovo", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_d_i_3_7.png",
		"thumbnail", 13);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_30__1_8.png",
		"detail", 13);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_25__1_10.png",
		"detail", 13);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_33__1_5.png",
		"detail", 13);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Laptop Dell Inspiron 14", 21490000, null, "Dell", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_32__1_6.png",
		"thumbnail", 14);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_34__1_3.png",
		"detail", 14);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_37__1_3.png",
		"detail", 14);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_39__1_4.png",
		"detail", 14);
        
      /* cate3-------------------------------------------------*/
           
        
        insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Bluetooth Apple AirPods Pro 2 2023 USB-C", 5690000, null, "apple", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-airpods-pro-2-usb-c_1_.png",
		"thumbnail", 15);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-airpods-pro-2-usb-c-ksp-1_3_.png",
		"detail", 15);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-airpods-pro-2-usb-c_7_.png",
		"detail", 15);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-airpods-pro-2-usb-c_2_.png",
		"detail", 15);
        
                insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Bluetooth True Wireless Samsung Galaxy Buds2 Pro", 3490000, null, "samsung", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_182_2.png",
		"thumbnail", 16);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/1/_/1_444.png",
		"detail", 16);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/3/_/3_379.png",
		"detail", 16);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/6/_/6_250.png",
		"detail", 16);
        
                  insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Bluetooth True Wireless Xiaomi Buds 3", 990000, null, "Xiaomi", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi_buds_3_31.png",
		"thumbnail", 17);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/b/u/buds-3-4.jpg",
		"detail", 17);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/b/u/buds-6.jpg",
		"detail", 17);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-khong-day-xiaomi-buds-3-0_2_.png",
		"detail", 17);
        
                        insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Bluetooth chụp tai Sony WH-CH520", 1390000, null, "Sony", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-ch520.png",
		"thumbnail", 18);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-ch520-10.png",
		"detail", 18);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-ch520_3_.png",
		"detail", 18);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-ch520-7.png",
		"detail", 18);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Apple EarPods Lightning", 490000, null, "apple", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/f/r/frame_3_3.png",
		"thumbnail", 19);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/f/r/frame_3_3.png",
		"detail", 19);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/1/_/1_9_3_1.jpg",
		"detail", 19);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/u/audifonos-earpods-apple-iphone-7-8-x-lightning-original-d_nq_np_615134-mpe27006605233_032018-f.jpg",
		"detail", 19);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Xiaomi Mi Basic", 140000, null, "Xiaomi", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_197_3.png",
		"thumbnail", 20);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_197_3.png",
		"detail", 20);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/p/m/pms_1538551358.72125327.png",
		"detail", 20);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/p/m/pms_1538551418.63826349.png",
		"detail", 20);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Gaming chụp tai không dây Sony INZONE H5", 2490000, null, "Sony", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-inzone-h5_1.png",
		"thumbnail", 21);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-inzone-h5-ksp-2.png",
		"detail", 21);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-inzone-h5_7_.png",
		"detail", 21);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-inzone-h5_3__1_1.png",
		"detail", 21);
        /* cate4-------------------------------------------------------*/
        
                insert into product(name,price,description,maker,status,inventory,categoryid)
values("
Apple Watch SE 2 2023 40mm (GPS) viền nhôm", 5690000, null, "apple", true, 200, 4);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-watch-se-2023-40mm.png",
		"thumbnail", 22);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/2/a/2apple-watch-se-2023-40mm-vien-nhom-day-silicone-xanh-den-2.jpg",
		"detail", 22);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-watch-se-2023-40mm-vien-nhom-day-silicone-xanh-den-3.jpg",
		"detail", 22);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-watch-se-2023-40mm-vien-nhom-day-silicone-trang-starlight-3.jpg",
		"detail", 22);
        
                insert into product(name,price,description,maker,status,inventory,categoryid)
values("Apple Watch Series 9 41mm (GPS) viền nhôm dây vải ", 9490000, null, "apple", true, 200, 4);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple_lte_1_1.png",
		"thumbnail", 23);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple_lte_1_1.png",
		"detail", 23);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_23__1_11.png",
		"detail", 23);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_24__1_11.png",
		"detail", 23);
                  insert into product(name,price,description,maker,status,inventory,categoryid)
values("Samsung Galaxy Watch6 40mm Bluetooth", 5990000, null, "Samsung", true, 200, 4);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/w/a/watch6_thumbnail.png",
		"thumbnail", 24);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/l/slider_galaxy_watch6_5_.png",
		"detail", 24);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/l/slider_galaxy_watch6_2_.png",
		"detail", 24);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/l/slider_galaxy_watch6_3_.png",
		"detail", 24);
        
                        insert into product(name,price,description,maker,status,inventory,categoryid)
values("Đồng hồ thông minh Xiaomi Redmi Watch 4", 2390000, null, "Xiaomi", true, 200, 4);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomiii.png",
		"thumbnail", 25);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/n/6/n65-black-front_1.png",
		"detail", 25);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/n/6/n65-black-frontright45_1.png",
		"detail", 25);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/n/6/n65-black-right_1.png",
		"detail", 25);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Samsung Galaxy Watch6 Classic 47mm Bluetooth", 7490000, null, "samsung", true, 200, 4);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/w/a/watch6_classic_thumbnail.png",
		"thumbnail", 26);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-watch-6-classic-43mm-slider_1__1.png",
		"detail", 26);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-watch-6-classic-43mm-slider_3__1.png",
		"detail", 26);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-watch-6-classic-43mm-slider_2__1.png",
		"detail", 26);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Apple Watch SE 2 2023 40mm (4G) viền nhôm", 7140000, null, "apple", true, 200, 4);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-watch-se-lte-2023-44mm-vien-nhom-day-silicone-thumb_1.png",
		"thumbnail", 27);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-watch-se-lte-2023-44mm-vien-nhom-day-silicone-dayngan-trang-starlight-1_2.jpg",
		"detail", 27);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-watch-se-lte-2023-44mm-vien-nhom-day-silicone-day-ngan-xanh-duong-nhat-1_1.jpg",
		"detail", 27);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-watch-se-lte-2023-44mm-vien-nhom-day-silicone-day-ngan-xanh-den-2_1.jpg",
		"detail", 27);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Apple Watch Series 8 45mm 4G viền thép dây cao su", 12490000, null, "apple", true, 200, 4);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple_lte_4_.png",
		"thumbnail", 28);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/1/_/1_262.jpg",
		"detail", 28);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/3/_/3_235.jpg",
		"detail", 28);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/m/p/mp6v3ref_vw_34fr_watch-41-stainless-silver-cell-8s_vw_34fr_wf_co_1.jpg",
		"detail", 28);
        
          /* cate5-------------------------------------------------------*/
        
                insert into product(name,price,description,maker,status,inventory,categoryid)
values("Sạc nhanh 20W Apple MHJE3ZA", 490000, null, "apple", true, 200, 5);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_117_1.png",
		"thumbnail", 29);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_117_1.png",
		"detail", 29);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/6/3/637387863045632122_pk-apple-00720432-3.jpg",
		"detail", 29);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/d/adapter-20w-apple-1_1.jpg",
		"detail", 29);
        
                insert into product(name,price,description,maker,status,inventory,categoryid)
values("Chuột Apple Magic Mouse 2021 MK2E3", 1490000, null, "apple", true, 200, 5);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_145_2.png",
		"thumbnail", 30);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_145_2.png",
		"detail", 30);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/c/h/chuot-apple-magic-mouse-2021-2.jpg",
		"detail", 30);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/c/h/chuot-apple-magic-mouse-2021-3.jpg",
		"detail", 30);
                  insert into product(name,price,description,maker,status,inventory,categoryid)
values("Ốp lưng iPhone 15 Pro Max Silicone hỗ trợ sạc Magsafe", 1290000, null, "apple", true, 200, 5);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/o/p/op-lung-magsafe-iphone-15-pro-max-silicone.png",
		"thumbnail", 31);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/o/p/op-iphone-15-pro-chinh-hang-12.png",
		"detail", 31);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/o/p/op-iphone-15-pro-chinh-hang-04_2.png",
		"detail", 31);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/o/p/op-iphone-15-pro-chinh-hang-08_2.png",
		"detail", 31);
        
                        insert into product(name,price,description,maker,status,inventory,categoryid)
values("Bộ vệ sinh Laptop Pro 10 món", 290000, null, "laptop", true, 200, 5);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/c/screenshot_6_12.png",
		"thumbnail", 32);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/8/5/855d7a90283056c51a6a70cbbb01ff35.jpg",
		"detail", 32);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/c/6/c641ea49be9ca68c44025dc00d051e0f.jpg",
		"detail", 32);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/8/5/855d7a90283056c51a6a70cbbb01ff35.jpg",
		"detail", 32);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Lót chuột Rapoo V1 30 x 25 cm", 150000, null, "rapoo", true, 200, 5);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tam-lot-chuot-rapoo-v1-30-25cm-1.jpg",
		"thumbnail", 33);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tam-lot-chuot-rapoo-v1-30-25cm-1.jpg",
		"detail", 33);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tam-lot-chuot-rapoo-v1-30-25cm-3.jpg",
		"detail", 33);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tam-lot-chuot-rapoo-v1-30-25cm-2.jpg",
		"detail", 33);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Pin sạc dự phòng Xiaomi Redmi 20000mAh sạc nhanh 18W", 540000, null, "Xiaomi", true, 200, 5);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiao-mi-sac-nhanh.png",
		"thumbnail", 34);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/0/5/05d5ceed13cf249556fbbd01ca1844d8-removebg-preview.png",
		"detail", 34);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/0/b/0b4759a5a9d28d291468d9ba28a683ac.jpeg",
		"detail", 34);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/p/i/pin-sac-du-phong-xiaomi-redmi-20000mah-sac-nhanh-18w_1_.jpg",
		"detail", 34);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Webcam Logitech C922 FULLHD 1080P", 2490000, null, "logitech", true, 200, 5);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/6/6/66_1_11.jpg",
		"thumbnail", 35);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/6/8/68_1_5.jpg",
		"detail", 35);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/6/7/67_1_8.jpg",
		"detail", 35);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/6/5/65_1_9.jpg",
		"detail", 35);
        
          insert into product(name,price,description,maker,status,inventory,categoryid)
values("Samsung Galaxy A15 ", 7140000, null, "samsung", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/a/galaxy-a15-xanh-01.png",
		"thumbnail", 36);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung_galaxy_a15_lte_8gb_128gb_-_1.png",
		"detail", 36);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung_galaxy_a15_lte_8gb_128gb_-_7.png",
		"detail", 36);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung_galaxy_a15_lte_8gb_128gb_-_5.png",
		"detail", 36);
                insert into product(name,price,description,maker,status,inventory,categoryid)
values("Đồng hồ thông minh Xiaomi Watch 2 Pro ", 5790000, null, "Xiaomi", true, 200, 4);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_1__2_63.png",
		"thumbnail", 37);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/m/a/main_ksp_2.png",
		"detail", 37);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/w/a/watch_3_pro.png",
		"detail", 37);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_38_1_1.png",
		"detail", 37);
                      insert into product(name,price,description,maker,status,inventory,categoryid)
values("Xiaomi Redmi Note 13 ", 4790000, null, "Xiaomi", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi-redmi-note-13_1__1_1.png",
		"thumbnail", 38);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi_redmi_note_13_6gb_128gb_-_1.png",
		"detail", 38);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi_redmi_note_13_6gb_128gb_-_2.png",
		"detail", 38);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi_redmi_note_13_6gb_128gb_-_7.png",
		"detail", 38);
        
            insert into product(name,price,description,maker,status,inventory,categoryid)
values("TECNO SPARK 20 8GB 128GB ", 3190000, null, "TECNO", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/tecno-spark-20_2_.png",
		"thumbnail", 39);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/_/i/_i_n_tho_i_tecno_spark_20_-_2.png",
		"detail", 39);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/_/i/_i_n_tho_i_tecno_spark_20_-_3.png",
		"detail", 39);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/_/i/_i_n_tho_i_tecno_spark_20_-_6new.png",
		"detail", 39);
                insert into product(name,price,description,maker,status,inventory,categoryid)
values("TCL 40 NXT PAPER 8GB 256GB", 4190000, null, "TCL", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/c/tcl-40-nxt-paper_3_.png",
		"thumbnail", 40);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/c/tcl_40_nxt_paper_8gb_256gb_-_2.png",
		"detail", 40);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/c/tcl_40_nxt_paper_8gb_256gb_-_9.png",
		"detail", 40);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/c/tcl_40_nxt_paper_8gb_256gb_-_4.png",
		"detail", 40);


        




        






        



