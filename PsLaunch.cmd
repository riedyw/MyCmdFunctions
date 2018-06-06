@echo off
REM Program:     PsLaunch.cmd
REM Author:      Bill Riedy, riedyw@gmail.com
REM Version:     v1.0
REM Modified:    06/06/2018
REM Purpose:     To save current Powershell execution policy for scripts, set value 
REM              to Unrestricted, run Powershell, then reset execution policy to
REM              the saved value
REM Usage:       PsLaunch.cmd /?
REM
REM              To display usage information
REM Usage:       PsLaunch.cmd
REM
REM              To check permissions, then launch Powershell so that scripts can be run
REM Reqs:        None

:Initialize
    set _cmdNameExt=%~nx0
    set _cmdName=%~n0
    set _cmdPath=%~dp0
    setlocal enabledelayedexpansion
    echo ==========================================================
    echo ==========================================================
    echo INITIALIZING %_cmdNameExt%

:CheckUsage
    if "%1" == "/?" goto :ShowUsage

:CheckAdmin
    echo ==========================================================
    echo ==========================================================
    echo Administrative permissions required. Detecting permissions...
    REM fsutil can only be run by admin users and will return exit code > 0 if not successful
    fsutil >nul 2>&1
    if %errorLevel% == 0 (
        echo CONFIRMED Administrative permissions.
    ) else (
        echo INADEQUATE permissions.
        echo Setting exit code to 1. Check with %%ERRORLEVEL%% variable
        exit /b 1
    )

:SaveState
    rem Capture current execution policy
    echo Saving current execution policy
    set _curExecPolicy=
    for /F "tokens=*" %%I in ('powershell.exe -noprofile -command "Get-ExecutionPolicy"') do set _curExecPolicy=%%I
    echo Current execution policy is (%_curExecPolicy%)

:Unrestrict
    echo Setting execution policy to (Unrestricted)
    powershell -noprofile -command "Set-ExecutionPolicy Unrestricted -Force"

:Launch
    REM This is where you would launch Powershell and specify a particular .ps1 file to run. 
    REM Or alternatively as shown here to just launch Powershell
    powershell -noprofile

:Cleanup
    echo Returning execution policy to (%_curExecPolicy%)
    powershell -noprofile -command "Set-ExecutionPolicy %_curExecPolicy% -Force"
    echo Finished
    exit /b 0
    goto :EOF

:ShowUsage
    echo ==========================================================
    echo ==========================================================
    echo Program_name: %_cmdNameExt%
    echo Program_path: %_cmdPath%
    echo.
    echo Purpose: 
    echo   1. Checks permissions prior to launching Powershell
    echo   2. Launch Powershell get current script restriction setting
    echo   3. Launch Powershell turn off script restriction
    echo   4. Launch Powershell interactively
    echo   5. Launch Powershell set script restriction setting to what found in step 2
    echo.
    echo %_cmdNameExt%      - If appropriate permissions it will run through steps
    echo                      then set ERRORLEVEL=0
    echo %_cmdNameExt%      - If not running an elevated command prompt (Run
    echo                      as Administrator) a message will be displayed 
    echo                      and then set ERRORLEVEL=1
    echo %_cmdNameExt%  /?  - Displays this usage screen and set ERRORLEVEL=3
    echo.
    endlocal
    exit /b 3
    goto :EOF

:EOF