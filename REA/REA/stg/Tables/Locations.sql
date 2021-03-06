CREATE TABLE [stg].[Locations] (
    [ID]    INT            IDENTITY (1, 1) NOT NULL,
    [RowId] INT            NOT NULL,
    [ColId] INT            NOT NULL,
    [LatA]  DECIMAL (9, 6) NOT NULL,
    [LonA]  DECIMAL (9, 6) NOT NULL,
    [LatB]  DECIMAL (9, 6) NOT NULL,
    [LonB]  DECIMAL (9, 6) NOT NULL,
    [Lev]   INT            NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);




GO
CREATE NONCLUSTERED INDEX [IX_Locations_LatLon]
    ON [stg].[Locations]([LatA] ASC, [LonA] ASC, [LatB] ASC, [LonB] ASC)
    INCLUDE([Lev]);

