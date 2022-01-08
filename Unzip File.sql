DECLARE @Result int;

EXEC @Result =  xp_cmdshell 'Powershell; Expand-Archive -LiteralPath C:\Users\Jeremy\Desktop\PersonAddresses.zip -DestinationPath C:\Users\Jeremy\Desktop';
IF (@Result = 0)
PRINT 'Success'

ELSE
PRINT 'Failure'