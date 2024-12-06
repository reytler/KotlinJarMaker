
rem Compilando os arquivos Kotlin
set LOG_FILE=output.log

echo. > %LOG_FILE%

rem Compilando os arquivos .kt encontrados no diretório atual e redirecionando a saída para o arquivo de log
echo Iniciando processo de compilação... >> %LOG_FILE% 2>&1

set FILES=
setlocal enabledelayedexpansion

echo Buscando arquivos .kt ... >> %LOG_FILE% 2>&1
for %%i in (*.kt) do (
    set FILES=!FILES! %%i
)

if "%FILES%"=="" (
    echo Não foram encontrados arquivos .kt >> %LOG_FILE% 2>&1
) else (
    echo Arquivos .kt encontrados !FILES!... >> %LOG_FILE% 2>&1
    echo Compilando arquivos ... >> %LOG_FILE% 2>&1

    kotlinc!FILES! -include-runtime -d projeto.jar >> %LOG_FILE% 2>&1
)