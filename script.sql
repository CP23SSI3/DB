create DATABASE if not EXISTS internhub;
use internhub;

drop table if exists languages;
drop table if exists skills;
drop table if exists educations;
drop table if exists experiences;
drop table if exists users;
drop table if exists postPositionTags;
drop table if exists openPositions;
drop table if exists positionTags;
drop table if exists posts;
drop table if exists companies;
drop table if exists addresses;

set names utf8;

create table if not exists addresses (
                                         addressId VARCHAR(36) NOT NULL UNIQUE,
                                         area VARCHAR(100) NOT NULL,
                                         city VARCHAR(35) NOT NULL,
                                         country VARCHAR(90) NOT NULL,
                                         district VARCHAR(50) NOT NULL,
                                         latitude DECIMAL(10,8) NOT NULL,
                                         longitude DECIMAL(11,8) NOT NULL,
                                         postalCode VARCHAR(10) NOT NULL,
                                         subDistrict VARCHAR(50) NOT NULL,
                                         primary key (addressId)
) engine = InnoDB;

-- for company1
insert into addresses values('9346a466-4a82-4037-ab00-72ba24fa50bf',
                             '17 ถนนจันทน์',
                             'กรุงเทพ',
                             'ประเทศไทย',
                             'สาทร',
                             13.705368,
                             100.5331527,
                             '10120',
                             'ทุ่งวัดดอน');
-- for user
insert into addresses values('df292024-0858-4590-af5f-f92fd950d1df',
                             '357/12 ตึกแถว',
                             'กรุงเทพ',
                             'ประเทศไทย',
                             'บางขุนเทียน',
                             13.618337,
                             100.401392,
                             '10150',
                             'ทุงแสมดำ');
-- for admin
insert into addresses values('fc1e7058-b373-4abd-aad0-8140f9658652',
                             '57 หมู่ 123 ซอย 5 ',
                             'กรุงเทพ',
                             'ประเทศไทย',
                             'ตลิ่งชัน',
                             13.788523,
                             100.445822,
                             '10170',
                             'ตลิ่งชัน');
-- for user company1
insert into addresses values('0e17bf21-b0bc-41e3-90f3-000c65707ddc',
                             'ติดรฟฟ ช่องนนทรี',
                             'กรุงเทพ',
                             'ประเทศไทย',
                             'ยานนาวา',
                             13.696311,
                             100.546316,
                             '10120',
                             'ช่องนนทรี');

create table if not exists companies (
                                         addressId VARCHAR(36),
                                         compDesc VARCHAR(500),
                                         compId VARCHAR(36) NOT NULL,
                                         compLogoKey VARCHAR(5000) NOT NULL,
                                         compName VARCHAR(100) NOT NULL,
                                         compUrl VARCHAR(255),
                                         createdDate DATETIME NOT NULL,
                                         defaultWelfare VARCHAR(1500),
                                         lastActive DATETIME NOT NULL,
                                         lastUpdate DATETIME NOT NULL,
                                         primary key (compId),
                                         foreign key (addressId) references addresses (addressId) on delete cascade on update cascade
) engine = InnoDB;

insert into companies values ('9346a466-4a82-4037-ab00-72ba24fa50bf',
                              'This is a compDesc as an example. Hope we will be able to make a move soon',
                              '8e20782f-2807-4f13-a11e-0fb9ff955488',
                              'https://internhub-company-logo.s3.ap-southeast-2.amazonaws.com/c6703236-53ec-45a7-ba7d-efed13fcf1ef.jpg',
                              'Test company',
                              'https://www.google.com',
                              '2023-10-04 13:30:00+07:00',
                              'Lorem for the welfare for this company, This is the example script only',
                              '2023-10-04 13:30:00+07:00',
                              '2023-10-04 13:30:00+07:00');

create table if not exists positionTags (
                                            positionTagName VARCHAR(50) NOT NULL,
                                            primary key (positionTagName)
) engine = InnoDB;

insert into positionTags values ('Frontend developer');
insert into positionTags values ('Backend developer');

create table if not exists posts(
                                    addressId VARCHAR(36) NOT NULL,
                                    closedDate DATE,
                                    compId VARCHAR(36) NOT NULL,
                                    coordinatorName VARCHAR(100) NOT NULL,
                                    createdDate DATETIME NOT NULL,
                                    documents VARCHAR(100),
                                    email VARCHAR(320) NOT NULL,
                                    enrolling VARCHAR(1500) NOT NULL,
                                    lastUpdateDate DATETIME NOT NULL,
                                    postDesc VARCHAR(1500) NOT NULL,
                                    postId VARCHAR(36) NOT NULL,
                                    postUrl VARCHAR(255),
                                    postWelfare VARCHAR(1500) NOT NULL,
                                    status VARCHAR(15) NOT NULL,
                                    tel VARCHAR(12) NOT NULL,
                                    title VARCHAR(100) NOT NULL,
                                    totalView NUMERIC NOT NULL,
                                    workDay VARCHAR(30) NOT NULL,
                                    workEndTime TIME NOT NULL,
                                    workStartTime TIME NOT NULL,
                                    workType VARCHAR(20) NOT NULL,
                                    primary key (postId),
                                    foreign key (compId) references companies(compId),
                                    foreign key (addressId) references addresses(addressId)
) engine = InnoDB;

insert into posts values (
                             '9346a466-4a82-4037-ab00-72ba24fa50bf',
                             null,
                             '8e20782f-2807-4f13-a11e-0fb9ff955488',
                             'Vichuta Pipoppinyo',
                             '2023-10-04 13:30:00+07:00',
                             'portfolio,resume,cv',
                             'nice.vct@mail.kmutt.ac.th',
                             'Please contact coordinate via emil only',
                             '2023-10-05 13:30:00+07:00',
                             'This is the description',
                             'eba83fe4-937b-4054-a420-d977534feebe',
                             'https://www.wikipedia.org/',
                             'This is default welfare. Free snack and salary-free.',
                             'ALWAYS_OPENED',
                             '012-345-6789',
                             'This is a title',
                             125,
                             'mon,tue,wed,thu,fri',
                             '17:30',
                             '09:30',
                             'HYBRID');
                         
create table if not exists openPositions(
                                            openPositionId VARCHAR(36) NOT NULL,
                                            openPositionNum NUMERIC,
                                            openPositionTitle VARCHAR(50) NOT NULL,
                                            openPositionDesc VARCHAR(200) NOT NULL,
                                            postId VARCHAR(36) NOT NULL,
                                            salary NUMERIC,
                                            workMonth NUMERIC,
                                            primary key (openPositionId),
                                            foreign key (postId) references posts (postId) on delete cascade
) engine = InnoDB;

insert into openPositions values (
                                     '24526070-68cf-48ff-8d02-29e9d05aeda2',
                                     4,
                                     'Frontend Developer',
                                     'Working on Frontend mainly, using React',
                                     'eba83fe4-937b-4054-a420-d977534feebe',
                                     300,
                                     6
                                 );

insert into openPositions values (
                                     '72d02945-9f1b-401a-9809-b10aff9406cc',
                                     2,
                                     'Backend developer',
                                     'Open position - for Java or Kotlin',
                                     'eba83fe4-937b-4054-a420-d977534feebe',
                                     250,
                                     4
                                 );

create table if not exists postPositionTags(
    postId VARCHAR(36) NOT NULL,
    postPositionTagId VARCHAR(36) NOT NULL,
    positionTagName VARCHAR(50) NOT NULL,
    primary key (postPositionTagId),
    foreign key (postId) references posts (postId) on delete no action,
    foreign key (positionTagName) references positionTags (positionTagName) on delete no action on update cascade
) engine = InnoDB;

insert into postPositionTags values (
                                 'eba83fe4-937b-4054-a420-d977534feebe',
                                 '991fd0cf-45e2-4c76-80cc-823fcfdf39c7',
                                 'Frontend developer'
                                );

insert into postPositionTags values (
                                    'eba83fe4-937b-4054-a420-d977534feebe',
                                    '8beec659-3cc2-4c0d-b79f-3370ca8dc1bc',
                                    'Backend developer'
                                );
                                
create table if not exists users(
    addressId VARCHAR(36),
    dateOfBirth DATE NOT NULL,
    compId VARCHAR(36),
    createdDate DATETIME NOT NULL,
    email VARCHAR(320) NOT NULL unique,
    firstname VARCHAR(50) NOT NULL,
    gender CHAR(1),
    lastActive DATETIME NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    lastUpdate DATETIME NOT NULL,
    password VARCHAR(72) NOT NULL,
    phoneNumber VARCHAR(10) NOT NULL,
    role VARCHAR(7) NOT NULL,
	userId VARCHAR(36) NOT NULL,
    userDesc VARCHAR(1500), 
    username VARCHAR(50) NOT NULL unique,
    userProfileKey VARCHAR(5000),
    primary key (userId),
    foreign key (compId) references companies(compId) on delete no action on update cascade,
    foreign key (addressId) references addresses(addressId)
) engine = InnoDB;

-- userpassword
insert into users values (
	'df292024-0858-4590-af5f-f92fd950d1df',
    '2002-09-24',
    null,
	'2023-10-04 13:30:00+07:00',
	'user@gmail.com',
	'userfirstname',
    null,
	'2023-10-04 13:30:00+07:00',
	'userlastname',
	'2023-10-04 13:30:00+07:00',
	'$2a$10$y2DNP33YK9YIrklkbDmhye8d90CzFkA6PEJmfUJbYQ/xoyZ1V93Mq',
	'0123456789',
	'USER',
	'c6703236-53ec-45a7-ba7d-efed13fcf1ef',
    'This is me, myself, hope you hapy to see me!',
	'testuser',
    'https://internhub-user-profile.s3.ap-southeast-2.amazonaws.com/c6703236-53ec-45a7-ba7d-efed13fcf1ef.jpg'
);

-- adminpassword
insert into users values (
	'fc1e7058-b373-4abd-aad0-8140f9658652',
    '2002-09-24',
    null,
	'2023-10-04 13:30:00+07:00',
	'admin@gmail.com',
	'adminfirstname',
    'M',
	'2023-10-04 13:30:00+07:00',
	'adminlastname',
	'2023-10-04 13:30:00+07:00',
	'$2a$10$R.ZDF.3Od/epLDl17N4sNuXve.aKqcprWlo.4LqKDf82QUa85hNf.',
	'0123456789',
	'ADMIN',
	'9c2e4bd8-a897-4bce-9a63-5267283d6e30',
    null,
	'testadmin',
    'https://internhub-user-profile.s3.ap-southeast-2.amazonaws.com/9c2e4bd8-a897-4bce-9a63-5267283d6e30.png'
);

-- user for company 1
-- comppassword
insert into users values (
	'0e17bf21-b0bc-41e3-90f3-000c65707ddc',
    '2002-09-24',
    '8e20782f-2807-4f13-a11e-0fb9ff955488',
	'2023-10-04 13:30:00+07:00',
	'comp@gmail.com',
	'compfirstname',
    'F',
	'2023-10-04 13:30:00+07:00',
	'complastname',
	'2023-10-04 13:30:00+07:00',
	'$2a$10$R7AONgcdcSmQn1cEBzjLNeXqav9aJ0FyTrQj9WMWTEANEpsAglL/e',
	'0123456789',
	'COMPANY',
	'd2f41869-e585-4df0-83fa-ab83b8aa6625',
    null,
	'testcompany',
    'https://internhub-user-profile.s3.ap-southeast-2.amazonaws.com/d2f41869-e585-4df0-83fa-ab83b8aa6625.jpg'
);

create table if not exists educations(
	degree VARCHAR(50) NOT NULL,
    educationDesc VARCHAR(1500),
    educationId VARCHAR(36),
    field VARCHAR(100),
	grade VARCHAR(5),
	graduatedYear YEAR,
	schoolName VARCHAR(100) NOT NULL,
    startedYear YEAR NOT NULL,
    userId VARCHAR(36) NOT NULL,
    primary key (educationId),
    foreign key (userId) references users (userId)
);

insert into educations value(
	'อนุบาล',
	'ศึกษาระดับอนุบาลแบบ English program ที่เน้นการใช้ภาษาอังกฤษเป็นหลัก',
	'4d3046e9-f8f1-4fed-a193-47313df1a5f9',
	null,
	null,
	2006,
	'โรงเรียนพระแม่มารีย์',
	2004,
	'c6703236-53ec-45a7-ba7d-efed13fcf1ef'
);

insert into educations value(
	'ประถมศึกษา',
	null,
	'f6c487de-87e8-4473-8572-cbdb41878759',
	null,
	3.8,
	2006,
	'โรงเรียนอัสสัมชัญคอนแวนต์ สีลม',
	2012,
	'c6703236-53ec-45a7-ba7d-efed13fcf1ef'
);

create table if not exists experiences(
	compName VARCHAR(100) NOT NULL,
	endedYear YEAR,
    experienceId VARCHAR(36) NOT NULL,
	experienceName VARCHAR(100) NOT NULL,
    experienceDesc VARCHAR(1500) NOT NULL,
    position VARCHAR(100) NOT NULL,
    startedYear YEAR NOT NULL,
    userId VARCHAR(36) NOT NULL,
    primary key (experienceId),
    foreign key (userId) references users (userId)
);

insert into experiences value(
	'Bangmod Exterprise Co.Ltd',
    2023,
    '596ffd3b-49c3-4501-bcf3-007ed6704afc',
    'Full stack developer internship program',
    'Focus on Frontend developer using react and clojure. Casually work on Backend using Kotlin.',
    'Full Stack developer',
    2023,
    'c6703236-53ec-45a7-ba7d-efed13fcf1ef');

create table if not exists skills(
    userId VARCHAR(36) NOT NULL,
    skillId VARCHAR(36) NOT NULL,
	skillName VARCHAR(100) NOT NULL,
    skillDesc VARCHAR(1500) NOT NULL,
    primary key (skillId),
    foreign key (userId) references users (userId)
);

insert into skills value(
    'c6703236-53ec-45a7-ba7d-efed13fcf1ef',
    '84d04c66-12ca-4d76-ac6f-e93273816d36',
    'Drawing',
    'Able to draw a picture digitally. Specialized at Anime style character.');

insert into skills value(
    'c6703236-53ec-45a7-ba7d-efed13fcf1ef',
	'b8a77c02-7c78-44dc-a552-4be33dadf94f',
    '2D model rigging',
	'2D model rigging using Live2DCubism (beginner).');

create table if not exists languages(
	languageId VARCHAR(36) NOT NULL,
	languageName VARCHAR(50) NOT NULL,
    userId VARCHAR(36) NOT NULL,
    primary key (languageId),
    foreign key (userId) references users (userId)
);

insert into languages value(
	'fc4c23d1-a3a4-45e9-9e83-053342df2958',
	'ภาษาไทย',
    'c6703236-53ec-45a7-ba7d-efed13fcf1ef'
);

insert into languages value(
	'eaf3d8a4-b12a-4eab-a8e8-15def907a542',
	'ภาษาอังกฤษ',
    'c6703236-53ec-45a7-ba7d-efed13fcf1ef'
);

insert into languages values(
	'f994de02-30f0-4286-9909-f353286d0357',
	'ภาษาญี่ปุ่น',
    'c6703236-53ec-45a7-ba7d-efed13fcf1ef'
);


