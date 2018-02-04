@ECHO OFF
IF "%MATERIJALI%"=="" SET "MATERIJALI=D:\Materijali"
ECHO Definirana lokacija za materijale je: %MATERIJALI%
SET /P MATERIJALI=[Unesite novu lokaciju Materijala]
SET MATERIJALI
SETX MATERIJALI %MATERIJALI%
REM PAUSE