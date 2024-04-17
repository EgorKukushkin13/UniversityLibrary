#Physical Model
---


Table `Books`:

| Column Name       | Description               | Data Type        | Constraint      |
|-------------------|---------------------------|------------------|-----------------|
| `book_id`         | Identifier                | `SERIAL`         | `PRIMARY KEY`   |
| `title`           | Title of the book         | `VARCHAR`   | `NOT NULL`      |
| `author`          | Author of the book        | `VARCHAR`   | `NOT NULL`      |
| `genre`           | Genre of the book         | `VARCHAR`   |                 |
| `publication_year`| Publication year          | `INTEGER`        |                 |

Table `Students`:

| Column Name  | Description               | Data Type        | Constraint      |
|--------------|---------------------------|------------------|-----------------|
| `student_id` | Identifier                | `SERIAL`         | `PRIMARY KEY`   |
| `name`       | Name of the student       | `VARCHAR`   | `NOT NULL`      |
| `email`      | Email of the student      | `VARCHAR`   |                 |
| `major`      | Major of the student      | `VARCHAR`   |                 |
| `year_of_study`| Year of study            | `INTEGER`        |                 |

Table `BookLoans`:

| Column Name | Description               | Data Type        | Constraint                          |
|-------------|---------------------------|------------------|-------------------------------------|
| `loan_id`   | Identifier                | `SERIAL`         | `PRIMARY KEY`                       |
| `book_id`   | Identifier of the book    | `INTEGER`        | `REFERENCES Books(book_id)`         |
| `student_id`| Identifier of the student | `INTEGER`        | `REFERENCES Students(student_id)`   |
| `librarian_id` | Identifier of the librarian | `INTEGER`      | `REFERENCES Librarians(librarian_id)` |
| `loan_date` | Date of loan              | `DATE`           |                                     |
| `return_date`| Date of return            | `DATE`           |                                     |
| `returned`  | Indicator of return       | `BOOLEAN`        |                                     |

Table `Librarians`:

| Column Name | Description               | Data Type        | Constraint      |
|-------------|---------------------------|------------------|-----------------|
| `librarian_id` | Identifier             | `SERIAL`         | `PRIMARY KEY`   |
| `name`      | Name of the librarian     | `VARCHAR`   |                 |
| `email`     | Email of the librarian    | `VARCHAR`   |                 |

Table `StudentChanges`:

| Column Name | Description               | Data Type        | Constraint      |
|-------------|---------------------------|------------------|-----------------|
| `change_id` | Identifier                | `SERIAL`         | `PRIMARY KEY`   |
| `student_id`| Identifier of the student | `INTEGER`        | `REFERENCES Students(student_id)` |
| `change_date`| Date of change           | `DATE`           |                 |
| `old_major` | Old major of the student | `VARCHAR`   |                 |
| `new_major` | New major of the student | `VARCHAR`   |                 |


---
