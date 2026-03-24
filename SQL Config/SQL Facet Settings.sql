EXEC sp_configure 'clr enabled', 1;  
RECONFIGURE;  
GO  

sp_configure 'show advanced options', 1;  
RECONFIGURE;
GO 
sp_configure 'Ad Hoc Distributed Queries', 1;  
RECONFIGURE;  
GO  

sp_configure 'show advanced options', 1;  
GO  
RECONFIGURE;  
GO  
sp_configure 'Ole Automation Procedures', 1;  
GO  
RECONFIGURE;  
GO 

sp_configure 'remote admin connections', 1;  
GO  
RECONFIGURE;  
GO  

EXEC sp_configure 'xp_cmdshell', 1
RECONFIGURE WITH OVERRIDE
GO