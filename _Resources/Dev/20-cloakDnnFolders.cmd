@REM %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools\VsDevCmd.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools\VsDevCmd.bat"
@ECHO *************************************************************
@ECHO Cloak DNN Cache
tf workfold -cloak %~dp0..\..\Website\Portals\_default\Cache\
tf workfold -cloak %~dp0..\..\Website\Portals\0\Cache\
tf workfold -cloak %~dp0..\..\Website\Portals\1\Cache\
@ECHO *************************************************************
@ECHO Cloak DNN ClientDependency
tf workfold -cloak %~dp0..\..\Website\App_Data\ClientDependency\
@ECHO *************************************************************
@ECHO Cloak DNN Search
tf workfold -cloak %~dp0..\..\Website\App_Data\Search\
pause