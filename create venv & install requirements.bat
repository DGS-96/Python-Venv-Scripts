@echo off

IF EXIST "venv\Scripts\activate.bat" (
	echo.
	echo [42;30m"venv is OK"[0m
	echo.

	call :ActivateProjectEnvironment
	exit /B 0
	
	call :UpgradePip
	exit /B 0
	
	call :InstallRequirements
	exit /B 0

) ELSE (
	:: Create venv
	python -m venv venv

	call :ActivateProjectEnvironment
	exit /B 0
	
	call :UpgradePip
	exit /B 0

	call :InstallRequirements
	exit /B 0
)


:: DRY
:ActivateProjectEnvironment
IF EXIST "venv\Scripts\activate.bat" (
	call venv\Scripts\activate.bat

) ELSE (
	echo.
	echo [41;30m"FAILED"[0m
	echo [91m"Crashed virtual environment or wrong folder name (required: venv)"[0m
	echo.
	pause
)

:UpgradePip
echo.
echo [43;30m"Check pip version"[0m
echo.
@echo on
python -m pip install --upgrade pip

:InstallRequirements
@echo off
IF EXIST "requirements.txt" (
	@echo on
	:: Install
	pip install -r requirements.txt

) ELSE (
	echo.
	echo [41;30m"FAILED"[0m
	echo [91m "Missing 'requirements.txt' in current directory"[0m
	echo.
	pause
)
