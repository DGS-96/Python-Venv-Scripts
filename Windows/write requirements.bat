@echo off

IF EXIST "venv\Scripts\activate.bat" (
	:: Activate project environment
	call venv\Scripts\activate.bat
	
	:: Create requirements
	pip freeze > requirements.txt

) ELSE (
	echo.
	echo [41;30m"FAILED"[0m
	echo [91m"Crashed virtual environment or wrong folder name (required: venv)"[0m
	echo.
	pause
)
