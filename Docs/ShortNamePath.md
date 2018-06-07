# ShortNamePath.md
Documentation for ShortNamePath.cmd
## Overview
Will get explicit full short name of specified file or directory, whether relative or full path. The file or path **must** exist.

## Normal operation - passing a filename or path to the script
Running the command specifying the path `C:\Git\MyCmdFunctions`

    c:\test> ShortNamePath.cmd C:\Git\MyCmdFunctions
    C:\Git\MYCMDF~1

## Show usage
Running the command with `/?` show usage parameter.

    c:\test> ShortNamePath.cmd /?
    Program_name: ShortNamePath.cmd
    Program_path: C:\Git\MyCmdFunctions\
    
    This program will display the explicit shortname of a file and the folder it is in.
    
    ShortNamePath.cmd            - Return shortname of current folder. Set ERRORLEVEL=0
    ShortNamePath.cmd  filename  - If exists, return shortname and set ERRORLEVEL=0
    ShortNamePath.cmd  filename  - If not exists, write error message and set ERRORLEVEL=1
    ShortNamePath.cmd  /?        - Displays this usage screen and set ERRORLEVEL=2

## Normal operation - not passing any filename or path to the script
Running the command with no parameters from `C:\Git\MyCmdFunctions` folder

    C:\Git\MyCmdFunctions> ShortNamePath.cmd
    C:\Git\MYCMDF~1

Remember that the script also sets the `ERRORLEVEL` variable which can be checked with the following:

    C:\Test> echo %errorlevel%
    0

## Error - passing a path that doesn't exist

    C:\Test> ShortNamePath.cmd c:\Git\DoesNotExist
    Path "c:\Git\DoesNotExist" does not exist.

Remember that the script also sets the `ERRORLEVEL` variable which can be checked with the following:

    C:\Test> echo %errorlevel%
    1

## EOF - ShortNamePath.md