CREATE TABLE Author(
  author_id PRIMARY KEY,
  first_name varchar(30),
  last_name varchar(30)
);

CREATE TABLE Pub(
    pub_id PRIMARY KEY,
    title varchra(30),
    foreign key (book_id) references Book 
);

CREATE TABLE AuthorPub(
    foreign key (author_id) from Author,
    foreign key (pub_id) from Pub,
    author_position integer
);

CREATE TABLE Book(
    book_id PRIMARY KEY,
    book_title varchar(30),
    month varchar(10),
    year integer,
    editor integer
);


INSERT INTO Author(first_name, last_name) VALUES
    ('John', 'McCarthy'),
    ('Dennis','Ritchie'),
    ('Ken','Thompson'),
    ('Claude','Shannon'),
    ('Alan','Turing'),
    ('Alonzo','Church'),
    ('Perry','White'),
    ('Moshe','Vardi'),
    ('Roy','Batty');

INSERT INTO Book(book_title, month, year, editor) VALUES
    ('CACM', 'April', 1960, 8),
    ('CACM', 'July', 1974, 8),
    ('BTS', 'July', 1948, 2),
    ('MLS', 'November', 1936, 7),
    ('Mind', 'October', 1950, NULL),
    ('AMS', 'Month', 1941, NULL),
    ('AAAI', 'July', 2012, 9),
    ('NIPS', 'July', 2012, 9);
    
INSERT INTO Pub(title, book_id) VALUES
    ('LISP', 1),
    ('Unix', 2),
    ('INFO Theory', 3),
    ('Turing Machine', 4),
    ('Turing Test', 5),
    ('Lamda Calc', 6);
    
INSERT INTO AuthorPub (author_id, pub_id, author_position) VALUES
    (1, 1, 1),
    (2, 2, 1),
    (3, 2, 2),
    (4, 3, 2),
    (5, 4, 1),
    (5, 5, 1),
    (6, 6, 1);
    
-- 1
SELECT A.*, B.*
FROM Author AS A, Book AS B
WHERE A.author_id=B.editor;

-- 2
SELECT DISTINCT Author.first_name, Author.last_name FROM ((SELECT DISTINCT author_id from Author) EXCEPT (SELECT DISTINCT editor AS author_id FROM Book)) AS nonEditors
RIGHT JOIN Author ON nonEditors.author_id=Author.author_id;

-- 3
(SELECT DISTINCT author_id from Author) EXCEPT (SELECT DISTINCT editor AS author_id FROM Book);
