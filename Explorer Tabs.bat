@echo off
title Explorer Tabs
call :IsAdmin
goto :Start

:Start
cls
echo. Press [1] to ENABLE Explorer Tabs. (ONLY Windows 11 22H2)
echo. Press [2] to DISABLE Explorer Tabs. (ONLY Windows 11 22H2)
echo. Press [X] to quit
set choice=
set /p choice=Enter Your Choice:
if '%choice%'=='1' goto :enabletabs
if '%choice%'=='2' goto :disabletabs
if '%choice%'=='x' cls & pause & exit

:disabletabs
      cls
	::disable
	reg add "HKLM\SYSTEM\ControlSet001\Control\FeatureManagement\Overrides\4\1931258509" /v "EnabledState" /t REG_DWORD /d "1" /f
	reg delete "HKLM\SYSTEM\ControlSet001\Control\FeatureManagement\Overrides\4\248140940" /f
	reg delete "HKLM\SYSTEM\ControlSet001\Control\FeatureManagement\Overrides\4\2733408908" /f
	echo The new file explorer tabs has disabled successfully, please restart your PC!
	pause
	goto start
:enabletabs
      cls
	::enable
	reg add "HKLM\SYSTEM\ControlSet001\Control\FeatureManagement\Overrides\4\1931258509" /v "EnabledState" /t REG_DWORD /d "2" /f
	reg add "HKLM\SYSTEM\ControlSet001\Control\FeatureManagement\Overrides\4\1931258509" /v "EnabledStateOptions" /t REG_DWORD /d "1" /f
	reg add "HKLM\SYSTEM\ControlSet001\Control\FeatureManagement\Overrides\4\248140940" /v "EnabledState" /t REG_DWORD /d "2" /f
	reg add "HKLM\SYSTEM\ControlSet001\Control\FeatureManagement\Overrides\4\248140940" /v "EnabledStateOptions" /t REG_DWORD /d "1" /f
	reg add "HKLM\SYSTEM\ControlSet001\Control\FeatureManagement\Overrides\4\2733408908" /v "EnabledState" /t REG_DWORD /d "2" /f
	reg add "HKLM\SYSTEM\ControlSet001\Control\FeatureManagement\Overrides\4\2733408908" /v "EnabledStateOptions" /t REG_DWORD /d "1" /f
	echo The new file explorer tabs has enabled successfully, please restart your PC!
      pause
	goto start

:IsAdmin
reg query "HKU\S-1-5-19\Environment"
if not %errorlevel% equ 0 (
 cls & echo You must have administrator rights to continue ... 
 pause & exit
)
cls
goto :EOF


:EOF