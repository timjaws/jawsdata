CREATE TABLE [stg].[LocationParents] (
	[ID]               INT IDENTITY (1, 1) NOT NULL,
	[LocationId]       INT NULL,
	[LocationParentId] INT NULL,
	PRIMARY KEY CLUSTERED ([ID] ASC),
	Constraint FK_LocationParents_Locations_LocationId_ID   FOREIGN KEY ([LocationId]) REFERENCES [stg].[Locations] ([ID]),
	Constraint FK_LocationParents_Locations_LocationParentId_ID    FOREIGN KEY ([LocationParentId]) REFERENCES [stg].[Locations] ([ID])
);

