# BD-UFCG
Scripts and mini tests of the discipline of Database I.

## VM and DBMS access
VM access works on both cmd and terminal:
`` `shell
ssh -o ServerAliveInterval = 30 user@150.165.85.37 -p 45600
`` `

Explicit database access:
`` `shell
psql -d user_db
`` `

## File copy via SSH:
`` `shell
scp -P 45600 yourPathFilePath@150.165.85.37: / home / yourUser
`` `

# CREATE TABLE
`` `
CREATE TABLE name_table (
  attribute_name1 attribute_type1
  attribute_name2 attribute_type2
  attribute_name3 attribute_type3
);
`` `
Types:
* INTEGER
* SERIAL -> auto increment integer
* CHAR (LENGTH) -> fixed size character chair
* VARCHAR (LENGTH) -> variable size character chair
* TEXT -> unlimited length character chair
* BOOLEAN -> true / false
* NUMERIC -> general representation for floating point numbers
* DATE -> 'YYYY-MM-DD'
* TIMESTAMP -> date / time 'YYYY-MM-DD 14:05:06'


# DROP TABLE
`` `DROP TABLE name_table;` ``
  
# ALTER TABLE

** Rename: **
* `` `ALTER TABLE current_name_table RENAME TO new_name_table```
* `` `ALTER TABLE name_table RENAME COLUMN current_attribute_name1 TO new_attribute_name1````

** Add a new attribute: **
* `` `ALTER TABLE name_table ADD COLUMN name_attribute attribute_type1```

** Change attributes to null or not null: **
* `` `ALTER TABLE name_table ALTER COLUMN name_attribute SET NOT NULL```
* `` `ALTER TABLE name_table ALTER COLUMN name_attribute DROP NOT NULL```

** Adding Primary and Secondary Keys: **
* `` `ALTER TABLE name_table ADD CONSTRAINT name_constraint FOREIGN KEY (attribute) REFERENCES other_table (attribute)` ``
* `` `ALTER TABLE name_table ADD PRIMARY KEY (attribute)` ``

## SQL / DLL + DML
DML, acronym for Data Manipulation Language. This contains the set of instructions for adding, modifying, querying, or removing data from a database.

INSERT:
`` `INSERT INTO name_table VALUES (value_attribute1, value_attribute2, value_attribute3);

--defining which columns will be filled:
INSERT INTO name_table (name_attribute, name_attribute2) VALUES (name_attribute1, name_attribute2);

- insertion of several tones:
INSERT INTO name_table (name_attribute1, name_attribute2)
VALUES
  (value_attribute1, value_attribute2),
  (value_attribute1, value_attribute2),
  (value_attribute1, value_attribute2);
`` `

## Data Query
 
* `` `sql SELECT attributeName1, attributeName2 FROM table_name WHERE selection_condition;` ``
* `` `SELECT name, address FROM employee WHERE salary> 1500;` ``

## Data Removal

`` `
- remove all tuples:
DELETE FROM table_name;

- removal of tuples that make up the condition:
DELETE FROM tasks WHERE status = "DONE";
`` `

## Data update

* `` `UPDATE table_name SET attribute_name = attribute_value WHERE condition;` ``

* `` `UPDATE employee SET phone = '8888-9999' WHERE cpf = '123456789011';` ``

* `` `UPDATE employee SET salary = salary + 200, bonus = bonus + 100 WHERE town_lotacao = 'Campina Grande' AND ultima_evaluation = 'GREAT';` ``


## CHECK Constraints Constraints

`` `sql
CREATE TABLE Product (
  integer_product_id,
  numeric price,
  CHECK (price> 0)
);

CREATE TABLE Product (
  integer_product_id,
  numeric price,
  CONSTRAINT price_validochk CHECK (price> 0)
);
`` `
* `` `ALTER TABLE product ADD CONSTRAINT valid_chk_product CHECK (price> 0);` ``

## UNIQUE
UNIQUE guarantees that there will be no equal values ​​in the same column.

Examples:
`` `sql
CREATE TABLE person (
  cpf integer,
  name varchar (50) UNIQUE,
  date_nasc date
);

CREATE TABLE person (
  cpf integer,
  name varchar (50),
  date_nasc date,
  UNIQUE (name)
);

CREATE TABLE person (
  to integrate,
  b integer,
  c integer,
  UNIQUE (a, c)
);
`` `

## EXCLUDE

EXCLUDE creates generalized exceptions, accessing all tuples in the table.

Example:
`` `sql
- Example, do not allow two rentals for the same vehicle (same vehicle id in a rental table) if the rental periods intersect each other.

- checks the vehicle_id with the "=" operator and the lease period (of the time interval type) with the "&&" intersection operator.

ALTER TABLE location
ADD CONSTRAINT locacao_excl
EXCLUDE USING gist (
  vehicle_ID WITH =,
  WITH && period
);
`` `
