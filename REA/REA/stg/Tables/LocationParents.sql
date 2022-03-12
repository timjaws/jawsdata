CREATE TABLE [stg].[LocationParents] (
    [ID]               INT IDENTITY (1, 1) NOT NULL,
    [LocationId]       INT NULL,
    [LocationParentId] INT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([LocationId]) REFERENCES [stg].[Locations] ([ID]),
    FOREIGN KEY ([LocationParentId]) REFERENCES [stg].[Locations] ([ID])
);

