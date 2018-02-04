@ECHO *************************************************************
@ECHO Delete DNN Cache Files
del %~dp0..\..\Website\Portals\_default\Cache\*.* /s /f /q
del %~dp0..\..\Website\Portals\0\Cache\*.* /s /f /q
@REM del %~dp0..\..\Website\Portals\1\Cache\*.* /s /f /q
@ECHO *************************************************************
@ECHO Delete DNN ClientDependency
del %~dp0..\..\Website\App_Data\ClientDependency\*.* /s /f /q
@ECHO *************************************************************
@ECHO Delete DNN Logs
del %~dp0..\..\Website\Portals\_default\Logs\*.log.resources /s /f /q
@ECHO *************************************************************
@ECHO Delete DNN Search
del %~dp0..\..\Website\App_Data\Search\*.* /s /f /q
pause