CREATE PROCEDURE DataBase_Size
 AS
  BEGIN
    SELECT
       DB_NAME(database_id) AS DatabaseName,
       name AS FileName,
       type_desc AS FileType,
       (size * 8 / 1024 ) AS SizeMB
       FROM sys.master_files
       WHERE database_id = DB_ID('AdventureWorks2022')
       END

       EXEC DataBase_Size