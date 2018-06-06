@echo off
REM Program:     CopyNul.cmd
REM Author:      Bill Riedy, riedyw@gmail.com
REM Version:     v1.0
REM Modified:    06/06/2018
REM Purpose:     This program is used to search for a specified type of file and
REM              in the current directory and copying to the NUL: device.
REM              It appears as though virus scan will occasionally get 'stuck'
REM              on a particular file and copying that file to NUL: device
REM              appears to 'unstick' the file and virus scan will continue.
REM Example 1:   CopyNul.cmd rt.jar
REM
REM              Will search for the current folder and sub-folders for the file
REM              'rt.jar' and copy to NUL.
REM Example 2:   CopyNul.cmd
REM
REM              Will display usage information.
REM Example 3:   copynul new.htm
REM
REM              Searching for "new.htm"
REM              copy "C:\test\new.htm" nul
REM              Done
REM Reqs:        None

setlocal
set _cmdNameExt=%~nx0
set _cmdName=%~n0
set _cmdPath=%~dp0

if "%~1" == "" goto :ShowUsage
echo Searching for "%~1"

set tmpfile=%temp%\CopyNul-%random%.log
copy nul %tmpfile% > nul
dir "%~1" /s /b /a-d-l > "%tmpfile%"


REM Excluding folders from the dir listing by /a-d (not Directory attribute)
for /f "tokens=*" %%A in (%tmpfile%) do (
    echo copy "%%~A" nul
    copy "%%~A" nul > nul
    type  "%%~A" > nul
)
echo Done
del "%tmpfile%"
endlocal
exit /b 0
goto :EOF

:ShowUsage
    echo Program_name: %_cmdNameExt%
    echo Program_path: %_cmdPath%
    echo.
    echo This program will search the current folder for the specified file(s)
    echo and copy them to the NUL device.
    echo.
    echo %_cmdNameExt%        - Displays this usage screen and set ERRORLEVEL=2
    echo %_cmdNameExt% rt.jar - Searches for the file 'rt.jar' and if found copy to NUL device. Set ERRORLEVEL=0
    echo %_cmdNameExt% *.msi  - Searches for the file specification '*.msi' and if found copy to NUL device. Set ERRORLEVEL=0
    echo.
    endlocal
    exit /b 2
    goto :EOF

:EOF