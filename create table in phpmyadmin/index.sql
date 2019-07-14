DROP DATABASE IF EXISTS LoginSystem;
CREATE DATABASE LoginSystem DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE LoginSystem;

CREATE TABLE Users
(
  id bigint unsigned primary key auto_increment,
  username varchar(50) not null,
  password varchar(50) not null
);

CREATE TABLE Blog_content
(
  id bigint unsigned primary key auto_increment,
  create_date date,
  username varchar(50) not null,
  title varchar(255) not null,
  content TEXT not null
);

INSERT INTO Users(id, username, password) values
  (1, 'admin', 'admin'),
  (2, 'admin0', 'admin0'),
  (3, 'admin1', 'admin1');

INSERT INTO Blog_content(id, username, create_date, title, content) values
  (1, 'admin0', '2019-06-17', 'Python',
    'Python is an advanced programming language that is interpreted, object-oriented and built on flexible and robust semantics.'),
  (2, 'admin', '2019-06-16', 'JavaScript',
    'Often abbreviated as JS, is a high-level, interpreted programming language that conforms to the ECMAScript specification.'),
  (3, 'admin1', '2019-06-13', 'Java',
  'Java is a general-purpose, object-oriented, high-level programming language with several features that make it ideal for web-based development.'),
  (4, 'admin', '2019-06-12', 'Ruby',
  'Ruby is an open-sourced, object-oriented scripting language that can be used independently or as part of the Ruby on Rails web framework.'),
  (5, 'admin1', '2019-06-11', 'C Language',
  'C Language is a structure-oriented, middle-level programming language mostly used to develop low-level applications.'),
  (6, 'admin0', '2019-06-10', 'Swift',
  'Swift is Apple’s newest open-source, multi-paradigm programming language for iOS and OS X apps.');

show databases;

SELECT * FROM Users;
SELECT * FROM Blog_content;
