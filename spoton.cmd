@echo off  
@echo off  

if "%~1"=="" goto up
if %~1==-u goto up
if %~1==-s goto start
if %~1==-r goto unpause
if %~1==-R goto restart

goto end

:up
dc -f "C:\Users\amarechal\source\repos\Personal Space\cyberdog\docker-compose.yaml" up -d %2 %3 %4 %5 %6 %7 %8 %9  
goto end

:start
dc -f "C:\Users\amarechal\source\repos\Personal Space\cyberdog\docker-compose.yaml" start %2 %3 %4 %5 %6 %7 %8 %9  
goto end

:unpause
dc -f "C:\Users\amarechal\source\repos\Personal Space\cyberdog\docker-compose.yaml" unpause %2 %3 %4 %5 %6 %7 %8 %9  
goto end

:restart
dc -f "C:\Users\amarechal\source\repos\Personal Space\cyberdog\docker-compose.yaml" restart %2 %3 %4 %5 %6 %7 %8 %9  
goto end

:end
exit /B 1