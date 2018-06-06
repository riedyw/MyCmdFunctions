@echo off
REM Program:     Test-IsAdmin.cmd
REM Author:      Bill Riedy, riedyw@gmail.com
REM Version:     v1.1
REM Modified:    06/01/2017
REM Purpose:     To determine if running in an elevated command prompt (Run as Administrator)
REM VerHistory:  1.1 Added :Showusage and verbose mode
REM Usage:       Test-IsAdmin.cmd /?
REM
REM              To display usage information
REM Reqs:        None

setlocal
set _cmdNameExt=%~nx0
set _cmdName=%~n0
set _cmdPath=%~dp0

if "%1" == "/?" goto :ShowUsage
if /i "%1" == "/v" set _verbose=true

if defined _verbose echo Administrative permissions required. Detecting permissions...
REM fsutil can only be run by admin users and will return exit code > 0 if not successful
fsutil >nul 2>&1
if %errorLevel% == 0 (
    if defined _verbose echo Administrative permissions CONFIRMED.
    if defined _verbose echo Setting exit code to 0. Check with %%ERRORLEVEL%% variable
    echo True
    endlocal
    exit /b 0
) else (
    if defined _verbose echo Current permissions INADEQUATE.
    if defined _verbose echo Setting exit code to 1. Check with %%ERRORLEVEL%% variable
    echo False
    endlocal
    exit /b 1
)
goto :EOF

:ShowUsage
    echo Program_name: %_cmdNameExt%
    echo Program_path: %_cmdPath%
    echo.
    echo This program tests to see if the user is running elevated command prompt
    echo.
    echo %_cmdNameExt%      - If admin then set ERRORLEVEL=0, else set ERRORLEVEL=1
    echo %_cmdNameExt%  /v  - Verbose mode with messages. If admin then set ERRORLEVEL=0, else set ERRORLEVEL=1
    echo %_cmdNameExt%  /?  - Displays this usage screen and set ERRORLEVEL=2
    echo.
    endlocal
    exit /b 2
    goto :EOF

:EOF