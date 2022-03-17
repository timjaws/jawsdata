CREATE TABLE [stg].[LocationParents] (
    [ID]               INT IDENTITY (1, 1) NOT NULL,
    [LocationId]       INT NULL,
    [LocationParentId] INT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_LocationParents_LocationId_Locations_ID] FOREIGN KEY ([LocationId]) REFERENCES [stg].[Locations] ([ID]),
    CONSTRAINT [FK_LocationParents_LocationParentId_Locations_ID] FOREIGN KEY ([LocationParentId]) REFERENCES [stg].[Locations] ([ID])
);



