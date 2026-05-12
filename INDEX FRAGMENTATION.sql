CREATE PROCEDURE IndexFragmentation
 AS
  BEGIN
    SELECT 
	  dbschemmas.[name] AS SchemaName,
	  dbtables.[name] AS TableName,
	  dbindexes.[name] AS IndexName,
	  indexstats.avg_fragmentation_in_percent
	  FROM sys.dm_db_index_physical_stats
	  (
	  DB_ID(),
	  NULL,
	  NULL,
	  NULL,
	  'LIMITED'
	  ) indexstats
	  JOIN sys.tables dbtables
	  ON dbtables.[object_id] = indexstats.[object_id]
	  JOIN sys.schemas dbschemmas
	  ON dbtables.[schema_id] = dbschemmas.[schema_id]
	  JOIN sys.indexes dbindexes
	  ON dbindexes.[object_id] = indexstats.[object_id]
	  AND indexstats.index_id = dbindexes.index_id
	  WHERE indexstats.avg_fragmentation_in_percent > 10
	  ORDER BY indexstats.avg_fragmentation_in_percent DESC


	END


	
