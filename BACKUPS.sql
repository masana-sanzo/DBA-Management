BACKUP DATABASE AdventureWorks2022
TO DISK = 'C:\SQLBackups\AdventureWorks2022_Full.bak'
WITH INIT, FORMAT

BACKUP DATABASE AdventureWorks2022
TO DISK = 'C:\SQLBackups\AdventureWorks2022_DIFF.bak'
WITH DIFFERENTIAL

BACKUP LOG AdventureWorks2022
TO DISK = 'C:\SQLBackups\AdventureWorks2022_LOG.trn'

