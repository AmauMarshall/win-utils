@echo off

if /i [%1]==[] (
	explorer . 
) else (
	explorer %*
)