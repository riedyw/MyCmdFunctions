# PsLaunch.md
Documentation for PsLaunch.cmd
## Overview
Will perform the following:

- Check if running in elevated Command Prompt
- Save the current Powershell execution policy through `Get-ExecutionPolicy` command.
- Change the Powershell execution policy to Unrestricted
- Launch Powershell in the Unrestricted state so you can run scripts
- Change the Powershell execution policy as was saved previously through `Set-ExecutionPolicy` command.

## Normal operation
Running the command from an **elevated** Command Prompt (*Run as Administrator*)

    C:\Test> $ pslaunch.cmd
    ==========================================================
    ==========================================================
    INITIALIZING PsLaunch.cmd
    ==========================================================
    ==========================================================
    Administrative permissions required. Detecting permissions...
    CONFIRMED Administrative permissions.
    Saving current execution policy
    Current execution policy is (RemoteSigned)
    Setting execution policy to (Unrestricted)
    Windows PowerShell
    Copyright (C) 2016 Microsoft Corporation. All rights reserved.

    PS C:\Test> 

This is where you would run any appropriate scripts or commands. To exit the Powershell session enter the command `Exit` and the following additional information will be displayed

    Returning execution policy to (RemoteSigned)
    Finished
    C:\Test>

## Running from a non-elevated Command Prompt
If you were to run `PsLaunch.cmd` from a non-elevated Command prompt you would see the following:

    C:\Test > PsLaunch.cmd
    ==========================================================
    ==========================================================
    INITIALIZING PsLaunch.cmd
    ==========================================================
    ==========================================================
    Administrative permissions required. Detecting permissions...
    INADEQUATE permissions.
    Setting exit code to 1. Check with %ERRORLEVEL% variable

You could then see the `ERRORLEVEL` value by entering the following:

    C:\Test > echo %errorlevel%
    1

## Show usage
Running the command with `/?` show usage parameter.

    c:\test> PsLaunch.cmd /?
    ==========================================================
    ==========================================================
    INITIALIZING PsLaunch.cmd
    ==========================================================
    ==========================================================
    Program_name: PsLaunch.cmd
    Program_path: C:\Git\MyCmdFunctions\Scripts\
    
    Purpose:
      1. Checks permissions prior to launching Powershell
      2. Launch Powershell get current script restriction setting
      3. Launch Powershell turn off script restriction
      4. Launch Powershell interactively
      5. Launch Powershell set script restriction setting to what found in step 2
    
    PsLaunch.cmd      - If appropriate permissions it will run through steps
                         then set ERRORLEVEL=0
    PsLaunch.cmd      - If not running an elevated command prompt (Run
                         as Administrator) a message will be displayed
                         and then set ERRORLEVEL=1
    PsLaunch.cmd  /?  - Displays this usage screen and set ERRORLEVEL=3

## EOF - PsLaunch.md