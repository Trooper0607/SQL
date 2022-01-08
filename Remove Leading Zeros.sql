USE [Staging_DB]
GO

/****** Object:  UserDefinedFunction [dbo].[Leading_Zeros]    Script Date: 1/8/2022 10:06:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER Function [dbo].[Leading_Zeros] (@Input_String as VARCHAR(255))

Returns VARCHAR (255)

As Begin

Declare @Output_String VARCHAR(255)
	Set @Output_String = SUBSTRING(@Input_String, PATINDEX('%[^0]%',@Input_String ), LEN(@Input_String))

Return @Output_String

End
GO


