# MyCmdFunctions

A variety of Cmd scripts.

## ShortNamePath.cmd

Will get explicit full short name of specified file or directory, whether relative or full path. The file or path **must** exist.

Running the command specifying the path **C:\Git\MyCmdFunctions**

    c:\test> ShortNamePath.cmd C:\Git\MyCmdFunctions
    C:\Git\MYCMDF~1

Running the command with **/?** show usage parameter.

    c:\test> ShortNamePath.cmd /? 
    Program_name: ShortNamePath.cmd
    Program_path: C:\Git\MyCmdFunctions\   
       
    This program will display the explicit shortname of a file and the folder it is in.
       
    ShortNamePath.cmd            - Return shortname of current folder. Set ERRORLEVEL=0
    ShortNamePath.cmd  filename  - If exists, return shortname and set ERRORLEVEL=0
    ShortNamePath.cmd  filename  - If not exists, write error message and set ERRORLEVEL=1 
    ShortNamePath.cmd  /?        - Displays this usage screen and set ERRORLEVEL=2 

Running the command with no parameters from **C:\Git\MyCmdFunctions** folder

    C:\Git\MyCmdFunctions> ShortNamePath.cmd 
    C:\Git\MYCMDF~1
   
## LongNamePath.cmd

Will get explicit full long name of specified file or directory, whether relative or full path. 

Running the command specifying the path **C:\Git\MYCMDF~1**

    c:\test> LongNamePath.cmd C:\Git\MYCMDF~1
    C:\Git\MyCmdFunctions

Running the command with **/?** show usage parameter.

    c:\test> LongNamePath.cmd /?
    Program_name: LongNamePath.cmd
    Program_path: C:\Git\MyCmdFunctions\
    
    This program will display the explicit long name of a file and the folder it is in.
    
    LongNamePath            - Return longname of current folder. Set ERRORLEVEL=0
    LongNamePath  filename  - If exists, return longname and set ERRORLEVEL=0
    LongNamePath  filename  - If not exists, write error message and set ERRORLEVEL=1
    LongNamePath  /?        - Displays this usage screen and set ERRORLEVEL=2


## CopyNul.cmd 

Will search the current folder structure for specific file or file specification and copy to the NUL device. Use to unstick virus scan. Sets ERRORLEVEL based on execution.

Running the command with a specified file of **new.htm**

    c:\test> copynul.cmd new.htm
    
    Searching for "new.htm"
    copy "C:\test\new.htm" nul
    Done
    
    c:\test> echo %errorlevel%
    0

Running the command without any command line argument

    c:\test> copynul.cmd
    Program_name: CopyNul.cmd
    Program_path: C:\Git\MyCmdFunctions\
    
    This program will search the current folder for the specified file(s)
    and copy them to the NUL device.
    
    CopyNul.cmd- Displays this usage screen and set ERRORLEVEL=2
    CopyNul.cmd rt.jar - Searches for the file 'rt.jar' and if found copy to NUL device. Set ERRORLEVEL=0
    CopyNul.cmd *.msi  - Searches for the file specification '*.msi' and if found copy to NUL device. Set ERRORLEVEL=0
    
    c:\test> echo %errorlevel%
    2



## Test-IsAdmin.cmd

Used to determine if the command prompt is elevated (Run as Administrator). Sets ERRORLEVEL to specific value. See code or Test-IsAdmin.cmd /? for usage screen.

Running with no command line parameters from an **elevated** command prompt

    c:\test> test-isadmin.cmd
    True

Running with no command line parameters from a non-elevated command prompt

    c:\test> test-isadmin.cmd
    False

Running from an elevated command prompt with **/v** verbose command line parameter 

    c:\test> test-isadmin.cmd /v
    Administrative permissions required. Detecting permissions...
    Administrative permissions CONFIRMED.
    Setting exit code to 0. Check with %ERRORLEVEL% variable
    True

Running with **/?** command line parameter to show usage information

    c:\test> test-isadmin.cmd /?
    Program_name: Test-IsAdmin.cmd
    Program_path: C:\Git\MyCmdFunctions\
    
    This program tests to see if the user is running elevated command prompt
    
    Test-IsAdmin.cmd  - If admin then set ERRORLEVEL=0, else set ERRORLEVEL=1
    Test-IsAdmin.cmd  /v  - Verbose mode with messages. If admin then set ERRORLEVEL=0, else set ERRORLEVEL=1
    Test-IsAdmin.cmd  /?  - Displays this usage screen and set ERRORLEVEL=2
    

