@echo off
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' (goto gotPrivileges) else (goto getPrivileges)
:getPrivileges
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo For Each strArg in WScript.Arguments >> "%temp%\getadmin.vbs"
echo If strArg = WScript.Arguments.Item^(0^) Then d = Left^(strArg, InStrRev^(strArg,"\"^) - 1^) >> "%temp%\getadmin.vbs"
echo args = args ^& " " ^& strArg  >> "%temp%\getadmin.vbs"
echo Next >> "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", ^("/c start /D """ ^& d ^& """ /B" ^& args ^& " ^& exit"^), , "runas", 4 >> "%temp%\getadmin.vbs"
cscript "%temp%\getadmin.vbs" ""%~s0"" %*
del /q "%temp%\getadmin.vbs"
exit /b
:gotPrivileges
set appPath=%homedrive%%homepath%\all-Youtube-Downloader
setx PATH "%PATH%;%appPath%"
:: Confirm the change
echo The Setup is Complete.
pause
