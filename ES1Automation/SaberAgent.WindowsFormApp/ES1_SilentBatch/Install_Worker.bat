::===========================================================================================
::
:: Copyright 2013 EMC Corporation.  All rights reserved.  This software 
:: (including documentation) is subject to the terms and conditions set forth 
:: in the end user license agreement or other applicable agreement, and you 
:: may use this software only if you accept all the terms and conditions of 
:: the license agreement.  This software comprises proprietary and confidential 
:: information of EMC.  Unauthorized use, disclosure, and distribution are 
:: strictly prohibited.  Use, duplication, or disclosure of the software and 
:: documentation by the U.S. Government are subject to restrictions set forth 
:: in subparagraph (c)(1)(ii) of the Rights in Technical Data and Computer 
:: Software clause at DFARS 252.227-7013 or subparagraphs (c)(1) and (2) of the 
:: Commercial Computer Software - Restricted Rights at 48 CFR 52.227-19, as 
:: applicable. Manufacturer is EMC Corporation, 176 South St., Hopkinton, MA  01748.
:: 
:: FILE
:: 	Install_Worker.bat
::
:: CREATED
::   	06.24.2007
::
:: AUTHOR
::    	DLens
::
:: DESCRIPTION
::   	Silently installs the Worker Server.
::
:: LAST UPDATED 
::   	12.10.2012 Simon Shi
::
:: VERSION	
::	 7.0.0.1
::
:: USAGE
:: 	SILENT MODE : Command Prompt> Install_Worker.bat
::	
::	Arguments can be specified via command line arguments or entered directly
::	within the batch script below.
::
:: ===========================================================================================

@ECHO OFF

::Define variables
SET BATCHLOG="%~1%"
SET INSTALLLOG="%~2%"
SET INSTALLDIR="%~3%"
SET EX_WORKDIR=%~4%
SET EX_JOBLOGDIR="%~5%"
SET EX_DOMAIN="%~6%"
SET EX_USER="%~7%"
SET EX_PASS="%~8%"
SET EX_GRP_SEC=%~9%
SET EX_JDFNAME=""
SHIFT /1 
SET EX_JDFSRV="%~9%"
SET EX_SRCHNAME=""
SET EX_SRCHSRV="%~9%"
SET NOTESPW=""

CALL %~dp0\DefaultValues.bat

::Set default values
IF %BATCHLOG%=="" 	SET BATCHLOG=%WORKER_BATCHLOG%
IF %INSTALLLOG%=="" 	SET INSTALLLOG=%WORKER_INSTALLLOG%
IF %EX_WORKDIR%==""	SET EX_WORKDIR=%DEFAULT_EX_WORKDIR%
IF %EX_JOBLOGDIR%==""	SET EX_JOBLOGDIR=%DEFAULT_EX_JOBLOGDIR%
IF %INSTALLDIR%==""	SET INSTALLDIR=%DEFAULT_INSTALLDIR%
IF %EX_DOMAIN%==""	SET EX_DOMAIN=%DEFAULT_EX_DOMAIN%
IF %EX_USER%==""	SET EX_USER=%DEFAULT_EX_USER%
IF %EX_PASS%=="" 	SET EX_PASS=%DEFAULT_EX_PASS%
IF %EX_GRP_SEC%==""		SET EX_GRP_SEC=%DEFAULT_EX_GRP_SEC%
IF %EX_JDFNAME%==""	SET EX_JDFNAME=%DEFAULT_EX_JDFNAME%
IF %EX_JDFSRV%==""	SET EX_JDFSRV=%DEFAULT_EX_JDFSRV%
IF %EX_SRCHNAME%==""	SET EX_SRCHNAME=%DEFAULT_EX_SRCHNAME%
IF %EX_SRCHSRV%==""	SET EX_SRCHSRV=%DEFAULT_EX_SRCHSRV%
IF %NOTESPW%==""	SET NOTESPW=%DEFAULT_NOTESPW%

::Clear Log files
IF EXIST %BATCHLOG% DEL %BATCHLOG%
IF EXIST %INSTALLLOG% DEL %INSTALLLOG%

::Create batch log
ECHO SourceOne Worker Server Install Log >>%BATCHLOG%
ECHO. >>%BATCHLOG%
ECHO INSTALLLOG= %INSTALLLOG% >>%BATCHLOG%
ECHO INSTALLDIR= %INSTALLDIR% >>%BATCHLOG%
ECHO EX_WORKDIR= %EX_WORKDIR% >>%BATCHLOG%
ECHO EX_JOBLOGDIR= %EX_JOBLOGDIR% >>%BATCHLOG%
ECHO EX_DOMAIN= %EX_DOMAIN% >>%BATCHLOG%
ECHO EX_USER= %EX_USER% >>%BATCHLOG%
ECHO EX_PASS= %EX_PASS% >>%BATCHLOG%
ECHO EX_GRP_SEC= %EX_GRP_SEC% >>%BATCHLOG%
ECHO EX_JDFNAME= %EX_JDFNAME% >>%BATCHLOG%
ECHO EX_JDFSRV= %EX_JDFSRV% >>%BATCHLOG%
ECHO EX_SRCHNAME= %EX_SRCHNAME% >>%BATCHLOG%
ECHO EX_SRCHSRV= %EX_SRCHSRV% >>%BATCHLOG%
ECHO NOTESPW= %NOTESPW% >>%BATCHLOG%
ECHO. >>%BATCHLOG%

::Install Worker Server
@ECHO Installing Worker Server.  Please wait...
ECHO Worker Server Installation >>%BATCHLOG%
ECHO   Started at %DATE% %TIME% >>%BATCHLOG%

ES1_WorkerSetup.exe /s /v"/qn /L*v %INSTALLLOG% INSTALLDIR=%INSTALLDIR% EX_WORK_DIR=%EX_WORKDIR% EX_JOBLOG_DIR=%EX_JOBLOGDIR% EX_TF_DOMAIN=%EX_DOMAIN% EX_TF_USERNAME=%EX_USER% EX_TF_PASSWORD=%EX_PASS% EX_TF_GROUP=%EX_GRP_SEC% EX_DB_NAME=%EX_JDFNAME% EX_DB_MACHINENAME=%EX_JDFSRV% EX_SRCH_DB_NAME=%EX_SRCHNAME% EX_SRCH_DB_MACHINENAME=%EX_SRCHSRV% EX_NOTES_PASS=%NOTESPW% REBOOT=ReallySuppress " >>%BATCHLOG%

::Log completion
ECHO   Finished at %DATE% %TIME% >>%BATCHLOG%
ECHO. >>%BATCHLOG%
