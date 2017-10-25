
library(SciServer)
library(httr)
library(jsonlite)
library(utils)

# Define login Name and password before running these examples
Authentication_loginName = '***';
Authentication_loginPassword = '***'

#?Authentication.login

# *******************************************************************************************************
# Authentication section
# *******************************************************************************************************

#logging in and getting current token from different ways

token1 = Authentication.login(Authentication_loginName, Authentication_loginPassword);
token2 = Authentication.getToken()
token4 = Authentication.token
print(paste("token1=", token1))
print(paste("token2=", token2))
print(paste("token4=", token4))

#getting curent user info

user = Authentication.getKeystoneUserWithToken(token1)
print(paste("userName=", user$userName))
print(paste("id=", user$id))

#reseting the current token to another value:

Authentication.setToken("myToken1")
token5 = Authentication.getToken()
print(paste("token5=", token5))

#logging-in again

token1 = Authentication.login(Authentication_loginName, Authentication_loginPassword);
print(token1)

# *******************************************************************************************************
# LoginPortal section:
# *******************************************************************************************************

#?LoginPortal.login

#logging in and getting current token from different ways

token1 = LoginPortal.login(Authentication_loginName, Authentication_loginPassword);
token2 = LoginPortal.getToken()
print(paste("token1=", token1))
print(paste("token2=", token2))

#getting curent user info

user = LoginPortal.getKeystoneUserWithToken(token1)
print(paste("userName=", user$user))
print(paste("id=", user$id))
user

#reseting the current token to another value:

LoginPortal.setToken("myToken2")
token6 = LoginPortal.getToken()
print(paste("token6=", token6))

#logging-in again

token1 = LoginPortal.login(Authentication_loginName, Authentication_loginPassword);
print(token1)

# *******************************************************************************************************
# CasJobs section:
# *******************************************************************************************************

#?CasJobs.executeQuery

#Defining databse context and query, and other variables

CasJobs_TestDatabase = "MyDB"
CasJobs_TestQuery = "select 4 as Column1, 5 as Column2 "
CasJobs_TestTableName1 = "MyNewtable1"
CasJobs_TestTableName2 = "MyNewtable2"
CasJobs_TestTableCSV = "Column1,Column2\n4,5\n"
CasJobs_TestFitsFile = "SciScriptTestFile.fits"
CasJobs_TestCSVFile = "SciScriptTestFile.csv"

#get user schema info

casJobsId = CasJobs.getSchemaName()
print(casJobsId)

#get info about tables inside MyDB database context:

tables = CasJobs.getTables(context="MyDB")
print(tables)

#execute a quick SQL query:

df = CasJobs.executeQuery(sql=CasJobs_TestQuery, context=CasJobs_TestDatabase, format="dataframe")
print(df)

#submit a job, which inserts the query results into a table in the MyDB database context. 
#Wait until the job is done and get its status.

jobId = CasJobs.submitJob(sql=paste(CasJobs_TestQuery, " into MyDB.", CasJobs_TestTableName1, sep=""), context="MyDB")
jobDescription = CasJobs.waitForJob(jobId=jobId, verbose=FALSE)
print(jobId)
print(jobDescription)

# drop or delete table in MyDB database context

df = CasJobs.executeQuery(sql=paste("DROP TABLE ", CasJobs_TestTableName1, sep=""), context="MyDB", format="dataframe")
print(df)

#get job status

jobId = CasJobs.submitJob(sql=CasJobs_TestQuery, context=CasJobs_TestDatabase)
jobDescription = CasJobs.getJobStatus(jobId)
print(jobId)
print(jobDescription)

#cancel a job

jobId = CasJobs.submitJob(sql=CasJobs_TestQuery, context=CasJobs_TestDatabase)
jobDescription = CasJobs.cancelJob(jobId=jobId)
print(jobId)
print(jobDescription)

#execute a query and write a local Fits file containing the query results:

result = CasJobs.writeFitsFileFromQuery(fileName=CasJobs_TestFitsFile, queryString=CasJobs_TestQuery, context="MyDB")
print(result)

#delete local FITS file just created:

file.remove(CasJobs_TestFitsFile)

#uploads a dataframe into a Database table

df = CasJobs.executeQuery(sql=CasJobs_TestQuery, context=CasJobs_TestDatabase, format="dataframe")
response = CasJobs.uploadDataFrameToTable(df, tableName=CasJobs_TestTableName2, context="MyDB")
table = CasJobs.executeQuery(sql=paste("select * from ", CasJobs_TestTableName2, sep=""), context="MyDB", format="dataframe")
print(response)
print(table)

# drop or delete table just created:

result2 = CasJobs.executeQuery(sql=paste("DROP TABLE ", CasJobs_TestTableName2, sep=""), context="MyDB", format="dataframe")
print(result2)

#upload csv data string into a database table:

result3 = CasJobs.uploadCSVDataToTable(csv=CasJobs_TestTableCSV, tableName=CasJobs_TestTableName2, context="MyDB")
df2 = CasJobs.executeQuery(sql=paste("select * from ", CasJobs_TestTableName2, sep=""), context="MyDB", format="dataframe")
print(result3)
print(df2)

# drop or delete table just created:

result4 = CasJobs.executeQuery(sql=paste("DROP TABLE ", CasJobs_TestTableName2, sep=""), context="MyDB", format="dataframe")
print(result4)

# *******************************************************************************************************
#  SkyServer section:
# *******************************************************************************************************

#SkyServer.sqlSearch

#defining sql query and SDSS data relelease:

SkyServer_TestQuery = "select top 1 specobjid, ra, dec from specobj order by specobjid"
SkyServer_DataRelease = "DR13"

#Exectute sql query

df = SkyServer.sqlSearch(sql=SkyServer_TestQuery, dataRelease=SkyServer_DataRelease)
print(df)

#get an image cutout

img = SkyServer.getJpegImgCutout(ra=197.614455642896, dec=18.438168853724, width=512, height=512, scale=0.4, 
                                 dataRelease=SkyServer_DataRelease,opt="OG",
                                 query="SELECT TOP 100 p.objID, p.ra, p.dec, p.r FROM fGetObjFromRectEq(197.6,18.4,197.7,18.5) n, PhotoPrimary p WHERE n.objID=p.objID")
plot(0:1, 0:1, type = "n")
rasterImage(img, 0, 0, 1, 1)

# do a radial search of objects:

df = SkyServer.radialSearch(ra=258.25, dec=64.05, radius=0.1, dataRelease=SkyServer_DataRelease)
print(df)

#do rectangular search of objects:

df = SkyServer.rectangularSearch(min_ra=258.3, max_ra=258.31, min_dec=64,max_dec=64.01, dataRelease=SkyServer_DataRelease)
print(df)

#do an object search based on RA,Dec coordinates:

object = SkyServer.objectSearch(ra=258.25, dec=64.05, dataRelease=SkyServer_DataRelease)
print(object)

# *******************************************************************************************************
# SciDrive section:
# *******************************************************************************************************

#?SciDrive.publicUrl

#define name of directory to be created in SciDrive:
SciDrive_Directory = "SciScriptR"
#define name, path and content of a file to be first created and then uploaded into SciDrive:
SciDrive_FileName = "TestFile.csv"
SciDrive_FilePath = "./TestFile.csv"
SciDrive_FileContent = "Column1,Column2\n4.5,5.5\n"

#create a folder or container in SciDrive

responseCreate = SciDrive.createContainer(SciDrive_Directory)
print(responseCreate)

#list content and metadata of directory in SciDrive

dirList = SciDrive.directoryList(SciDrive_Directory)
print(dirList)

#get the public url to access the directory content in SciDrive

url = SciDrive.publicUrl(SciDrive_Directory)
print(url)

#Delete folder or container in SciDrive:

responseDelete = SciDrive.delete(SciDrive_Directory)
print(responseDelete)

#create a local file:

file = file(SciDrive_FileName)
writeLines(SciDrive_FileContent, file)
close(file)

#uploading a file to SciDrive:

responseUpload = SciDrive.upload(path=paste(SciDrive_Directory, "/", SciDrive_FileName, sep=""), localFilePath=SciDrive_FilePath)
print(responseUpload)

#download file:

fileContent = SciDrive.download(paste(SciDrive_Directory, "/", SciDrive_FileName, sep=""), format="text")
print(fileContent)

#upload string data:

responseUpload = SciDrive.upload(path=paste(SciDrive_Directory, "/", SciDrive_FileName, sep=""), data=SciDrive_FileContent)
fileContent =  SciDrive.download(path=paste(SciDrive_Directory, "/", SciDrive_FileName, sep=""), format="text")
print(fileContent)

#delete folder in SciDrive:

responseDelete = SciDrive.delete(SciDrive_Directory)
print(responseDelete)

#delete local file:

file.remove(SciDrive_FilePath)

# *******************************************************************************************************
# SkyQuery section:
# *******************************************************************************************************

#?SkyQuery.submitJob

#list all databses or datasets available

datasets = SkyQuery.listAllDatasets()
print(datasets)

#get info about the user's personal database or dataset

info = SkyQuery.getDatasetInfo("MyDB")
print(info)

#list tables inside dataset

tables = SkyQuery.listDatasetTables("MyDB")
print(tables)

#list available job queues

queueList = SkyQuery.listQueues()
print(queueList)

#list available job queues and related info

quick = SkyQuery.getQueueInfo('quick')
long= SkyQuery.getQueueInfo('long')
print(quick)
print(long)

#Define query

SkyQuery_Query = "select 4.5 as Column1, 5.5 as Column2"

#submit a query as a job

jobId = SkyQuery.submitJob(query=SkyQuery_Query, queue="quick")
print(jobId)

#get status of a submitted job

jobId = SkyQuery.submitJob(query=SkyQuery_Query, queue="quick")
jobDescription = SkyQuery.getJobStatus(jobId=jobId)
print(jobDescription)

# wait for a job to be finished and then get the status

jobId = SkyQuery.submitJob(query=SkyQuery_Query, queue="quick")
jobDescription = SkyQuery.waitForJob(jobId=jobId, verbose=TRUE)
print("jobDescription=")
print(jobDescription)

# cancel a job that is running, and then get its status

jobId = SkyQuery.submitJob(query=SkyQuery_Query, queue="long")
isCanceled = SkyQuery.cancelJob(jobId)
print(isCanceled)
print("job status:")
print(SkyQuery.getJobStatus(jobId=jobId))

# get list of jobs

quickJobsList = SkyQuery.listJobs('quick')
longJobsList = SkyQuery.listJobs('long')
print(quickJobsList)
print(longJobsList)

#define csv table to be uploaded to into MyDB in SkyQuery

SkyQuery_TestTableName = "TestTable_SciScript_R"
SkyQuery_TestTableCSV = "Column1,Column2\n4.5,5.5\n"

#uploading the csv table:

result = SkyQuery.uploadTable(uploadData=SkyQuery_TestTableCSV, tableName=SkyQuery_TestTableName, datasetName="MyDB", format="csv")
print(result)

#downloading table:

table = SkyQuery.getTable(tableName=SkyQuery_TestTableName, datasetName="MyDB", top=10)
print(table)

#list tables inside dataset

tables = SkyQuery.listDatasetTables("MyDB")
print(tables)

#get dataset table info:

info = SkyQuery.getTableInfo(tableName=paste("webuser.",SkyQuery_TestTableName, sep=""), datasetName="MyDB")
print(info)

#get dataset table columns info

columns = SkyQuery.listTableColumns(tableName=paste("webuser.", SkyQuery_TestTableName, sep=""), datasetName="MyDB")
print(columns)

#drop (or delete) table from dataset.

result = SkyQuery.dropTable(tableName=SkyQuery_TestTableName, datasetName="MyDB");
print(result)
