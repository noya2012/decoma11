@echo off
del dbc.data
(for %%a in (*.txt) do (
    for /f "usebackq tokens=*" %%b in ("%%a") do (
        echo,%%b
    )
))>dbc.data
md bak
copy *.txt .\bak\*
del *.txt



@echo off
for %%j in (dbc.data) do (
    (for /f "tokens=*" %%i in (%%j) do findstr /C:"%%i" $>nul||echo %%i)>$
    move $ %%j
)

@echo off 
