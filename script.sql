create DATABASE if not EXISTS internhub;
use internhub;

drop table if exists postPositionTags;
drop table if exists openPositions;
drop table if exists positionTags;
drop table if exists posts;
drop table if exists companies;
drop table if exists addresses;

set names utf8;

create table if not exists addresses (
                                         addressId VARCHAR(36) NOT NULL,
                                         country VARCHAR(90) NOT NULL,
                                         postalCode VARCHAR(10) NOT NULL,
                                         city VARCHAR(35) NOT NULL,
                                         district VARCHAR(50) NOT NULL,
                                         subDistrict VARCHAR(50) NOT NULL,
                                         area VARCHAR(100) NOT NULL,
                                         latitude DECIMAL(10,8) NOT NULL,
                                         longitude DECIMAL(11,8) NOT NULL,
                                         primary key (addressId)
) engine = InnoDB;

insert into addresses values('9346a466-4a82-4037-ab00-72ba24fa50bf',
                             'ประเทศไทย',
                             '10120',
                             'กรุงเทพมหานคร',
                             'สาทร',
                             'ทุ่งวัดดอน',
                             '17 ถนนจันทน์',
                             13.705368,
                             100.5331527);

create table if not exists companies (
                                         compId VARCHAR(36) NOT NULL UNIQUE ,
                                         compName VARCHAR(100) NOT NULL,
                                         compLogoKey VARCHAR(100) NOT NULL,
                                         compDesc VARCHAR(500) NOT NULL,
                                         defaultWelfare VARCHAR(1500),
                                         createdDate DATETIME NOT NULL,
                                         lastUpdate DATETIME NOT NULL,
                                         lastActive DATETIME NOT NULL,
                                         compUrl VARCHAR(255) NOT NULL,
                                         addressId VARCHAR(36) NOT NULL,
                                         primary key (compId),
                                         foreign key (addressId) references addresses (addressId)
) engine = InnoDB;

insert into companies values ('8e20782f-2807-4f13-a11e-0fb9ff955488',
                              'Test company',
                              'https://www.google.com',
                              'This is a compDesc as an example. Hope we will be able to make a move soon',
                              'Lorem for the welfare for this company, This is the example script only',
                              '2023-10-04 13:30:00+07:00',
                              '2023-10-04 13:30:00+07:00','2023-10-04 13:30:00+07:00',
                              'https://www.google.com',
                              '9346a466-4a82-4037-ab00-72ba24fa50bf');

create table if not exists positionTags (
                                            positionTagName VARCHAR(50) NOT NULL,
                                            primary key (positionTagName)
) engine = InnoDB;

insert into positionTags values ('Frontend developer');
insert into positionTags values ('Backend developer');

create table if not exists posts(
                                    postId VARCHAR(36) NOT NULL,
                                    title VARCHAR(100) NOT NULL,
                                    createdDate DATETIME NOT NULL,
                                    lastUpdateDate DATETIME NOT NULL,
                                    closedDate DATE,
                                    totalView NUMERIC NOT NULL,
                                    status VARCHAR(15) NOT NULL,
                                    postDesc VARCHAR(1500) NOT NULL,
                                    compId VARCHAR(36) NOT NULL,
                                    postWelfare VARCHAR(1500) NOT NULL,
                                    enrolling VARCHAR(1500) NOT NULL,
                                    documents VARCHAR(100),
                                    coordinatorName VARCHAR(100) NOT NULL,
                                    tel VARCHAR(12) NOT NULL,
                                    email VARCHAR(320) NOT NULL,
                                    addressId VARCHAR(36) NOT NULL,
                                    workStartTime TIME NOT NULL,
                                    workEndTime TIME NOT NULL,
                                    workDay VARCHAR(30) NOT NULL,
                                    workType VARCHAR(20) NOT NULL,
                                    postUrl VARCHAR(255),
                                    primary key (postId),
                                    foreign key (compId) references companies(compId),
                                    foreign key (addressId) references addresses(addressId)
) engine = InnoDB;

insert into posts values (
                             'eba83fe4-937b-4054-a420-d977534feebe',
                             'This is a title',
                             '2023-10-04 13:30:00+07:00',
                             '2023-10-05 13:30:00+07:00',
                             null,
                             125,
                             'ALWAYS_OPENED',
                             'This is the description',
                             '8e20782f-2807-4f13-a11e-0fb9ff955488',
                             'This is default welfare. Free snack and salary-free.',
                             'Please contact coordinate via emil only',
                             'portfolio,resume,cv',
                             'Vichuta Pipoppinyo',
                             '012-345-6789',
                             'nice.vct@mail.kmutt.ac.th',
                             '9346a466-4a82-4037-ab00-72ba24fa50bf',
                             '09:30',
                             '17:30',
                             'mon,tue,wed,thu,fri',
                             'HYBRID',
                             'https://www.wikipedia.org/'
                         );
-- insert into posts values (
--                              'eba83fe4-937b-4054-a420-d977534feebe',
--                              'ประกาศรับฝึกงาน ด่วนที่สุด บริษัทตามใจฉัน',
--                              '2023-10-04 13:30:00+07:00',
--                              '2023-10-05 13:30:00+07:00',
--                              null,
--                              125,
--                              'OPENED',
--                              'ประกาศรับฝึกงานด่วนที่สุดแต่ตลอดทั้งปี นี่คือส่วนหนึ่งของตัวอย่างรายละเอียดข้อมูล',
--                              '8e20782f-2807-4f13-a11e-0fb9ff955488',
--                              'สวัสดิการพื้นฐาน : กินขนมฟรี ข้าวฟรี ไม่มีเงินเดือน',
--                              'ติดต่อไนซ์ วิชชุตา พิภพภิญโญสำหรับข้อมูลเพิ่มเติม กรุณาติดต่อผ่านอีเมลที่ระบุเอาไว้เท่านั้น',
--                              'portfolio,resume,cv',
--                              'Vichuta Pipoppinyo',
--                              '012-345-6789',
--                              'nice.vct@mail.kmutt.ac.th',
--                              '9346a466-4a82-4037-ab00-72ba24fa50bf',
--                              '09:30',
--                              '17:30',
--                              'mon,tue,wed,thu,fri',
--                              'HYBRID',
--                              'https://www.wikipedia.org/'
--                          );

create table if not exists openPositions(
                                            openPositionId VARCHAR(36) NOT NULL,
                                            openPositionTitle VARCHAR(50) NOT NULL,
                                            openPositionNum NUMERIC,
                                            openPositionDesc VARCHAR(200) NOT NULL,
                                            postId VARCHAR(36) NOT NULL,
                                            workMonth NUMERIC,
                                            salary NUMERIC,
                                            primary key (openPositionId),
                                            foreign key (postId) references posts (postId) on delete cascade
) engine = InnoDB;

insert into openPositions values (
                                     '24526070-68cf-48ff-8d02-29e9d05aeda2',
                                     'Frontend Developer',
                                     4,
                                     'Working on Frontend mainly, using React',
                                     'eba83fe4-937b-4054-a420-d977534feebe',
                                     6,
                                     300
                                 );

insert into openPositions values (
                                     '72d02945-9f1b-401a-9809-b10aff9406cc',
                                     'Backend developer',
                                     2,
                                     'Open position - for Java or Kotlin',
                                     'eba83fe4-937b-4054-a420-d977534feebe',
                                     4,
                                     250
                                 );

create table if not exists postPositionTags(
    postPositionTagId VARCHAR(36) NOT NULL,
    postId VARCHAR(36) NOT NULL,
    positionTagName VARCHAR(50) NOT NULL,
    primary key (postPositionTagId),
    foreign key (postId) references posts (postId) on delete no action,
    foreign key (positionTagName) references positionTags (positionTagName) on delete no action on update cascade
) engine = InnoDB;

insert into postPositionTags values (
                                 '991fd0cf-45e2-4c76-80cc-823fcfdf39c7',
                                 'eba83fe4-937b-4054-a420-d977534feebe',
                                 'Frontend developer'
                                );

insert into postPositionTags values (
                                    '8beec659-3cc2-4c0d-b79f-3370ca8dc1bc',
                                    'eba83fe4-937b-4054-a420-d977534feebe',
                                    'Backend developer'
                                );
