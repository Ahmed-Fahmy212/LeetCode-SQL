SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;

-- **Eliminates Duplicates:** DISTINCT ensures that each value in the specified columns appears only once in the result set.

-- **Applies to Entire Row**: DISTINCT considers the entire row when evaluating uniqueness. If you select multiple columns, it ensures that the combination of values in those columns is unique.

-- **Performance Considerations**: Using DISTINCT can impact performance, especially on large datasets, as the database must perform additional work to identify and remove duplicates.
-- //==============================================================================
-- using sort is good approuch as  will handle faster the res for db
-- //==============================================================================
-- When you use DISTINCT with sorting (ORDER BY), the database engine must first retrieve all qualifying rows, then sort them based on the specified columns.
-- Sorting can be computationally expensive, especially if the result set is large or if the columns involved in sorting are not indexed.