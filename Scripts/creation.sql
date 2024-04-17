CREATE SCHEMA IF NOT EXISTS university_library;

CREATE TABLE IF NOT EXISTS university_library.Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR,
    author VARCHAR,
    genre VARCHAR,
    publication_year INTEGER
);

CREATE TABLE IF NOT EXISTS university_library.Students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR,
    email VARCHAR,
    major VARCHAR,
    year_of_study INTEGER
);

CREATE TABLE IF NOT EXISTS university_library.BookLoans (
    loan_id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES university_library.Books(book_id),
    student_id INTEGER REFERENCES university_library.Students(student_id),
    librarian_id INTEGER REFERENCES university_library.Librarians(librarian_id),
    loan_date DATE,
    return_date DATE,
    returned BOOLEAN
);

CREATE TABLE IF NOT EXISTS university_library.Librarians (
    librarian_id SERIAL PRIMARY KEY,
    name VARCHAR,
    email VARCHAR
);

CREATE TABLE IF NOT EXISTS university_library.StudentChanges (
    change_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES university_library.Students(student_id),
    change_date DATE,
    old_major VARCHAR,
    new_major VARCHAR
);


INSERT INTO university_library.Books (title, author, genre, publication_year) VALUES
    ('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925),
    ('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960),
    ('1984', 'George Orwell', 'Science Fiction', 1949),
    ('Pride and Prejudice', 'Jane Austen', 'Romance', 1813),
    ('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951),
    ('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937),
    ('The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 1954),
    ('Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'Fantasy', 1997),
    ('The Da Vinci Code', 'Dan Brown', 'Mystery', 2003),
    ('The Hunger Games', 'Suzanne Collins', 'Science Fiction', 2008),
    ('The Shining', 'Stephen King', 'Horror', 1977),
    ('The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Thriller', 2005),
    ('Gone Girl', 'Gillian Flynn', 'Mystery', 2012),
    ('The Fault in Our Stars', 'John Green', 'Young Adult', 2012),
    ('The Alchemist', 'Paulo Coelho', 'Fantasy', 1988),
    ('A Song of Ice and Fire', 'George R.R. Martin', 'Fantasy', 1996),
    ('The Help', 'Kathryn Stockett', 'Historical Fiction', 2009),
    ('The Road', 'Cormac McCarthy', 'Post-Apocalyptic', 2006),
    ('The Martian', 'Andy Weir', 'Science Fiction', 2011),
    ('The Book Thief', 'Markus Zusak', 'Historical Fiction', 2005);

INSERT INTO university_library.Students (name, email, major, year_of_study) VALUES
    ('John Doe', 'john.doe@example.com', 'Computer Science', 3),
    ('Jane Smith', 'jane.smith@example.com', 'History', 2),
    ('Michael Johnson', 'michael.johnson@example.com', 'Biology', 1),
    ('Emily Brown', 'emily.brown@example.com', 'English Literature', 4),
    ('David Wilson', 'david.wilson@example.com', 'Psychology', 3),
    ('Emma Jones', 'emma.jones@example.com', 'Chemistry', 2),
    ('Daniel Martinez', 'daniel.martinez@example.com', 'Sociology', 2),
    ('Olivia Taylor', 'olivia.taylor@example.com', 'Economics', 1),
    ('Andrew Anderson', 'andrew.anderson@example.com', 'Mathematics', 4),
    ('Sophia Hernandez', 'sophia.hernandez@example.com', 'Physics', 3),
    ('William Miller', 'william.miller@example.com', 'Political Science', 2),
    ('Isabella Davis', 'isabella.davis@example.com', 'Art History', 2),
    ('Matthew Rodriguez', 'matthew.rodriguez@example.com', 'Engineering', 1),
    ('Samantha Martinez', 'samantha.martinez@example.com', 'Music', 4),
    ('Ethan Thompson', 'ethan.thompson@example.com', 'Business Administration', 3),
    ('Ava Garcia', 'ava.garcia@example.com', 'Philosophy', 2),
    ('Alexander Wright', 'alexander.wright@example.com', 'Communication', 1),
    ('Mia Perez', 'mia.perez@example.com', 'Environmental Science', 4),
    ('James Torres', 'james.torres@example.com', 'Health Science', 3),
    ('Charlotte King', 'charlotte.king@example.com', 'Linguistics', 2);

INSERT INTO university_library.Librarians (name, email) VALUES
    ('Alice Johnson', 'alice.johnson@example.com'),
    ('Bob Smith', 'bob.smith@example.com'),
    ('Charlie Brown', 'charlie.brown@example.com'),
    ('Diana Wilson', 'diana.wilson@example.com'),
    ('Eve Davis', 'eve.davis@example.com'),
    ('Frank Taylor', 'frank.taylor@example.com'),
    ('Grace Martin', 'grace.martin@example.com'),
    ('Henry Turner', 'henry.turner@example.com'),
    ('Isabel Young', 'isabel.young@example.com'),
    ('Jack Harris', 'jack.harris@example.com'),
    ('Karen Clark', 'karen.clark@example.com'),
    ('Liam Martinez', 'liam.martinez@example.com'),
    ('Mia Perez', 'mia.perez@example.com'),
    ('Nathan Thompson', 'nathan.thompson@example.com'),
    ('Olivia White', 'olivia.white@example.com'),
    ('Peter Adams', 'peter.adams@example.com'),
    ('Rachel Scott', 'rachel.scott@example.com'),
    ('Samuel Lee', 'samuel.lee@example.com'),
    ('Tina Hall', 'tina.hall@example.com'),
    ('Victor Garcia', 'victor.garcia@example.com');

INSERT INTO university_library.BookLoans (book_id, student_id, librarian_id, loan_date, return_date, returned) VALUES
    (1, 1, 1, '2023-01-01', '2023-01-15', TRUE),
    (2, 2, 2, '2023-02-01', '2023-02-15', TRUE),
    (3, 3, 3, '2023-03-01', '2023-03-15', TRUE),
    (4, 4, 4, '2023-04-01', '2023-04-15', TRUE),
    (5, 5, 5, '2023-05-01', '2023-05-15', TRUE),
    (6, 6, 6, '2023-06-01', '2023-06-15', TRUE),
    (7, 7, 7, '2023-07-01', '2023-07-15', TRUE),
    (8, 8, 8, '2023-08-01', '2023-08-15', TRUE),
    (9, 9, 9, '2023-09-01', '2023-09-15', TRUE),
    (10, 10, 10, '2023-10-01', '2023-10-15', TRUE),
    (11, 11, 11, '2023-11-01', '2023-11-15', TRUE),
    (12, 12, 12, '2023-12-01', '2023-12-15', TRUE),
    (13, 13, 13, '2024-01-01', '2024-01-15', TRUE),
    (14, 14, 14, '2024-02-01', '2024-02-15', TRUE),
    (15, 15, 15, '2024-03-01', '2024-03-15', FALSE),
    (16, 16, 16, '2024-04-01', '2024-04-15', FALSE),
    (17, 17, 17, '2024-05-01', '2024-05-15', FALSE),
    (18, 18, 18, '2024-06-01', '2024-06-15', FALSE);

INSERT INTO university_library.StudentChanges (student_id, change_date, old_major, new_major) VALUES
    (1, '2022-01-01', 'Computer Science', 'Data Science'),
    (2, '2022-02-01', 'History', 'Archaeology'),
    (3, '2022-03-01', 'Biology', 'Biochemistry'),
    (4, '2022-04-01', 'English Literature', 'Creative Writing'),
    (5, '2022-05-01', 'Psychology', 'Neuroscience'),
    (6, '2022-06-01', 'Chemistry', 'Biochemistry'),
    (7, '2022-07-01', 'Sociology', 'Anthropology'),
    (8, '2022-08-01', 'Economics', 'Finance'),
    (9, '2022-09-01', 'Mathematics', 'Statistics'),
    (10, '2022-10-01', 'Physics', 'Astrophysics'),
    (11, '2022-11-01', 'Political Science', 'International Relations'),
    (12, '2022-12-01', 'Art History', 'Museum Studies'),
    (13, '2023-01-01', 'Engineering', 'Computer Engineering'),
    (14, '2023-02-01', 'Music', 'Music Therapy'),
    (15, '2023-03-01', 'Business Administration', 'Entrepreneurship'),
    (16, '2023-04-01', 'Philosophy', 'Ethics'),
    (17, '2023-05-01', 'Communication', 'Public Relations'),
    (18, '2023-06-01', 'Environmental Science', 'Conservation Biology'),
    (19, '2023-07-01', 'Health Science', 'Public Health'),
    (20, '2023-08-01', 'Linguistics', 'Computational Linguistics');
