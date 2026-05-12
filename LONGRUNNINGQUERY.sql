CREATE PROCEDURE LongRunningQueries
 AS
  BEGIN
    SELECT
        session_id,
        status,
        start_time,
        command,
        total_elapsed_time / 1000 AS elapsed_seconds
        FROM sys.dm_exec_requests 
       WHERE total_elapsed_time > 5000
       END

       EXEC LongRunningQueries