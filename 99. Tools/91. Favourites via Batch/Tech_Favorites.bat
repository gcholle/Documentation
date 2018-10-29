@echo off 
@echo off 
@echo.
call :removeTechFavourites

::set the application-specific string vars
:: Technology Link(s) Helpful
set AppDescription=Enable_CleanManager
set AppCompleteURL=https://support.appliedi.net/kb/a110/how-to-enable-the-disk-cleanup-tool-on-windows-server-2008-r2.aspx
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%
 
:: Technology Link(s) Helpful
set AppDescription=Reduce_Window_Space
set AppCompleteURL=https://answers.microsoft.com/en-us/windows/forum/windows_7-performance/my-windows-folder-is-huge-20-gb-is-this-normal/97369f83-fc9f-4928-91ac-6d4d622a1db0
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: Selenium Xpath(s) Helpful
set AppDescription=Selenium_XPath
set AppCompleteURL=https://www.guru99.com/xpath-selenium.html
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%
 
:: Selenium Xpath(s) Helpful
set AppDescription=Eclipse_NodeJs
set AppCompleteURL=https://www.dev2qa.com/how-to-run-debug-node-js-application-with-eclipse/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

::pause 
exit /B



































































:: ************************************************************************************
:: *****************************CODE Don't Touch********************************
:: ************************************************************************************
:removeTechFavourites
::Remove the directory
rmdir %systemdrive%\users\%USERNAME%\favorites\Tech /S /Q
echo. 
exit /B 0

:createShortcut
::set the common string vars 
set WORKING_PATH=%~dp0
set ICONDEST=%systemdrive%\users\%USERNAME%\favorites\Tech\%~1
echo %ICONDEST%
set LinkPath=%systemdrive%\users\%USERNAME%\favorites\Tech\%~3
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