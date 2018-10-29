@echo off 
@echo off 
@echo.
call :removeMRMFavourites

::set the application-specific string vars
:: MRM CPC SYS Environment
set AppDescription=MRM_CPC_OPTUM_SYS
set AppCompleteURL=https://gcmtest.optum.com/home/CPC/emerald/default.htm
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%
 
set AppDescription=MRM_CPC_CORDYS_SYS
set AppCompleteURL=http://apsrt0695/home/CPC/emerald/default.htm?authID=CordysBuiltIn
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

set AppDescription=MRM_CPC_DIRECT_SYS
set AppCompleteURL=http://apsrt0695:81/home/CPC/emerald/default.htm
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: MRM CPC UAT Environment
set AppDescription=MRM_CPC_OPTUM_UAT
set AppCompleteURL=https://gcmuat.optum.com/home/CPC/emerald/default.htm
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%
 
set AppDescription=MRM_CPC_CORDYS_UAT
set AppCompleteURL=http://apsrt0859:8080/home/CPC/emerald/default.htm
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

set AppDescription=MRM_CPC_DIRECT_UAT
set AppCompleteURL=http://apsrt0859:8080/home/CPC/emerald/default.htm
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: MRM CPC STAGE Environment
set AppDescription=MRM_CPC_OPTUM_STG
set AppCompleteURL=https://medicalrecordmanagerstage.optum.com/home/CPC/emerald/default.htm
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%
 
set AppDescription=MRM_CPC_CORDYS_STG
set AppCompleteURL=http://apsrs1397.uhc.com:8080/home/CPC/emerald/default.htm?authID=CordysBuiltIn
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

set AppDescription=MRM_CPC_DIRECT_STG
set AppCompleteURL=https://mrmbackupstg.optum.com/home/CPC/emerald/default.htm
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

::########################################################################
:: MRM COMM SYS Environment
set AppDescription=MRM_COMM_OPTUM_SYS
set AppCompleteURL=https://gcmtest.optum.com/comm/mrm/default.htm
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%
 
::set AppDescription=MRM_COMM_CORDYS_SYS
::set AppCompleteURL=:blank
::call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

::set AppDescription=MRM_COMM_DIRECT_SYS
::set AppCompleteURL=:blank
::call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: MRM COMM UAT Environment
set AppDescription=MRM_COMM_OPTUM_UAT
set AppCompleteURL=https://gcmuat.optum.com/home/COMM/mrm/default.htm
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%
 
::set AppDescription=MRM_COMM_CORDYS_UAT
::set AppCompleteURL=:blank
::call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

::set AppDescription=MRM_COMM_DIRECT_UAT
::set AppCompleteURL=:blank
::call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: MRM COMM STAGE Environment
set AppDescription=MRM_COMM_OPTUM_STG
set AppCompleteURL=https://medicalrecordmanagerstage.optum.com/comm/mrm/default.htm
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%
 
::set AppDescription=MRM_COMM_CORDYS_STG
::set AppCompleteURL=:blank
::call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

::set AppDescription=MRM_COMM_DIRECT_STG
::set AppCompleteURL=:blank
::call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: MRM COMM STAGE Environment
set AppDescription=MRM_COMM_OPTUM_PROD
set AppCompleteURL=https://medicalrecordmanager.optum.com/comm/mrm/default.htm
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: MRM WIKI Portal
set AppDescription=MRM_Wiki
set AppCompleteURL=http://wiki.ingenix.com/display/CAS/Global+Chart+Management+(Project+Emerald)
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: MRM GIT Portal
set AppDescription=MRM_GIT
set AppCompleteURL=https://github.optum.com/RQNS-MRM
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: MRM Jenkins Portal
set AppDescription=MRM_Jenkins
set AppCompleteURL=https://jenkins.optum.com/mrm
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: MRM Performance Centre
set AppDescription=MRM_Performance_Centre
set AppCompleteURL=http://webet0548:8080/qcbin/start_a.jsp
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

::pause 
exit /B



































































:: ************************************************************************************
:: *****************************CODE Don't Touch********************************
:: ************************************************************************************
:removeMRMFavourites
::Remove the directory
rmdir %systemdrive%\users\%USERNAME%\favorites\MRM /S /Q
echo. 
exit /B 0

:createShortcut
::set the common string vars 
set WORKING_PATH=%~dp0
set ICONDEST=%systemdrive%\users\%USERNAME%\favorites\MRM\%~1
echo %ICONDEST%
set LinkPath=%systemdrive%\users\%USERNAME%\favorites\MRM\%~3
echo %LinkPath%

@echo. Copy Icon 
IF EXIST "%ICONDEST%" (GOTO _CopyIcon) 
mkdir "%ICONDEST%"
:_CopyIcon 
copy "%WORKING_PATH%%~2" "%ICONDEST%"

echo. 
echo. Creating desktop shortcut... 
echo [InternetShortcut] > "%LinkPath%"
echo URL=%~4 >> "%LinkPath%"
echo IDList= >> "%LinkPath%"
echo IconFile=%ICONDEST%\%~2 >> "%LinkPath%"
echo IconIndex=0 >> "%LinkPath%"
echo HotKey=0 >> "%LinkPath%"

rmdir "%ICONDEST%"
echo. 
echo. Link.. Name = %~1 with URL = %~4 is added to IE Favourite(s)
echo. 
exit /B 0