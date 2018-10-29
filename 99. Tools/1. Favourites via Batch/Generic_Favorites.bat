@echo off 
@echo.
call :removeGenericFavourites

::set the application-specific string vars
:: Technology Link(s) Helpful
set AppDescription=GHMC_Grievance
set AppCompleteURL=http://210.212.212.123/ghmc/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%
 
:: Technology Link(s) Helpful
set AppDescription=GHMC_Redressal_Mobile_OTP
set AppCompleteURL=http://igs.ghmc.gov.in/send_otp_mobile.aspx
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%
 
:: Technology Link(s) Helpful
set AppDescription=Telangana_EC
set AppCompleteURL=http://prereg.telangana.gov.in/TGCARDECClient/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

::pause 
exit /B



































































:: ************************************************************************************
:: *****************************CODE Don't Touch********************************
:: ************************************************************************************
:removeGenericFavourites
::Remove the directory
rmdir %systemdrive%\users\%USERNAME%\favorites\Generic /S /Q
echo. 
exit /B 0

:createShortcut
::set the common string vars 
set WORKING_PATH=%~dp0
set ICONDEST=%systemdrive%\users\%USERNAME%\favorites\Generic\%~1
echo %ICONDEST%
set LinkPath=%systemdrive%\users\%USERNAME%\favorites\Generic\%~3
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