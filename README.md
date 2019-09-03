# BD-UFCG
Scripts and mini tests of the discipline of Database I.

## VM and DBMS access
VM access works on both cmd and terminal:
```shell
ssh -o ServerAliveInterval = 30 user@150.165.85.37 -p 45600
```

Explicit database access:
```shell
psql -d user_db
```

## File copy via SSH:
```shell
scp -P 45600 yourPathFilePath@150.165.85.37: / home / yourUser
```

# CREATE TABLE
```
CREATE TABLE table_name (
  attribute_name1 attribute_type1
  attribute_name2 attribute_type2
  attribute_name3 attribute_type3
);
```
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
```DROP TABLE table_name;```
  
# ALTER TABLE

** Rename: **
```ALTER TABLE current_table_name RENAME TO new_table_name```
```ALTER TABLE table_name RENAME COLUMN current_attribute_name1 TO new_attribute_name1```

** Add a new attribute: **
```ALTER TABLE name_table ADD COLUMN attribute_name attribute_type1```

** Change attributes to null or not null: **
```ALTER TABLE table_name ALTER COLUMN attribute_name SET NOT NULL```
```ALTER TABLE table_name ALTER COLUMN attribute_name DROP NOT NULL```

** Adding Primary and Secondary Keys: **
```ALTER TABLE table_name ADD CONSTRAINT constraint_name FOREIGN KEY (attribute) REFERENCES other_table (attribute)```
```ALTER TABLE table_name ADD PRIMARY KEY (attribute)```

## SQL / DLL + DML
DML, acronym for Data Manipulation Language. This contains the set of instructions for adding, modifying, querying, or removing data from a database.

INSERT:
```INSERT INTO table_name VALUES (attribute_value1, attribute_value2, attribute_value3); ```

--defining which columns will be filled:
```INSERT INTO table_name (attribute_name1, attribute_name2) VALUES (attribute_name1, attribute_name2); ```

- insertion of several tones:

```INSERT INTO table_name (attribute_name1, attribute_name2); ```
``` 
   VALUES
  (attribute_value1, attribute_value2),
  (attribute_value1, attribute_value2),
  (attribute_value1, attribute_value2); 
  ```

## Data Query
 
```sql SELECT attributeName1, attributeName2 FROM table_name WHERE selection_condition;```
```SELECT name, address FROM employee WHERE salary> 1500;```

## Data Removal

- remove all tuples:
```DELETE FROM table_name;```

- removal of tuples that make up the condition:
```DELETE FROM tasks WHERE status = "DONE";```

## Data update

```UPDATE table_name SET attribute_name = attribute_value WHERE condition;```

```UPDATE employee SET phone = '8888-9999' WHERE cpf = '123456789011';```

```UPDATE employee SET salary = salary + 200, bonus = bonus + 100 WHERE town_lotacao = 'Campina Grande' AND ultima_evaluation = 'GREAT';```


## CHECK Constraints Constraints

```
CREATE TABLE table_name (
  INTEGER product_id,
  NUMERIC price,
  CONSTRAINT price_validochk CHECK (price> 0)
); 
```

```ALTER TABLE product ADD CONSTRAINT valid_chk_product CHECK (price> 0);```

## UNIQUE
UNIQUE guarantees that there will be no equal values ​​in the same column.

```sql
CREATE TABLE table_name (
  cpf integer,
  name varchar (50) UNIQUE,
  date_nasc date
);
```

## EXCLUDE

EXCLUDE creates generalized exceptions, accessing all tuples in the table.

- Example, do not allow two rentals for the same vehicle (same vehicle id in a rental table) if the rental periods intersect each other.

- checks the vehicle_id with the "=" operator and the lease period (of the time interval type) with the "&&" intersection operator.

```
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
EXCLUDE USING gist (
  vehicle_ID WITH =,
  WITH && period
);
```
