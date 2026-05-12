RESTORE DATABASE AdventureWorks2022
FROM DISK = 'C:\SQLBackups\AdventureWorks2022_Full.bak'
WITH NORECOVERY



RESTORE DATABASE AdventureWorks2022
FROM DISK = 'C:\SQLBackups\AdventureWorks2022_DIFF.bak'
WITH NORECOVERY

RESTORE LOG AdventureWorks2022
FROM DISK = 'C:\SQLBackups\AdventureWorks2022_LOG.trn'
WITH RECOVERY

