@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"c:\Ruby22\bin\ruby.exe" "c:/Users/Samuel Shapiro/Workspace/restaurant-app/vendor/cache/ruby/2.2.0/bin/sass-convert" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"c:\Ruby22\bin\ruby.exe" "%~dpn0" %*
