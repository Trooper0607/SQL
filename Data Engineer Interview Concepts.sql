--Data Engineering Interview Technical Assessment

-- Procedures That accept input
-- Functions that accept input
-- Error Handling to ensure data consistency

Drop table if exists BankAccount;

USE Staging
Go

Create Table BankAccount
(
	AccountID int PRIMARY KEY,
	Balance decimal (10,2)
)
GO

Insert into BankAccount 
Values (1,100.00), (2,200.00), (3,300.00)
Go

Create or Alter Procedure dbo.TransferMoney
(
	@SendAccount int,
	@ReceiveAccount int,
	@Amount decimal (10,2)

)
AS

BEGIN TRY
	BEGIN TRANSACTION
		 --Sending Account must Exist
		 BEGIN IF (Select AccountID From BankAccount Where AccountID = @SendAccount) IS NULL
			THROW 51000, 'Sending Account does not exist',1;
		 END
		 -- Receive account must exist
		 BEGIN IF (Select AccountID From BankAccount Where AccountID = @ReceiveAccount) IS NULL
			THROW 52000, 'Receiving Account does not exist',1;
		 END
		 -- Check sufficient funds
		 BEGIN IF (Select Balance From BankAccount Where AccountID = @SendAccount) - @Amount < 0
			THROW 53000, 'Insufficient Balance',1;
		 END
		
			UPDATE BankAccount
			SET Balance -= @Amount
			Where AccountID = @SendAccount

			UPDATE BankAccount
			SET Balance += @Amount
			Where AccountID = @ReceiveAccount

	 COMMIT TRANSACTION
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'ERROR MESSAGE :'+ ERROR_MESSAGE()

END CATCH

EXEC dbo.TransferMoney 1,3,150.00

Select * From BankAccount