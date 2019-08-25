# BD-UFCG
Scripts and mini tests of the discipline of Database I.


# CREATE TABLE

```
CREATE TABLE name_table(
  attribute_name1 attribute_type1
  attribute_name2 attribute_type2
  attribute_name3 attribute_type3
);
```

# DROP TABLE 
```DROP TABLE name_table;```
  
# ALTER TABLE

**Rename:**
```ALTER TABLE current_name_table RENAME TO new_name_table```
```ALTER TABLE name_table RENAME COLUMN current_attribute_name1 TO new_attribute_name1```

**Add a new attribute:**
```ALTER TABLE name_table ADD COLUMN name_attribute attribute_type1```

**Change attributes to null or not null:**
```ALTER TABLE name_table ALTER COLUMN name_attribute SET NOT NULL```
```ALTER TABLE name_table ALTER COLUMN name_attribute DROP NOT NULL```

**Adding Primary and Secondary Keys:**
```ALTER TABLE name_table ADD CONSTRAINT name_constraint FOREIGN KEY(attribute) REFERENCES other_table(attribute)```
```ALTER TABLE name_table ADD PRIMARY KEY(attribute)```
