# Test-IsAdmin.md
Documentation for `Test-IsAdmin.cmd`
## Overview
Used to determine if the command prompt is elevated (Run as Administrator). Sets ERRORLEVEL to specific value. See code or Test-IsAdmin.cmd /? for usage screen.

## Normal operation 
Running with no command line parameters from an **elevated** Command Prompt

    C:\Test> Test-IsAdmin.cmd
    True

## Error running from a non-elevated Command Prompt
Running with no command line parameters from a non-elevated command prompt

    C:\Test> Test-IsAdmin.cmd
    False

Remember that the script also sets the `ERRORLEVEL` variable which can be checked with the following:

    C:\Test> echo %errorlevel%
    1

## Verbose mode
Running from an elevated command prompt with `/v` verbose command line parameter 

    C:\Test> Test-IsAdmin.cmd /v
    Administrative permissions required. Detecting permissions...
    Administrative permissions CONFIRMED.
    Setting exit code to 0. Check with %ERRORLEVEL% variable
    True

## Show usage
Running with `/?` command line parameter to show usage information

    C:\Test> Test-IsAdmin.cmd /?
    Program_name: Test-IsAdmin.cmd
    Program_path: C:\Git\MyCmdFunctions\
    
    This program tests to see if the user is running elevated command prompt
    
    Test-IsAdmin.cmd  - If admin then set ERRORLEVEL=0, else set ERRORLEVEL=1
    Test-IsAdmin.cmd  /v  - Verbose mode with messages. If admin then set ERRORLEVEL=0, else set ERRORLEVEL=1
    Test-IsAdmin.cmd  /?  - Displays this usage screen and set ERRORLEVEL=2
    

## EOF - Test-IsAdmin.md