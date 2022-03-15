
create   proc stg.sp_getzip
 @zip nvarchar(5)
as
declare @download nvarchar(max)=N'exec xp_cmdshell ''curl https://api-dev-testdata.azurewebsites.net/redfin?key='+@zip+' -o c:\data\'+@zip+'.json'''
exec sp_executesql @download

declare @insert nvarchar(max)=N'
	Insert stg.LoadData (ZipCode,LoadDate, JsonData)
	SELECT '''+@zip+''', GetDate(), BulkColumn FROM OPENROWSET(BULK N''C:\data\'+@zip+'.json'', SINGLE_CLOB) AS json'
exec sp_executesql @insert