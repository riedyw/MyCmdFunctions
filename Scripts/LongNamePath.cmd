@echo off
REM Program:     LongNamePath.cmd
REM Author:      Bill Riedy, riedyw@gmail.com
REM Version:     v1.0
REM Modified:    03/01/2016
REM Purpose:     To display the explicit long path name (expanded shortname) of the
REM              first command line parameter
REM VerHistory:  NA as this is the first release
REM Usage:
REM     LongNamePath.cmd /?       - To display help
REM     LongNamePath.cmd          - To display longname of current folder
REM     LongNamePath.cmd filename - To display longname of specified file
REM Requires:    Must have write and delete privileges to location of %TEMP%

setlocal
set _cmdNameExt=%~nx0
set _cmdName=%~n0
set _cmdPath=%~dp0
if "%~1" EQU "/?" goto :ShowUsage
if "%~1" EQU "" (%0 .)
set _cmdFQFN=%~f0
set _temp=%TEMP%\
set _temp=%_temp:\\=\%
set _vbs=%_temp%%_cmdName%.vbs
findstr /E "'VBS" "%_cmdFQFN%" > "%_vbs%"
if exist "%~1" (
    cscript /nologo "%_vbs%" "%~f1"
    set _exit=0
) else (
    echo Path "%~1" does not exist.
    set _exit=1
)
del "%_vbs%"
endlocal
exit /b %_exit%
goto :EOF

REM This next section is Vbscript and gets put into a temp file
name = WScript.Arguments(0)                                             'VBS
                                                                        'VBS
Set fso = CreateObject("Scripting.FileSystemObject")                    'VBS
If fso.FileExists(name) Then                                            'VBS
  Set f = fso.GetFile(name)                                             'VBS
ElseIf fso.FolderExists(name) Then                                      'VBS
  Set f = fso.GetFolder(name)                                           'VBS
  If f.IsRootFolder Then                                                'VBS
    WScript.Echo f.Path                                                 'VBS
    WScript.Quit 0                                                      'VBS
  End If                                                                'VBS
Else                                                                    'VBS
  'path doesn't exist                                                   'VBS
  WScript.Quit 1                                                        'VBS
End If                                                                  'VBS
                                                                        'VBS
Set app = CreateObject("Shell.Application")                             'VBS
WScript.Echo app.NameSpace(f.ParentFolder.Path).ParseName(f.Name).Path  'VBS
                                                                        'VBS

goto :EOF

:ShowUsage
    echo Program_name: %_cmdNameExt%
    echo Program_path: %_cmdPath%
    echo.
    echo This program will display the explicit long name of a file and the folder it is in.
    echo.
    echo %_cmdName%            - Return longname of current folder. Set ERRORLEVEL=0
    echo %_cmdName%  filename  - If exists, return longname and set ERRORLEVEL=0
    echo %_cmdName%  filename  - If not exists, write error message and set ERRORLEVEL=1
    echo %_cmdName%  /?        - Displays this usage screen and set ERRORLEVEL=2
    echo.
    endlocal
    exit /b 2
    goto :EOF

:EOF
