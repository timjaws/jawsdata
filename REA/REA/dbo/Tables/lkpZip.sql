CREATE TABLE [dbo].[lkpZip] (
    [zip]    INT            NOT NULL,
    [city]   NVARCHAR (255) NOT NULL,
    [county] NVARCHAR (255) NOT NULL,
    [pop]    INT            NOT NULL,
    CONSTRAINT [PK_lkpZip] PRIMARY KEY CLUSTERED ([zip] ASC)
);

