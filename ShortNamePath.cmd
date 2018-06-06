@echo off
REM Program:     ShortNamePath.cmd
REM Author:      Bill Riedy, riedyw@gmail.com
REM Version:     v1.0
REM Modified:    03/01/2016
REM Purpose:     To display the explicit short path name of the
REM              first command line parameter
REM VerHistory:  NA as this is the first release
REM Usage:       ShortNamePath.cmd /?
REM
REM              To display help
REM Reqs:        Must have write and delete privileges to location of %TEMP%
REM              variable

setlocal
set _cmdNameExt=%~nx0
set _cmdName=%~n0
set _cmdPath=%~dp0
if "%~1" EQU "/?" goto :ShowUsage
if "%~1" EQU "" (%0 .)
if exist "%~1" (
    echo %~s1
    endlocal
    exit /b 0
) else (
    echo Path "%~1" does not exist.
    endlocal
    exit /b 1
)
goto :EOF

:ShowUsage
    echo Program_name: %_cmdNameExt%
    echo Program_path: %_cmdPath%
    echo.
    echo This program will display the explicit shortname of a file and the folder it is in.
    echo.
    echo %_cmdNameExt%            - Return shortname of current folder. Set ERRORLEVEL=0
    echo %_cmdNameExt%  filename  - If exists, return shortname and set ERRORLEVEL=0
    echo %_cmdNameExt%  filename  - If not exists, write error message and set ERRORLEVEL=1
    echo %_cmdNameExt%  /?        - Displays this usage screen and set ERRORLEVEL=2
    echo.
    endlocal
    exit /b 2
    goto :EOF

:EOF
