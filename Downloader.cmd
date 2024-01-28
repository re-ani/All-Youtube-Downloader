@echo off
title YouTube Playlist Downloader
set /p url=Enter url:
set /P option=Want Default Configration?(Y/N)?  
if /I "%option%"=="n"goto continue
if /I "%option%"=="y" goto end
	:continue
	set /p range=Select Range:
	set /p path=Select Path:
	set /p for=Set format?(May decrease video quality)(Y/N)
	if /I "%for%"=="y"goto yes
	if /I "%for%"=="n" goto no
	:yes
	set /p format=Select Format
	set command=yt-dlp -P %path% -I %range% -f %format% %url%
	pause
	start cmd /k %command%
	goto exit
	:no
	set command=yt-dlp -P %path% -I %range% %url%
	pause
	start cmd /k %command%
	goto exit
:end
set /p range=Select range:
set command=yt-dlp -I %range% %url%
pause
start cmd /k %command%
:exit