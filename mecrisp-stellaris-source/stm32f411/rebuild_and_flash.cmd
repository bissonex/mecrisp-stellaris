SET STLINK="C:\Program Files (x86)\STMicroelectronics\STM32 ST-LINK Utility\ST-LINK Utility\ST-LINK_CLI.exe"

if "%COMPUTERNAME%" == "BCHF6KOC" (
	set GCC_BIN=E:\gcc\4.6_2012q4\bin
) else (
	set GCC_BIN=C:\app\gcc\4.9_2014q4\bin
)

set PATH=%GCC_BIN%;C:\MinGW\bin;C:\MinGW\msys\1.0\bin;%PATH%

mingw32-make.exe clean all

if ERRORLEVEL 0 (
  %STLINK% -P mecrisp-stellaris-stm32f411.bin 0x08000000
  %STLINK% -HardRst
) else (
	echo build error
)
pause
