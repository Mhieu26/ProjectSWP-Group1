
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
         insert into product(name,price,description,maker,status,inventory,categoryid)
values("Samsung Galaxy S24 Ultra 12GB 256GB", 27090000, null, "samsung", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/s/ss-s24-ultra-xam-222.png",
		"thumbnail", 41);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung_galaxy_s24_ultra_256gb_-_10.png",
		"detail", 41);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung_galaxy_s24_ultra_256gb_-_12.png",
		"detail", 41);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung_galaxy_s24_ultra_256gb_-_1.png",
		"detail", 41);
        insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung_galaxy_s24_ultra_256gb_-_4.png",
		"detail", 41);
        insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung_galaxy_s24_ultra_256gb_-_3.png",
		"detail", 41);
               insert into product(name,price,description,maker,status,inventory,categoryid)
values("Samsung Galaxy S23 Ultra 256GB", 22190000, null, "samsung", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-s23-ultra.png",
		"thumbnail", 42);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung_s23_ultra_-_1.png",
		"detail", 42);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung_s23_ultra_-_8.png",
		"detail", 42);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung_s23_ultra_-_3.png",
		"detail", 42);
        insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung_s23_ultra_-_9.png",
		"detail", 42);
        insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung_s23_ultra_-_6.png",
		"detail", 42);
         insert into product(name,price,description,maker,status,inventory,categoryid)
values("Laptop Asus Gaming ROG Strix SCAR 18", 113190000, null, "samsung", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_d_i_4__2.png",
		"thumbnail", 43);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_34__6_1.png",
		"detail", 43);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_39__4_1.png",
		"detail", 43);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_43__1_2_1.png",
		"detail", 43);
  alter table blog add column image text not null;
        insert into BlogCategory(category)
values("Tin Công nghệ");
insert into BlogCategory(category)
values("Tư vấn");
insert into BlogCategory(category)
values("Khuyến mãi");
insert into blog(title, briefinfor,content,author,postdate,status,blogcategoryid,image)
values("Xiaomi ra mắt cáp sạc nhanh 60W với giá chỉ 65 ngàn đồng","Xiaomi vừa mở rộng danh mục đầu tư của họ bằng cách tung ra cáp USB-C mới. Với mức giá phải chăng là 19 nhân dân tệ (khoảng 65 ngàn đồng), sản phẩm mới nhất hiện đã mở bán tại Trung Quốc."
, "Cáp sạc mới của Xiaomi có chiều dài 1 mét nên khá lý tưởng để sạc các thiết bị hàng ngày của bạn như điện thoại thông minh hoặc máy tính bảng đồng thời giảm khả năng bị rối.Về mặt thẩm mỹ, cáp có tông màu trắng và xám tối giản, được làm từ cao su TPE, một loại vật liệu nổi tiếng với tính linh hoạt và độ bền, giúp nâng cao tuổi thọ. Nó hỗ trợ dòng điện 3A và sạc nhanh 60W. Ngoài ra, nó còn có tốc độ truyền dữ liệu lên tới 480 Mbps, tuân thủ tiêu chuẩn USB 2.0, quá đủ để truyền file và sao lưu ảnh",
"Hải Nam","2024-01-28 17:47:00",true,1,"images/blog1.jpeg");

insert into blog(title, briefinfor,content,author,postdate,status,blogcategoryid,image)
values("Lenovo M20 5G ra mắt: MediaTek Kompanio 900T, màn hình 2K, giá từ 8.3 triệu đồng","Vừa qua, Lenovo đã ra mắt máy tính bảng K11 tại thị trường Nhật Bản. Nhà sản xuất tiếp tục trình làng máy tính bảng M20 5G tại thị trường Trung Quốc."
, "Lenovo M20 5G được trang bị màn hình LCD với kích thước 10.4 inch độ phân giải 2K và độ sáng tối đa chỉ 280 nits.Về cấu hình, thiết bị sử dụng bộ vi xử lý MediaTek Kompanio 900T. Đây là một con chip của TSMC được sản xuất trên tiến trình 6 nm với 8 nhân bao gồm 2 nhân hiệu năng cao Cortex-A78 và 6 nhân tiết kiệm Cortex-A55, cùng với đó là GPU Mali G68 và APU MediaTek. Các lựa chọn bộ nhớ bao gồm 6GB/8GB/12GB RAM và 128GB/256GB/512GB bộ nhớ trong, ngoài ra người dùng có thể mở rộng không gian lưu",
"Phạm Thanh Thư","2024-01-27 09:50:00",true,1,"images/blog2.jpg");

insert into blog(title, briefinfor,content,author,postdate,status,blogcategoryid,image)
values("So sánh OnePlus 12R và Samsung Galaxy S24: Nên mua máy nào?","Galaxy S24 và OnePlus 12R là hai “tân binh” mới nhất đến từ Samsung, OnePlus. Cả hai điện thoại này đều sở hữu thiết kế hiện đại, cấu hình phần cứng hấp dẫn và nhiều tính năng thú vị."
, "Samsung Galaxy S24 mạnh mẽ hơn.OnePlus 12R có khả năng sạc nhanh hơn.Camera Galaxy S24 có khả năng zoom kỹ thuật số 30x.OnePlus 12R có màn hình lớn hơn.Tại sự kiện ra mắt dòng Galaxy S 2024, Samsung đã dành khá nhiều thời gian để giới thiệu các tính năng AI có trong loạt điện thoại này.Ngoài chỉnh sửa ảnh, AI còn hoạt động với Live Translate, giúp dịch trực tiếp hai chiều trong các cuộc gọi điện thoại. Galaxy AI sẽ phân tích những gì người khác nói và lặp lại nó bằng tiếng mẹ đẻ của bạn gần như",
"Minh Thanh","2024-01-26 15:10:00",true,2,"images/blog3.jpeg");

insert into blog(title, briefinfor,content,author,postdate,status,blogcategoryid,image)
values("So sánh Redmi Note 13 4G và Redmi Note 13 Pro 5G: Có gì khác biệt?","Redmi Note 13 4G và Redmi Note 13 Pro 5G là hai trong số 3 “tân binh” thuộc dòng Redmi Note 13 vừa được Xiaomi giới thiệu với người dùng Việt Nam cách đây không lâu."
, "Tổng quan về thiết kế, Redmi Note 13 4G và Redmi Note 13 Pro 5G sở hữu ngoại hình khá giống nhau. Cả hai điện thoại này đều sở hữu thiết kế vuông vắn với khung viền và mặt trước lẫn sau đều vát phẳng. Chưa hết, chúng đều sở hữu màn hình đục lỗ hiện đại ở mặt trước và có viền bezel các cạnh khá mỏng nên cho cảm giác cao cấp khi cầm trên tay. Trong thời đại bị mạng xã hội thống trị, khả năng chụp ảnh của smartphone là hết sức quan trọng. Redmi Note 13 5G với thiết lập 3 camera sau hứa hẹn mang lại",
"Minh Thanh","2024-01-25 08:36:00",true,2,"images/blog4.jpg");




                alter table user add column expiredDatetime datetime null after verificationCode;
SET GLOBAL event_scheduler = ON;

CREATE EVENT if not exists Event_tbl_User_Delete_Expired_verificationCode
ON SCHEDULE
    EVERY 1 minute
    STARTS now() ON COMPLETION PRESERVE ENABLE 
DO
  DELETE FROM User
  where expiredDatetime < now();
  
  
  Alter table User modify column password varchar(255) default null;
Alter table User modify column phone varchar(10) default null;
Alter table User modify column address text default null;
Alter table User modify column sex boolean default null;
Alter table User add constraint UC_User UNIQUE(email);

Alter table User add column isGoogleUser boolean default false after expiredDatetime ;
select * from specification;

insert into specification(name,value,productid,categoryid)
values("Screen Size","6.7 inch",1,1);
insert into specification(name,value,productid,categoryid)
values("Operating System","Android 13",1,1);
insert into specification(name,value,productid,categoryid)
values("Ram","8GB",1,1);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","512GB",1,1);
insert into specification(name,value,productid,categoryid)
values("Battery","3700 mAh",1,1);
insert into specification(name,value,productid,categoryid)
values("Rear Camera","Ultra wide camera: 12MP, F2.2, 123°, 1.12 μm, FF
Main camera: 12MP, F1.8, Dual Pixel, 1.8μm, OIS",1,1);
insert into specification(name,value,productid,categoryid)
values("Front Camera","10MP, F2.4, 1.22μm",1,1);
--

insert into specification(name,value,productid,categoryid)
values("Screen Size","6.7 inch",2,1);
insert into specification(name,value,productid,categoryid)
values("Operating System","iOS 16",2,1);
insert into specification(name,value,productid,categoryid)
values("Ram","6GB",2,1);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","128GB",2,1);
insert into specification(name,value,productid,categoryid)
values("Battery","4.323 mAh",2,1);
insert into specification(name,value,productid,categoryid)
values("Rear Camera","Main camera: 48 MP, f/1.8, 24mm, 1.22µm, PDAF, OIS
Ultra wide-angle camera: 12 MP, f/2.2, 13mm, 120˚, 1.4µm, PDAF
Telephoto camera: 12 MP, f/2.8, 77mm (telephoto), PDAF, OIS, 3x optical zoom
TOF 3D LiDAR depth sensor",2,1);
insert into specification(name,value,productid,categoryid)
values("Front Camera","Camera selfie: 12 MP, f/1.9, 23mm, 1/3.6, PDAF",2,1);
--
insert into specification(name,value,productid,categoryid)
values("Screen Size","6.7 inch",4,1);
insert into specification(name,value,productid,categoryid)
values("Operating System","iOS 17",4,1);
insert into specification(name,value,productid,categoryid)
values("Ram","8GB",4,1);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","256GB",4,1);
insert into specification(name,value,productid,categoryid)
values("Battery","4422 mAh",4,1);
insert into specification(name,value,productid,categoryid)
values("Rear Camera","Main camera: 48MP, 24mm, ƒ/1.78,
Ultra wide-angle camera: 12 MP, 13 mm, ƒ/2.2
Telephoto camera 5x: 12 MP, 120 mm, ƒ/2.8
Tele camera 2x: 12 MP, 48 mm, ƒ/1.78",4,1);
insert into specification(name,value,productid,categoryid)
values("Front Camera","12MP, ƒ/1.9",4,1);
-------
insert into specification(name,value,productid,categoryid)
values("Screen Size","6.67 inch",38,1);
insert into specification(name,value,productid,categoryid)
values("Operating System","Android 13",38,1);
insert into specification(name,value,productid,categoryid)
values("Ram","6GB",38,1);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","128GB",38,1);
insert into specification(name,value,productid,categoryid)
values("Battery","5000 mAh",38,1);
insert into specification(name,value,productid,categoryid)
values("Rear Camera","Main 108 MP & Secondary 8 MP, 2 MP",38,1);
insert into specification(name,value,productid,categoryid)
values("Front Camera","16MP",38,1);
-------------
insert into specification(name,value,productid,categoryid)
values("Screen Size","6.56 inch",39,1);
insert into specification(name,value,productid,categoryid)
values("Operating System","Android 13",39,1);
insert into specification(name,value,productid,categoryid)
values("Ram","8GB+Plus 8GB",39,1);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","128GB",39,1);
insert into specification(name,value,productid,categoryid)
values("Battery","5000 mAh",39,1);
insert into specification(name,value,productid,categoryid)
values("Rear Camera","Main 108 MP & Secondary 8 MP, 2 MP",39,1);
insert into specification(name,value,productid,categoryid)
values("Front Camera","32MP",39,1);
-----
insert into specification(name,value,productid,categoryid)
values("Screen Size","6.78 inch",40,1);
insert into specification(name,value,productid,categoryid)
values("Operating System","Android 13",40,1);
insert into specification(name,value,productid,categoryid)
values("Ram","8GB+Plus 8GB",40,1);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","256GB",40,1);
insert into specification(name,value,productid,categoryid)
values("Battery","5000 mAh",40,1);
insert into specification(name,value,productid,categoryid)
values("Rear Camera","Main 108 MP & Secondary 8 MP, 2 MP",40,1);
insert into specification(name,value,productid,categoryid)
values("Front Camera","32MP",40,1);
----
insert into specification(name,value,productid,categoryid)
values("Screen Size","6.8 inch",41,1);
insert into specification(name,value,productid,categoryid)
values("Operating System","Android 14, One UI 6.1",41,1);
insert into specification(name,value,productid,categoryid)
values("Ram","12GB",41,1);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","256GB",41,1);
insert into specification(name,value,productid,categoryid)
values("Battery","5000 mAh",41,1);
insert into specification(name,value,productid,categoryid)
values("Rear Camera","Main camera: 200MP, Laser AF, OIS
Camera: 50MP, PDAF, OIS, 5x optical zoom
Telephoto camera: 10MP
Ultra wide-angle camera: 12 MP, f/2.2, 13mm, 120˚",41,1);
insert into specification(name,value,productid,categoryid)
values("Front Camera","12 MP, f/2.2",41,1);
-------
insert into specification(name,value,productid,categoryid)
values("Screen Size","6.8 inch",42,1);
insert into specification(name,value,productid,categoryid)
values("Operating System","Android 14, One UI 6.1",42,1);
insert into specification(name,value,productid,categoryid)
values("Ram","8GB",42,1);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","256GB",42,1);
insert into specification(name,value,productid,categoryid)
values("Battery","5000 mAh",42,1);
insert into specification(name,value,productid,categoryid)
values("Rear Camera","Ultra wide: 12MP F2.2 (Dual Pixel AF)
Main: 200MP F1.7 OIS ±3° (Super Quad Pixel AF)
Tele 1: 10MP F4.9 (10X, Dual Pixel AF) OIS,
Tele 2: 10MP F2.4 (3X, Dual Pixel AF) OIS 100X spatial zoom˚",42,1);
insert into specification(name,value,productid,categoryid)
values("Front Camera","12MP F2.2 (Dual Pixel AF)",42,1);
--
insert into specification(name,value,productid,categoryid)
values("Screen Size","6.1 inch",5,1);
insert into specification(name,value,productid,categoryid)
values("Operating System","iOS 17",5,1);
insert into specification(name,value,productid,categoryid)
values("Ram","6GB",5,1);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","128GB",5,1);
insert into specification(name,value,productid,categoryid)
values("Battery","3349 mAh",5,1);
insert into specification(name,value,productid,categoryid)
values("Rear Camera","Main camera: 48MP, 26mm, ƒ/1.6,
Wide-angle camera: 12MP, 13 mm, ƒ/2.4
Tele camera 2x: 12MP, 52 mm, ƒ/1.6",5,1);
insert into specification(name,value,productid,categoryid)
values("Front Camera","12MP, ƒ/1.9",5,1);
-------------
insert into specification(name,value,productid,categoryid)
values("Screen Size","6.5 inch",36,1);
insert into specification(name,value,productid,categoryid)
values("Operating System","Android 14",36,1);
insert into specification(name,value,productid,categoryid)
values("Ram","8GB",36,1);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","128GB",36,1);
insert into specification(name,value,productid,categoryid)
values("Battery","5000 mAh",36,1);
insert into specification(name,value,productid,categoryid)
values("Rear Camera","Main 50 MP & Secondary 5 MP, 2 MP",36,1);
insert into specification(name,value,productid,categoryid)
values("Front Camera","13MP",36,1);
/* 2*/
insert into specification(name,value,productid,categoryid)
values("Graphics Card","7-core GPU, 16-core Neural Engine",8,2);
insert into specification(name,value,productid,categoryid)
values("Operating System","macOS Big Sur",8,2);
insert into specification(name,value,productid,categoryid)
values("Ram","8GB",8,2);
insert into specification(name,value,productid,categoryid)
values("Ram Type","LPDDR4",8,2);
insert into specification(name,value,productid,categoryid)
values("Battery","49.9-watt lithium-polymer, 30W charger",8,2);
insert into specification(name,value,productid,categoryid)
values("Hard Drive","256GB SSD",8,2);
insert into specification(name,value,productid,categoryid)
values("Screen Size","13.3 inches",8,2);
insert into specification(name,value,productid,categoryid)
values("Screen Resolution","2560 x 1600 pixels (2K)",8,2);
insert into specification(name,value,productid,categoryid)
values("Communication Port","2 Thunderbolt / USB 4 ports",8,2);

insert into specification(name,value,productid,categoryid)
values("Graphics Card","8 GPU cores, 16 Neural Engine cores",9,2);
insert into specification(name,value,productid,categoryid)
values("Operating System","MacOS",9,2);
insert into specification(name,value,productid,categoryid)
values("Ram","8GB",9,2);
insert into specification(name,value,productid,categoryid)
values("Battery","52,6 Wh",9,2);
insert into specification(name,value,productid,categoryid)
values("Hard Drive","256GB SSD",9,2);
insert into specification(name,value,productid,categoryid)
values("Screen Size","13.6 inches",9,2);
insert into specification(name,value,productid,categoryid)
values("Screen Resolution","2560 x 1664 pixels",9,2);
insert into specification(name,value,productid,categoryid)
values("Communication Port","2 x Thunderbolt 3
3.5 mm headphone jack
MagSafe 3",9,2);
------

insert into specification(name,value,productid,categoryid)
values("Graphics Card","NVIDIA GeForce RTX 4090 16GB GDDR6",43,2);
insert into specification(name,value,productid,categoryid)
values("Operating System","Windows 11 Home",43,2);
insert into specification(name,value,productid,categoryid)
values("Ram","64GB",9,2);
insert into specification(name,value,productid,categoryid)
values("Battery","90WHrs, 4S1P, 4-cell Li-ion",43,2);
insert into specification(name,value,productid,categoryid)
values("Hard Drive","2TB PCIe 4.0 NVMe M.2 SSD
1 empty slot",43,2);
insert into specification(name,value,productid,categoryid)
values("Screen Size","13.6 inches",43,2);
insert into specification(name,value,productid,categoryid)
values("Screen Resolution","2560 x 1600 pixels (2K)",43,2);
insert into specification(name,value,productid,categoryid)
values("Communication Port","1x 2.5G LAN
1x Thunderbolt 4 (DisplayPort / G-SYNC)
1x USB 3.2 Gen 2 Type-C (DisplayPort / Charging / G-SYNC)
2x USB 3.2 Gen 2 Type-A
1x HDMI 2.1 FRL
1x 3.5mm Combo Audio Jack",43,2);

insert into specification(name,value,productid,categoryid)
values("Graphics Card","AMD Radeon Graphics",10,2);
insert into specification(name,value,productid,categoryid)
values("Operating System","Windows 11 Home",10,2);
insert into specification(name,value,productid,categoryid)
values("Ram","16GB",10,2);
insert into specification(name,value,productid,categoryid)
values("Battery","42WHrs, 3S1P, Li-ion 3 cell",10,2);
insert into specification(name,value,productid,categoryid)
values("Hard Drive","SSD 512GB M.2 NVMe PCIe 3.0",10,2);
insert into specification(name,value,productid,categoryid)
values("Screen Size","14 inches",10,2);
insert into specification(name,value,productid,categoryid)
values("Screen Resolution","1920 x 1080 pixels (FullHD)",10,2);
insert into specification(name,value,productid,categoryid)
values("Communication Port","1 x USB 2.0 Type-A
1 x USB 3.2 Gen 1 Type-A
1 x USB 3.2 Gen 1 Type-C
1 x HDMI 1.4
1 x 3.5mm headphone jack
1 x DC Input",10,2);

insert into specification(name,value,productid,categoryid)
values("Graphics Card","NVIDIA GeForce RTX 2050 4GB",11,2);
insert into specification(name,value,productid,categoryid)
values("Operating System","Windows 11 Home",11,2);
insert into specification(name,value,productid,categoryid)
values("Ram","8GB",11,2);
insert into specification(name,value,productid,categoryid)
values("Battery","48WHrs, 3-cell Li-ion",11,2);
insert into specification(name,value,productid,categoryid)
values("Hard Drive","512GB M.2 PCIE G3X2
1x empty M.2 SSD slot",11,2);
insert into specification(name,value,productid,categoryid)
values("Screen Size","15.6 inches",11,2);
insert into specification(name,value,productid,categoryid)
values("Screen Resolution","1920 x 1080 pixels (FullHD)",11,2);
insert into specification(name,value,productid,categoryid)
values("Communication Port","1x RJ45 LAN Port
3x USB 3.2 Gen 1 Type-A
1x Thunderbolt 4 supports DisplayPort
1x HDMI 2.0b
1x 3.5mm headphone jack",11,2);

insert into specification(name,value,productid,categoryid)
values("Graphics Card","Intel Iris Xe Graphics",12,2);
insert into specification(name,value,productid,categoryid)
values("Operating System","Windows 11 Home",12,2);
insert into specification(name,value,productid,categoryid)
values("Ram","8GB",12,2);
insert into specification(name,value,productid,categoryid)
values("Ram Type","DDR4",12,2);
insert into specification(name,value,productid,categoryid)
values("Battery","3cell - 41Wh",12,2);
insert into specification(name,value,productid,categoryid)
values("Hard Drive","512GB SSD",12,2);
insert into specification(name,value,productid,categoryid)
values("Screen Size","13 inches",12,2);
insert into specification(name,value,productid,categoryid)
values("Screen Resolution","2160 x 1350 pixels",12,2);
insert into specification(name,value,productid,categoryid)
values("Communication Port","1x USB-C 3.2 Gen 1 (support data transfer and Always On)
1x USB-C 3.2 Gen 1 (supports data transfer and Power Delivery 3.0)
1x Thunderbolt 4 (supports data transfer, Power Delivery 3.0, and DisplayPort 1.4)
1x microSD card reader
1x Headphone",12,2);

insert into specification(name,value,productid,categoryid)
values("Graphics Card","NVIDIA GeForce RTX 4050 6GB GDDR6, Boost Clock 2370MHz, TGP 95W",13,2);
insert into specification(name,value,productid,categoryid)
values("Operating System","Windows 11 Home SL",13,2);
insert into specification(name,value,productid,categoryid)
values("Ram","16GB",13,2);
insert into specification(name,value,productid,categoryid)
values("Ram Type","DDR5-5600",13,2);
insert into specification(name,value,productid,categoryid)
values("Battery","60Wh",13,2);
insert into specification(name,value,productid,categoryid)
values("Hard Drive","512GB SSD M.2 2242 PCIe 4.0x4 NVMe (1 empty M.2 SSD slot for maximum upgrade to 1TB)",13,2);
insert into specification(name,value,productid,categoryid)
values("Screen Size","15.6 inches",13,2);
insert into specification(name,value,productid,categoryid)
values("Screen Resolution","1920 x 1080 pixels (FullHD)",13,2);
insert into specification(name,value,productid,categoryid)
values("Communication Port","1x Ethernet (RJ-45)
1x HDMI 2.1, up to 8K/60Hz
1x Headphone/microphone combo jack (3.5mm)
1x Power connector
1x USB 2.0
1x USB-C 3.2 Gen 2 (Data transfer, charging, DisplayPort 1.4)
2x USB 3.2 Gen 2",13,2);

insert into specification(name,value,productid,categoryid)
values("Graphics Card","Intel Iris Xe Graphics",14,2);
insert into specification(name,value,productid,categoryid)
values("Operating System","Windows 11 Pro",14,2);
insert into specification(name,value,productid,categoryid)
values("Ram","16GB",14,2);
insert into specification(name,value,productid,categoryid)
values("Ram Type","LPDDR5, 4800 MT/s (onboard)",14,2);
insert into specification(name,value,productid,categoryid)
values("Battery","4 Cell, 54 Wh",14,2);
insert into specification(name,value,productid,categoryid)
values("Hard Drive","1 TB, M.2, PCIe NVMe, SSD",14,2);
insert into specification(name,value,productid,categoryid)
values("Screen Size","14 inches",14,2);
insert into specification(name,value,productid,categoryid)
values("Screen Resolution","1920 x 1200 pixels (FullHD+)",14,2);
insert into specification(name,value,productid,categoryid)
values("Communication Port","1x HDMI 1.4
2x Intel Thunderbolt 4.0
1x USB 3.2 Gen 1 Type-A
1x Universal audio jack
1x SD card reader",14,2);

/* 3*/
insert into specification(name,value,productid,categoryid)
values("Battery Life","Headphones: Use 6 hours
Charging box: Use 30 hours",15,3);
insert into specification(name,value,productid,categoryid)
values("Audio Technology","Active Noise Cancellation
Chip Apple H2
Adaptive EQ",15,3);
insert into specification(name,value,productid,categoryid)
values("Micro","Have",15,3);
insert into specification(name,value,productid,categoryid)
values("Control Method","Touch sensor",15,3);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Apple",15,3);
insert into specification(name,value,productid,categoryid)
values("Control operation","Listen/receive calls
Play/pause music
Switch songs
Increase/decrease volume
Turn on virtual assistant
Switch noise canceling On/Off mode",15,3);
------

--
insert into specification(name,value,productid,categoryid)
values("Battery Life","Headphones: Use 8 hours
Charging box: Use 29 hours",16,3);
insert into specification(name,value,productid,categoryid)
values("Audio Technology","Active Noise Canceling
360 Reality Audio
Ambient Sound
Hi-Fi sound",16,3);
insert into specification(name,value,productid,categoryid)
values("Micro","Have",16,3);
insert into specification(name,value,productid,categoryid)
values("Control Method","Touch sensor",16,3);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Samsung",16,3);
insert into specification(name,value,productid,categoryid)
values("Control operation","Change post
Adjust the volume
Answer the call
Activate virtual assistant",16,3);

--
insert into specification(name,value,productid,categoryid)
values("Battery Life","Headphones: Use 6 hours
Charging box: Use 24 hours",17,3);
insert into specification(name,value,productid,categoryid)
values("Audio Technology","Active noise cancellation.
Crosstalk",17,3);
insert into specification(name,value,productid,categoryid)
values("Micro","Have",17,3);
insert into specification(name,value,productid,categoryid)
values("Control Method","Touch sensor",17,3);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Xiaomi",17,3);
insert into specification(name,value,productid,categoryid)
values("Control operation","Change post,
Adjust the volume,
Music control,
Switch between different modes",17,3);
-------------------------
insert into specification(name,value,productid,categoryid)
values("Battery Life","40 hours",18,3);
insert into specification(name,value,productid,categoryid)
values("Audio Technology","Digital audio",18,3);
insert into specification(name,value,productid,categoryid)
values("Micro","Have",18,3);
insert into specification(name,value,productid,categoryid)
values("Control Method","Physical buttons",18,3);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Sony",18,3);
insert into specification(name,value,productid,categoryid)
values("Control operation","Change post,
Adjust the volume,
Music control,
Switch between different modes",18,3);
---------------------
insert into specification(name,value,productid,categoryid)
values("Connector","Lightning",19,3);
insert into specification(name,value,productid,categoryid)
values("Micro","Have",19,3);
insert into specification(name,value,productid,categoryid)
values("Control Method","Physical buttons",19,3);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Apple",19,3);
insert into specification(name,value,productid,categoryid)
values("Control operation","Change post,
Adjust the volume,
Answer the call",19,3);
-----------------
insert into specification(name,value,productid,categoryid)
values("Connector","3.5mm",20,3);
insert into specification(name,value,productid,categoryid)
values("Micro","Have",20,3);
insert into specification(name,value,productid,categoryid)
values("Control Method","Physical buttons",20,3);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Xiaomi",20,3);
insert into specification(name,value,productid,categoryid)
values("Control operation","Pause or play music,
Answer the call",20,3);
------------------
insert into specification(name,value,productid,categoryid)
values("Battery Life","28 hours",21,3);
insert into specification(name,value,productid,categoryid)
values("Audio Technology","360 Spatial Sound",21,3);
insert into specification(name,value,productid,categoryid)
values("Micro","Have",21,3);
insert into specification(name,value,productid,categoryid)
values("Other function","Noise canceling conversations",21,3);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Sony",21,3);
/* 4 */
insert into specification(name,value,productid,categoryid)
values("Battery Life","18 hours",22,4);
insert into specification(name,value,productid,categoryid)
values("Screen Technology","Digital audio",22,4);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","32GB",22,4);
insert into specification(name,value,productid,categoryid)
values("Operating System","WatchOS",22,4);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Apple",22,4);
insert into specification(name,value,productid,categoryid)
values("Health Benefits","Training mode, Sleep monitoring, Heart rate measurement, Step counting, Calorie consumption calculation, Running distance calculation, Stress level measurement, Fall detection, Abnormal heart rate warning, Cycle tracking",22,4);
insert into specification(name,value,productid,categoryid)
values("Smart Features","Has GPS positioning, Install applications, Play music on the watch, Practice mode, Display phone notifications, Customize the watch face, Listen to calls on the watch, Control music playback, Connect headphones, Press Time, Alarm, Call via Bluetooth",22,4);
------------------------
insert into specification(name,value,productid,categoryid)
values("Battery Life","65 hours",37,4);
insert into specification(name,value,productid,categoryid)
values("Screen Technology","AMOLED",37,4);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","32GB",37,4);
insert into specification(name,value,productid,categoryid)
values("Operating System","WearOS",37,4);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Xiaomi",37,4);
insert into specification(name,value,productid,categoryid)
values("Health Benefits","Training mode, Sleep monitoring, Heart rate measurement, Step counting, Calorie consumption calculation, Running distance calculation, Stress level measurement, Fall detection, Abnormal heart rate warning, Cycle tracking",37,4);
insert into specification(name,value,productid,categoryid)
values("Smart Features","Has GPS positioning, Install applications, Play music on the watch, Practice mode, Display phone notifications, Customize the watch face, Listen to calls on the watch, Control music playback, Connect headphones, Press Time, Alarm, Call via Bluetooth",37,4);
------------------------
insert into specification(name,value,productid,categoryid)
values("Battery Life","Smart mode: 18 hours
Battery saving mode: 36 hours",23,4);
insert into specification(name,value,productid,categoryid)
values("Screen Technology","Retina",23,4);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","64GB",23,4);
insert into specification(name,value,productid,categoryid)
values("Operating System","WatchOS",23,4);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Apple",23,4);
insert into specification(name,value,productid,categoryid)
values("Health Benefits","Training mode, Sleep monitoring, Heart rate measurement, Blood oxygen measurement, Step counting, Calorie consumption calculation, Running distance calculation, Stress level measurement, Temperature sensor, Fall detection",23,4);
insert into specification(name,value,productid,categoryid)
values("Smart Features","Has GPS positioning, Install applications, Play music on the watch, Practice mode, Display phone notifications, Customize the watch face, Listen to calls on the watch, Control music playback, Connect headphones, Press Time, Alarm, Call via Bluetooth",23,4);
-------------------------
insert into specification(name,value,productid,categoryid)
values("Battery Life","40 hours (Always on Display off)
Up to 30 hours (Always on Display enabled)",24,4);
insert into specification(name,value,productid,categoryid)
values("Screen Technology","Super Amoled",24,4);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","16GB",24,4);
insert into specification(name,value,productid,categoryid)
values("Operating System","WearOS",24,4);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Samsung",24,4);
insert into specification(name,value,productid,categoryid)
values("Health Benefits","Training mode, Sleep monitoring, Heart rate measurement, Blood oxygen measurement, Step counting, Calorie consumption calculation, Running distance calculation, Stress level measurement, Temperature sensor, Fall detection",24,4);
insert into specification(name,value,productid,categoryid)
values("Smart Features","Has GPS positioning, Install applications, Play music on the watch, Practice mode, Display phone notifications, Customize the watch face, Listen to calls on the watch, Control music playback, Connect headphones, Press Time, Alarm, Call via Bluetooth",24,4);
-----------------
insert into specification(name,value,productid,categoryid)
values("Battery Life","About 20 days (Basic mode)
About 10 days (when using Always-On Display mode)",25,4);
insert into specification(name,value,productid,categoryid)
values("Screen Technology","AMOLED",25,4);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","16GB",25,4);
insert into specification(name,value,productid,categoryid)
values("Operating System","Other",25,4);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Xiao Mi",25,4);
insert into specification(name,value,productid,categoryid)
values("Health Benefits","Training mode, Sleep monitoring, Heart rate measurement, Blood oxygen measurement, Step counting, Calorie consumption calculation, Running distance calculation, Stress level measurement, Temperature sensor, Fall detection",25,4);
insert into specification(name,value,productid,categoryid)
values("Smart Features","Has GPS positioning, Install applications, Play music on the watch, Practice mode, Display phone notifications, Customize the watch face, Listen to calls on the watch, Control music playback, Connect headphones, Press Time, Alarm, Call via Bluetooth",25,4);
--
insert into specification(name,value,productid,categoryid)
values("Battery Life","Up to 40 hours (Always on Display off)
Up to 30 hours (Always on Display enabled)",26,4);
insert into specification(name,value,productid,categoryid)
values("Screen Technology","Super AMOLED",26,4);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","16GB",26,4);
insert into specification(name,value,productid,categoryid)
values("Operating System","Other",26,4);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Samsung",26,4);
insert into specification(name,value,productid,categoryid)
values("Health Benefits","Training mode, Sleep monitoring, Heart rate measurement, Blood oxygen measurement, Step counting, Calorie consumption calculation, Running distance calculation, Stress level measurement, Temperature sensor, Fall detection",26,4);
insert into specification(name,value,productid,categoryid)
values("Smart Features","Has GPS positioning, Install applications, Play music on the watch, Practice mode, Display phone notifications, Customize the watch face, Listen to calls on the watch, Control music playback, Connect headphones, Press Time, Alarm, Call via Bluetooth",26,4);
------------
insert into specification(name,value,productid,categoryid)
values("Battery Life","18 hours",27,4);
insert into specification(name,value,productid,categoryid)
values("Screen Technology","Retina LTPO OLED",27,4);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","32GB",27,4);
insert into specification(name,value,productid,categoryid)
values("Operating System","WatchOS",27,4);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Apple",27,4);
insert into specification(name,value,productid,categoryid)
values("Health Benefits","Training mode, Sleep monitoring, Heart rate measurement, Blood oxygen measurement, Step counting, Calorie consumption calculation, Running distance calculation, Stress level measurement, Temperature sensor, Fall detection",27,4);
insert into specification(name,value,productid,categoryid)
values("Smart Features","Has GPS positioning, Install applications, Play music on the watch, Practice mode, Display phone notifications, Customize the watch face, Listen to calls on the watch, Control music playback, Connect headphones, Press Time, Alarm, Call via Bluetooth",27,4);
----------
insert into specification(name,value,productid,categoryid)
values("Battery Life","Smart mode: About 0.75 days
Battery saving mode: About 1.5 days",28,4);
insert into specification(name,value,productid,categoryid)
values("Screen Technology","OLED",28,4);
insert into specification(name,value,productid,categoryid)
values("Internal Memory","32GB",28,4);
insert into specification(name,value,productid,categoryid)
values("Operating System","WatchOS",28,4);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Apple",28,4);
insert into specification(name,value,productid,categoryid)
values("Health Benefits","Training mode, Sleep monitoring, Heart rate measurement, Blood oxygen measurement, Step counting, Calorie consumption calculation, Running distance calculation, Stress level measurement, Temperature sensor, Fall detection",28,4);
insert into specification(name,value,productid,categoryid)
values("Smart Features","Has GPS positioning, Install applications, Play music on the watch, Practice mode, Display phone notifications, Customize the watch face, Listen to calls on the watch, Control music playback, Connect headphones, Press Time, Alarm, Call via Bluetooth",28,4);
---
insert into specification(name,value,productid,categoryid)
values("Charging Port","1 x Type-C",29,5);
insert into specification(name,value,productid,categoryid)
values("Charging capacity","20W",29,5);
insert into specification(name,value,productid,categoryid)
values("Feature","Power Delivery",29,5);
insert into specification(name,value,productid,categoryid)
values("Communication Port","USB-C",29,5);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Apple",29,5);
------------
insert into specification(name,value,productid,categoryid)
values("Resolution","1600 DPI",30,5);
insert into specification(name,value,productid,categoryid)
values("Compatible","MacOS, PadOS",30,5);
insert into specification(name,value,productid,categoryid)
values("How to connect","Bluetoorh",30,5);
insert into specification(name,value,productid,categoryid)
values("Charging Port","Lightning",30,5);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Apple",30,5);
----------
insert into specification(name,value,productid,categoryid)
values("Product Line","iPhone 15 Pro Max",31,5);
insert into specification(name,value,productid,categoryid)
values("Cladding classification","Hard plastic case",31,5);
insert into specification(name,value,productid,categoryid)
values("Feature","Supports MagSafe charging, Supports wireless charging",31,5);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Apple",31,5);
------------
insert into specification(name,value,productid,categoryid)
values("Other Features","Cleans fingerprints and smudges
Effective disinfection
Suitable for all products with LCD display screens",32,5);
-----------
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Rapoo",33,5);
---------------
insert into specification(name,value,productid,categoryid)
values("Output power","18W",34,5);
insert into specification(name,value,productid,categoryid)
values("Input charging port","Micro-USB / USB-C",34,5);
insert into specification(name,value,productid,categoryid)
values("Output charging port","2 × USB-A",34,5);
insert into specification(name,value,productid,categoryid)
values("Battery core","Lithium-ion Polymer",34,5);
insert into specification(name,value,productid,categoryid)
values("Battery capacity","20000mAh",34,5);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Xiaomi",34,5);
----------------
insert into specification(name,value,productid,categoryid)
values("Resolution","1080p/30 fps - 720p/ 60 fps",35,5);
insert into specification(name,value,productid,categoryid)
values("Swivel angle","78 degrees",35,5);
insert into specification(name,value,productid,categoryid)
values("Recording support","Micrô tích hợp: Âm thanh nổi
Phạm vi của mic: Lên tới 1 m",35,5);
insert into specification(name,value,productid,categoryid)
values("Communication Port","USB-A Port",35,5);
insert into specification(name,value,productid,categoryid)
values("Other Features","Mega pixel cameras: 3
Auto focus
Lens: Glass",35,5);
insert into specification(name,value,productid,categoryid)
values("Manufacturer","Logitech",35,5);

alter table orderline add column orderdate datetime null after productid;
alter table orderline add column enddate datetime null after orderdate;
alter table orderline add column status varchar(100) null after enddate;

















        






        











        






        





