# LongNamePath.md 
Documentation for LongNamePath.cmd
## Overview
Will get explicit full long name of specified file or directory, whether relative or full path.

## Normal operation
Running the command specifying the path `C:\Git\MYCMDF~1`

    C:\Test> LongNamePath.cmd C:\Git\MYCMDF~1
    C:\Git\MyCmdFunctions

## Error
Running the command specifying a path that does **not** exist `C:\Git\MYCMDF~1\DNE`

    C:\Test> LongNamePath.cmd C:\Git\MYCMDF~1\DNE
    Path "C:\Git\MYCMDF~1\DNE" does not exist.

Remember that the script also sets the `ERRORLEVEL` variable which can be checked with the following:

    C:\Test> echo %errorlevel%
    1

## Show usage
Running the command with `/?` show usage parameter.

    c:\test> LongNamePath.cmd /?
    Program_name: LongNamePath.cmd
    Program_path: C:\Git\MyCmdFunctions\
    
    This program will display the explicit long name of a file and the folder it is in.
    
    LongNamePath            - Return longname of current folder. Set ERRORLEVEL=0
    LongNamePath  filename  - If exists, return longname and set ERRORLEVEL=0
    LongNamePath  filename  - If not exists, write error message and set ERRORLEVEL=1
    LongNamePath  /?        - Displays this usage screen and set ERRORLEVEL=2

## EOF - LongNamePath.md