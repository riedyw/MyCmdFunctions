# CopyNul.md - Documentation for CopyNul.cmd
## Overview

Will search the current folder structure for specific file or file specification and copy to the NUL device. Use to unstick virus scan. Sets ERRORLEVEL based on execution.

## Normal operation
Running the command with a specified file of `new.htm` while in the `C:\Test` folder

    C:\Test> CopyNul.cmd new.htm
    
    Searching for "new.htm"
    copy "C:\test\new.htm" nul
    Done

Remember that the script also sets the `ERRORLEVEL` variable which can be checked with the following:

    C:\Test> echo %errorlevel%
    0

## Show usage - no command line parameter
Running the command without any command line argument

    C:\Test> CopyNul.cmd
    Program_name: CopyNul.cmd
    Program_path: C:\Git\MyCmdFunctions\
    
    This program will search the current folder for the specified file(s)
    and copy them to the NUL device.
    
    CopyNul.cmd- Displays this usage screen and set ERRORLEVEL=2
    CopyNul.cmd rt.jar - Searches for the file 'rt.jar' and if found copy to NUL device. Set ERRORLEVEL=0
    CopyNul.cmd *.msi  - Searches for the file specification '*.msi' and if found copy to NUL device. Set ERRORLEVEL=0

Remember that the script also sets the `ERRORLEVEL` variable which can be checked with the following:

    c:\test> echo %errorlevel%
    2

## EOF - CopyNul.md