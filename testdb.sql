# Creates a table with 2 fields, bookname and author.
# The character limit is set to 50 which should cater to most book title lengths,
# as well as author name lengths.
CREATE TABLE availablebooks(
       bookname varchar(50) NOT NULL,
       author varchar(50) NOT NULL
);

# Populate the database with several books to display how the database will be presented.
INSERT INTO availablebooks (bookname,author) VALUES ('Moby Dick', 'Herman Melville');
INSERT INTO availablebooks (bookname,author) VALUES ('War and Peace', 'Leo Tolstoy');
INSERT INTO availablebooks (bookname,author) VALUES ('The Odyssey','Homer');