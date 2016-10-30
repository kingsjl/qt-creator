@echo off
echo Installing VCR Driver...

if DEFINED PROCESSOR_ARCHITEW6432 goto :install_wow

if DEFINED PROCESSOR_ARCHITECTURE goto :install_64
%~dp0\vcredist_x86.exe /install /quiet /norestart
exit

:install_64
if %PROCESSOR_ARCHITECTURE%==x86 goto :install_32
%~dp0\vcredist_x86.exe /install /quiet /norestart
%~dp0\vcredist_x64.exe /install /quiet /norestart
exit

:install_32
%~dp0\vcredist_x86.exe /install /quiet /norestart
exit

:install_wow
%~dp0\vcredist_x86.exe /install /quiet /norestart
%~dp0\vcredist_x64.exe /install /quiet /norestart
exit
