@ECHO OFF

:init
@REM Decide how to startup depending on the version of windows
@REM Based on code from pellet.bat

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xGetScriptDir

:WinNTGetScriptDir
set BASEDIR=%~dp0
goto repoSetup

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=

:repoSetup

set JENAROOT=%BASEDIR%\apache-jena-3.0.0

%BASEDIR%\apache-jena-3.0.0\bat\sparql.bat %*

set JENAROOT=
