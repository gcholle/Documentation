@echo off 
@echo off 
@echo.
call :removeOptumFavourites

::set the application-specific string vars
:: UHG Bright Idea
set AppDescription=Bright_Idea
set AppCompleteURL=http://brightidea.uhc.com/GSD/ShowIdeas.aspx?Type=MyIdeas
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%
 
:: UHG Hub
set AppDescription=Hub
set AppCompleteURL=https://hub.uhg.com/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG Hub Connect
set AppDescription=Hub_Connect
set AppCompleteURL=https://hubconnect.uhg.com/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG HR Direct
set AppDescription=HR_Direct_HelpDesk
set AppCompleteURL=https://hrdirecthelpdesk.uhg.com/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG HR Payroll
set AppDescription=Payroll
set AppCompleteURL=https://www.allsechro.com/uhgsso/Smartlogic/Memberlogin.aspx
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG Transport
set AppDescription=Smart_Transport
set AppCompleteURL=http://smartcommute.optum.com/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG Parking Sticker
set AppDescription=Parking_Management_System
set AppCompleteURL=http://pms.optum.com/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: OPTUM Planview
set AppDescription=Optum_Planview
set AppCompleteURL=https://optum.pvcloud.com/planview/login/body.asp
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG Total Rewards
set AppDescription=Total_Rewards
set AppCompleteURL=https://hub.uhg.com/pay-benefits/total-rewards/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG Concur Expenses
set AppDescription=Concur_Expenses
set AppCompleteURL=http://concur.uhc.com
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG Global Self Service
set AppDescription=Global_Self_Service
set AppCompleteURL=https://globalselfservice.uhg.com
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG Learn Source
set AppDescription=LearnSource
set AppCompleteURL=http://learnsource.uhg.com/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG Learning Portal
set AppDescription=Skillport_Learning
set AppCompleteURL=https://ogs.skillport.com/skillportfe/login.action
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG NT Lookup
set AppDescription=NT_LookUp
set AppCompleteURL=http://ntlookup.uhc.com/Default.aspx
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG Application Verification System
set AppDescription=AVS
set AppCompleteURL=http://avs.uhc.com/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG New Software Request
set AppDescription=Appstore
set AppCompleteURL=http://appstore.uhc.com/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG New Asset Request
set AppDescription=Asset_Request
set AppCompleteURL=http://app29-02.optum.com/sites/TSINFRA/ITAM/Asset%%%%20Request/Forms/AllItems.aspx
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG Secure Access
set AppDescription=Secure_Portal
set AppCompleteURL=https://secure.uhc.com/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG e-Pass Access
set AppDescription=e-pass
set AppCompleteURL=https://epass.uhg.com/safeselfservice/Default.aspx
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG Outlook Web App
set AppDescription=Mail_Outlook_WebApp
set AppCompleteURL=https://owa.uhc.com/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG Bravo Award
set AppDescription=Bravo_Recognition
set AppCompleteURL=https://recognition.uhg.com/default.htm
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG IT Provisioning Portal
set AppDescription=UHG_IT_Provision_Portal
set AppCompleteURL=http://aps.uhc.com/APS/default.aspx
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG HelpDesk
set AppDescription=UHG_HelpDesk
set AppCompleteURL=http://helpdesk.uhg.com/
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG Calendar
set AppDescription=UHG_Calendar
set AppCompleteURL=https://hub.uhg.com/sites/hub/Resources/Pages/Calendars.aspx
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHC Scar Portal
set AppDescription=UHG_SCAR
set AppCompleteURL=https://scar.uhc.com/ssc
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG SONAR PORTAL
set AppDescription=OPTUM_SONAR
set AppCompleteURL=http://sonar.optum.com/projects/favorite
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

:: UHG WMO PORTAL
set AppDescription=OPTUM_WMO
set AppCompleteURL=wmohub.optum.com
call :createShortcut %AppDescription% %AppDescription%.ico %AppDescription%.url %AppCompleteURL%

::pause 
exit /B



































































:: ************************************************************************************
:: *****************************CODE Don't Touch********************************
:: ************************************************************************************
:removeOptumFavourites
::Remove the directory
rmdir %systemdrive%\users\%USERNAME%\favorites\Optum /S /Q
echo. 
exit /B 0

:createShortcut
::set the common string vars 
set WORKING_PATH=%~dp0
set ICONDEST=%systemdrive%\users\%USERNAME%\favorites\Optum\%~1
echo %ICONDEST%
set LinkPath=%systemdrive%\users\%USERNAME%\favorites\Optum\%~3
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