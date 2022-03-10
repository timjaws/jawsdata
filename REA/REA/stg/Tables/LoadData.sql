CREATE TABLE [stg].[LoadData] (
    [ID]       INT            IDENTITY (1, 1) NOT NULL,
    [ZipCode]  NVARCHAR (255) NOT NULL,
    [LoadDate] DATETIME       NOT NULL,
    [JsonData] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_loaddata_ID] PRIMARY KEY CLUSTERED ([ID] ASC)
);

