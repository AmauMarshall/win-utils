@echo off  

if "%~1"=="" goto down
if /i %1==-d goto down
if /i %1==-s goto stop
if /i %1==-p goto pause

goto end


:down
dc -f "C:\Users\amarechal\source\repos\Personal Space\cyberdog\docker-compose.yaml" down %2 %3 %4 %5 %6 %7 %8 %9  
goto end

:stop
dc -f "C:\Users\amarechal\source\repos\Personal Space\cyberdog\docker-compose.yaml" stop %2 %3 %4 %5 %6 %7 %8 %9  
goto end

:pause
dc -f "C:\Users\amarechal\source\repos\Personal Space\cyberdog\docker-compose.yaml" pause %2 %3 %4 %5 %6 %7 %8 %9  
goto end

:end
exit /B 1