USE Staging
Go

CREATE OR ALTER FUNCTION dbo.isPalindrome (@InputString VARCHAR(200))
RETURNS BIT
AS
BEGIN
		DECLARE @ReverseString VARCHAR (200), @Palindrome Bit
		SET @ReverseString = REVERSE(@InputString)

		if @ReverseString = @InputString
		Set @Palindrome = 1

		else Set @Palindrome = 0
		
		RETURN @Palindrome
END
GO

select dbo.isPalindrome('abccba')