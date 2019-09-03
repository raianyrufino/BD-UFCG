# BD-UFCG
Scripts and mini tests of the discipline of Database I.

## VM and DBMS access
VM access works on both cmd and terminal:
```shell
ssh -o ServerAliveInterval=30 user@150.165.85.37 -p 45600
```

Explicit database access:
```shell
psql -d user_db
```

## File copy via SSH:
```shell
scp -P 45600 caminhoDoArquivo seuUsuario@150.165.85.37:/home/seuUsuario
```

# CREATE TABLE
```
CREATE TABLE name_table(
  attribute_name1 attribute_type1
  attribute_name2 attribute_type2
  attribute_name3 attribute_type3
);
```
Types:
* INTEGER
* SERIAL -> auto increment integer
* CHAR(LENGTH) -> fixed size character chair
* VARCHAR(LENGTH) -> variable size character chair
* TEXT -> unlimited length character chair
* BOOLEAN -> true / false
* NUMERIC -> general representation for floating point numbers
* DATE -> 'YYYY-MM-DD'
* TIMESTAMP -> date/time 'YYYY-MM-DD 14:05:06'


# DROP TABLE 
```DROP TABLE name_table;```
  
# ALTER TABLE

**Rename:**
* ```ALTER TABLE current_name_table RENAME TO new_name_table```
* ```ALTER TABLE name_table RENAME COLUMN current_attribute_name1 TO new_attribute_name1```

**Add a new attribute:**
* ```ALTER TABLE name_table ADD COLUMN name_attribute attribute_type1```

**Change attributes to null or not null:**
* ```ALTER TABLE name_table ALTER COLUMN name_attribute SET NOT NULL```
* ```ALTER TABLE name_table ALTER COLUMN name_attribute DROP NOT NULL```

**Adding Primary and Secondary Keys:**
* ```ALTER TABLE name_table ADD CONSTRAINT name_constraint FOREIGN KEY(attribute) REFERENCES other_table(attribute)```
* ```ALTER TABLE name_table ADD PRIMARY KEY(attribute)```

