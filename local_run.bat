@ECHO OFF
ECHO Ahoj svete!
ECHO NultyParametr %0 > aa.txt
ECHO PrnviParametr %1 >> aa.txt
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2% %ldt:~8,2%:%ldt:~10,2%:%ldt:~12,6%
echo Local date is [%ldt%] >> aa.txt
dir >> aa.txt
rem date > b.txt
rem Zmena pro cviceniG5