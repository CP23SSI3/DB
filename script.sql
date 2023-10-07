show tables;
select * from posts;
drop table addresses;
drop table posts;
drop table companies;

CREATE TABLE Orders (
                        OrderID int NOT NULL,
                        OrderNumber int NOT NULL,
                        PersonID VARCHAR(64),
                        PRIMARY KEY (OrderID),
                        FOREIGN KEY (PersonID) REFERENCES addresses(addressId)
);

# drop table companies;
create table if not exists addresses (
    addressId VARCHAR(64) NOT NULL,
    country VARCHAR(50) NOT NULL,
    postalCode VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    district VARCHAR(50) NOT NULL,
    subDistrict VARCHAR(50) NOT NULL,
    area VARCHAR(200),
    primary key (addressId)
) engine = InnoDB;

insert into addresses values('address1','Thailand','10120','Bangkok','Sathorn','ThungWatDon','17 Chan road');

create table if not exists companies (
    compId VARCHAR(64) NOT NULL UNIQUE ,
    compName VARCHAR(100) NOT NULL,
    compLogoUrl VARCHAR(100) NOT NULL,
    createdDate DATETIME NOT NULL,
    lastUpdate DATETIME NOT NULL,
    lastActive DATETIME NOT NULL,
    defaultWelfare VARCHAR(100),
    compUrl VARCHAR(100) NOT NULL,
    addressId VARCHAR(64) NOT NULL,
    primary key (compId),
    foreign key (addressId) references addresses (addressId)
#     constraint 'fk_address_addressId' foreign key ('addressId') references 'internhub'.'addresses' ('addressId')
#                                      ON delete  no action
#                                      ON update no action
);

insert into companies values ('companies1', 'Test company', 'https://www.google.com',
                      '2023-10-04 13:30:00+07:00','2023-10-04 13:30:00+07:00','2023-10-04 13:30:00+07:00',
                      null,'https://www.google.com', 'address1');

create table if not exists posts (
    postId VARCHAR(64) NOT NULL UNIQUE ,
    title VARCHAR(100) NOT NULL,
    createdDate DATETIME NOT NULL,
    lastUpdate DATETIME NOT NULL,
    totalView LONG NOT NULL,
    isDeleted BOOLEAN NOT NULL,
    postDesc VARCHAR(500),
    postWelfare VARCHAR(500),
    workMonth INTEGER NOT NULL,
    enrolling   VARCHAR(500) NOT NULL,
    documents VARCHAR(30) NOT NULL,
    coordinatorName VARCHAR(100) NOT NULL,
    addressId VARCHAR(64) NOT NULL
);

insert into posts values (
                          'post1','test title', '2023-10-04 13:30:00+07:00','2023-10-04 13:30:00+07:00', 382, false,
                          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piecod and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',
                          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin ',
                          6,
                          'Contrary to popular belief, Lorem e from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written i',
                          'PortFolio,Resume', 'วิชชุตา พิภพภิญโญ', 'address1'
                         )

