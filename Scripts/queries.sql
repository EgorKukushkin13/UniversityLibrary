--Список студентов, взявших книги у библиотекарей, с указанием количества взятых книг
SELECT students.name, librarians.name AS librarian, COUNT(university_library.bookloans.book_id) AS total_books
FROM university_library.bookloans
JOIN university_library.students ON bookloans.student_id = students.student_id
JOIN university_library.librarians ON bookloans.librarian_id = librarians.librarian_id
GROUP BY students.name, librarians.name
ORDER BY total_books DESC;

--Средний возраст студентов каждой специализации
SELECT major, AVG(year_of_study) AS average_year_of_study
FROM university_library.students
GROUP BY major
ORDER BY average_year_of_study;

--Количество взятых книг каждым студентом за каждый год обучения
SELECT students.name, students.year_of_study, COUNT(university_library.bookloans.book_id) AS total_books
FROM university_library.bookloans
JOIN university_library.students ON bookloans.student_id = students.student_id
GROUP BY students.name, students.year_of_study
ORDER BY students.name, students.year_of_study;

--Список книг, которые не были возвращены после истечения срока
SELECT books.title, university_library.bookloans.loan_date, university_library.bookloans.return_date
FROM university_library.bookloans
JOIN university_library.books ON bookloans.book_id = books.book_id
WHERE bookloans.returned = FALSE AND bookloans.return_date < CURRENT_DATE;

--Общее количество книг, взятых каждым студентом, с группировкой по специализации
SELECT students.name, students.major, COUNT(university_library.bookloans.book_id) AS total_books
FROM university_library.bookloans
JOIN university_library.students ON bookloans.student_id = students.student_id
GROUP BY students.name, students.major
ORDER BY total_books DESC;

--Самый активный библиотекарь по количеству выданных книг
SELECT librarians.name, COUNT(university_library.bookloans.book_id) AS total_books
FROM university_library.bookloans
JOIN university_library.librarians ON bookloans.librarian_id = librarians.librarian_id
GROUP BY librarians.name
ORDER BY total_books DESC
LIMIT 1;

--Список студентов, не брали книги
SELECT students.name
FROM university_library.students
LEFT JOIN university_library.bookloans ON students.student_id = bookloans.student_id
WHERE bookloans.book_id IS NULL;

--Список студентов, взявших книги, и не вернувших их
SELECT students.name, COUNT(university_library.bookloans.book_id) AS total_books
FROM university_library.bookloans
JOIN university_library.students ON bookloans.student_id = students.student_id
WHERE bookloans.returned = FALSE
GROUP BY students.name
ORDER BY total_books DESC;

--Среднее количество дней, которое книги проводят у студентов до возврата
SELECT AVG(university_library.bookloans.return_date - university_library.bookloans.loan_date) AS average_loan_duration
FROM university_library.bookloans
WHERE bookloans.returned = TRUE;

--Cписок книг, у которых название начинается с буквы "A", и количество студентов, которые взяли каждую такую книгу
SELECT b.title AS book_title,
       (SELECT COUNT(bl.book_id)
        FROM university_library.bookloans bl
        WHERE bl.book_id = b.book_id) AS num_students
FROM university_library.books b
WHERE b.title LIKE 'A%'
ORDER BY book_title;

--Cписок студентов и их общее количество взятых книг, и еще ранг каждого студента по этому общему количеству книг
SELECT
    s.student_id,
    s.name,
    s.major,
    COUNT(bl.book_id) AS total_books,
    RANK() OVER (ORDER BY COUNT(bl.book_id) DESC) AS books_rank
FROM
    university_library.bookloans bl
JOIN
    university_library.students s ON bl.student_id = s.student_id
GROUP BY
    s.student_id, s.name, s.major
ORDER BY
    total_books DESC;
