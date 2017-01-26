@echo off
setlocal
:: Size is in bytes
set "min.size=100000"

mkdir C:\w10-backgrounds
pushd C:\w10-backgrounds

:: Strip all jpg file extensions (for rerunning script)
ren *.jpg *.

:: Copy files from assets, overwrite duplicates
copy /b/v/y C:\Users\%USERNAME%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets\* .

:: Add back file extensions
ren * *.jpg

:: Delete small files (they are icons and ads, don't want em)
for /f  "usebackq delims=;" %%A in (`dir /b /A:-D *.*`) do If %%~zA LSS %min.size% del "%%A"

:: Open explorerto view the files
explorer .

popd

exit
