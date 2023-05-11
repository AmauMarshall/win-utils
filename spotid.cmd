@echo off

type "C:\Users\amarechal\source\repos\Personal Space\cyberdog\docker-compose.yaml" | findstr "Uuid" > tmpFile
(for /f "tokens=1,* delims=^=" %%a in (tmpFile) do echo %%b)
del tmpFile