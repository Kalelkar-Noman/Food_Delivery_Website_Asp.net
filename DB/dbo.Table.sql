CREATE TABLE [dbo].[Table]
(
	[item_id] INT NOT NULL PRIMARY KEY IDENTITY , 
    [item_image] IMAGE NOT NULL, 
    [item_price] NCHAR(10) NOT NULL, 
    [item_name] NCHAR(10) NOT NULL
)
