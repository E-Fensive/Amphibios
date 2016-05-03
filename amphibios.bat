@Echo off

mkdir c:\amphibios
cls
del /Q c:\amphibios\*
cd c:\amphibios
echo    ^<HTML^>^<HEAD^>^<TITLE^>Amphibios v1.0 ^</TITLE^>^</HEAD^> >> amphibios.html
echo    ^<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#ff0000" VLINK="#ff0000"^> >> amphibios.html
echo    ^<center^>^<b^>^<img src="http://www.infiltrated.net/mgz/amphibios.jpg"^>^</center^>^<br^>^<br^> >> amphibios.html
echo    ^<h1 align="center"^>^<b^>^<font face="Arial" color="black"^>Amphibios System Information^</font^>^</b^>^</h1^> >> amphibios.html
echo    ^<p align="center"^>^<table border="0"^> >> amphibios.html
echo	^<font face="Arial" color="black"^> >> amphibios.html
echo    ^<td^>^<font face="Arial" color="black"^>^<B^>System Info^</td^> >> amphibios.html
echo    ^<td^>^<font face="Arial" color="black"^>^<B^>Patches^</td^> >> amphibios.html
echo    ^<td^>^<font face="Arial" color="black"^>^<B^>Drive Info^</td^>^</B^>^</p^> >> amphibios.html
echo    ^<td^>^<font face="Arial" color="black"^>^<B^>User Accounts^</td^>^</B^>^</p^> >> amphibios.html
echo    ^<td^>^<font face="Arial" color="black"^>^<B^>System Details^</td^>^</B^>^</p^> >> amphibios.html
echo    ^<td^>^<font face="Arial" color="black"^>^<B^>Cronjobs^</td^>^</B^>^</p^> >> amphibios.html
echo    ^<td^>^<font face="Arial" color="black"^>^<B^>Group Info^</td^>^</B^>^</p^> >> amphibios.html
echo    ^<td^>^<font face="Arial" color="black"^>^<B^>Sessions Info^</td^>^</B^>^</p^> >> amphibios.html
echo    ^<td^>^<font face="Arial" color="black"^>^<B^>Jobs Info^</td^>^</B^>^</p^> >> amphibios.html
echo    ^<td^>^<font face="Arial" color="black"^>^<B^>Services Info^</td^>^</B^>^</tr^>^</p^> >> amphibios.html

echo getting OS information
    wmic /Failfast:on /output:"c:\amphibios\OS.html" OS Get /All /format:hform
echo getting Drive information
    wmic /Failfast:on /output:"c:\amphibios\drives.html" logicaldisk get caption, description, filesystem, size, freespace
echo getting patch information
    wmic /Failfast:on /output:"c:\amphibios\qfe.html" qfe list full /format:hform
echo getting user information
    wmic /Failfast:on USERACCOUNT > c:\amphibios\useraccounts.txt
echo getting computer information
    wmic /Failfast:on COMPUTERSYSTEM > c:\amphibios\computersystem.txt
echo getting group information
    wmic /Failfast:on GROUP > c:\amphibios\groups.txt
echo getting cron information
    wmic /Failfast:on JOB > c:\amphibios\cronjobs.txt
echo Getting Established Connections
netstat -na | findstr EST > c:\amphibios\established.txt
echo Looking for any timed jobs
at > c:\amphibios\schedules.txt
schtasks > c:\amphibios\schedules.txt
echo Enumerating Processes
tasklist /SVC > c:\amphibios\runningservices.txt


    echo     ^<td^>^<font face="Arial" color="black"^>^<a href="c:\amphibios\OS.html"^>OS Info^</a^>^</td^> >> amphibios.html
    echo     ^<td^>^<font face="Arial" color="black"^>^<a href="c:\amphibios\QFE.html"^>Patches^</a^>^</td^> >> amphibios.html
    echo     ^<td^>^<font face="Arial" color="black"^>^<a href="c:\amphibios\drives.html"^>Drive Volumes^</a^>^</td^> >> amphibios.html
    echo     ^<td^>^<font face="Arial" color="black"^>^<a href="c:\amphibios\useraccounts.txt"^>User Accounts^</a^>^</td^> >> amphibios.html
    echo     ^<td^>^<font face="Arial" color="black"^>^<a href="c:\amphibios\computersystem.txt"^>Computer System^</a^>^</td^> >> amphibios.html
    echo     ^<td^>^<font face="Arial" color="black"^>^<a href="c:\amphibios\cronjobs.txt"^>Crontabs^</a^>^</td^> >> amphibios.html
    echo     ^<td^>^<font face="Arial" color="black"^>^<a href="c:\amphibios\groups.txt"^>Group Info^</a^>^</td^> >> amphibios.html
    echo     ^<td^>^<font face="Arial" color="black"^>^<a href="c:\amphibios\established.txt"^>Established Sessions^</a^>^</td^> >> amphibios.html
    echo     ^<td^>^<font face="Arial" color="black"^>^<a href="c:\amphibios\schedules.txt"^>Schedules^</a^>^</td^> >> amphibios.html
    echo     ^<td^>^<font face="Arial" color="black"^>^<a href="c:\amphibios\runningservices.txt"^>Running Services^</a^>^</td^> >> amphibios.html
    echo ^</tr^> >> c:\amphibios\amphibios.html
    echo ^<p align="center"^>^<b^>^<font size=color="Red"^>^<BR^>Completed at >> c:\amphibios\amphibios.html
echo Adding timestamp
time /T >> c:\amphibios\amphibios.html
echo Adding date
date /T >> c:\amphibios\amphibios.html
echo ^</font^>^</b^>^<BR^>^</p^> >> c:\amphibios\amphibios.html
Echo .
Echo amphibios is finished!!!

IF EXIST "%ProgramFiles(x86)%" (

  "%ProgramFiles(x86)%\Internet Explorer\IEXPLORE.EXE" c:\amphibios\amphibios.html

) ELSE (

"%ProgramFiles%\Internet Explorer\IEXPLORE.EXE" c:\amphibios\amphibios.html

)
