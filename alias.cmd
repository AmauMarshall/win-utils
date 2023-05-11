@echo off
setlocal EnableDelayedExpansion

set ALIASES_DIR=aliase

if "%~1"=="" goto main
if /i %~1==alias (
	echo ERROR: 'alias' can not be aliased
	echo.
	goto help
) else (
	if %~1==-h (
		goto help
	) else (
		if %~1==--help (
			goto help
		) else (
			if %~1==-l ( 
				goto list
			) else (
				if %~1==--list ( 
					goto list
				) else (
					if %~1==-o (
						goto xp
					) else (
						if %~1==-r (
							if "%~2"=="" (
								echo ERROR: No alias specified
								echo.
								goto help
							) else (
								if /i %~2==alias (
									echo ERROR: Cannot read this alias
								) else (
									echo "%2" is aliased to:
									echo # *** ** * ** *** #
									type %USERPROFILE%\%ALIASES_DIR%\%~2.cmd
									echo.
									echo # *** ** * ** *** #
								)
							)
						) else (
							if %~1==-rm (
								if "%~2"=="" (
									echo ERROR: No alias specified
									echo.
									goto help
								) else (
									if /i %~2==alias (
										echo ERROR: Cannot remove this alias
									) else (
										del %USERPROFILE%\%ALIASES_DIR%\%~2.cmd
									)
								)
							) else (
								if "%~2"=="" (
									rem echo ERROR: No command called
									rem echo.
									rem goto help
									type C:\Users\amarechal\%ALIASES_DIR%\%1.cmd
								) else (
									rem set tmpvar=%2
									rem set tmpvar=!tmpvar:~1,-1!
									rem echo @echo off > C:\Users\amarechal\%ALIASES_DIR%\%1.cmd 
									set tmpvar=%~2 
									rem set tmpvar=!tmpvar:""="!
									echo @echo off > %USERPROFILE%\%ALIASES_DIR%\%1.cmd 
									echo !tmpvar! %%* >> %USERPROFILE%\%ALIASES_DIR%\%1.cmd 
									echo new alias set
								)
							)
						)
					)
				)
			)
		)
	)
)
goto end

:main
echo alias name 'cmd' OR alias name "cmd"
echo.
echo OPTIONS:
echo -h, --help for help page
echo -l, --list for alias list
echo -r [ALIAS] to read alias
echo -rm [ALIAS] to remove alias
echo.
echo ALIASE:
for %%f in ("%USERPROFILE%\%ALIASES_DIR%\*.cmd") do @echo %%~nf
goto end

:help
echo alias name 'cmd' OR alias name "cmd"
echo.
echo OPTIONS:
echo -h, --help for help page
echo -l, --list for alias list
echo -rm [ALIAS] to remove alias
goto end

:list
echo ALIASE:
for %%f in ("%USERPROFILE%\%ALIASES_DIR%\*.cmd") do @echo %%~nf
goto end

:xp
explorer %USERPROFILE%/%ALIASES_DIR%;
goto end

:end
endlocal
exit /B 1