**University Library**

Проект симулирует выдачу книг студентам в университетской библиотеке.

Таблицы:
1) Books: book_id, title, author, genre, publication_year
2) Students: student_id, name, email, major, year_of_study
3) Librarians: librarian_id, name, email
4) BookLoans: loan_id, book_id, student_id, librarian_id, loan_date, return_date, returned
5) StudentChanges: change_id, student_id, change_date, old_major, new_major

Таблицы уже находятся в 3NF.

Для версионирования есть таблица StudentChanges. Она несет информацию о смене специализации у студентов.
