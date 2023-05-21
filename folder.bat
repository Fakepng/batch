echo OFF
echo Welcome Sot!
echo Folder version 1.1.4
echo Author: Fakepng

rem to set default RAW extension change "" to extension e.g. .raw
set RAWEXTENSION=cr2

:main
set /p UserInputPath=What Directory would you like?: 

:ready
echo You have selected %UserInputPath%

if %RAWEXTENSION% == "" (
  echo No RAW extension specified
  echo Please edit the script to set the default RAW extension
  set /p RAWEXTENSION=What is the RAW file extension?: 
)

if not exist "%UserInputPath%"\*.%RAWEXTENSION% (
  echo Default RAW extension is not found
  set /p RAWEXTENSION=What is the RAW file extension?: 
)

echo Checking if RAW folder exists...
if exist "%UserInputPath%"\RAW (
  echo RAW folder already exists!
) else (
  if not exist %UserInputPath%\*.%RAWEXTENSION% (
    echo No RAW files found in %UserInputPath%
    echo Please check the RAW extension
    goto main
  ) else (
    echo Creating RAW folder...
    mkdir %UserInputPath%\RAW
  )
)

echo Checking if JPEG folder exists...
if exist %UserInputPath%\JPEG (
  echo JPEG folder already Exists!
) else (
  echo Created JPEG folder
  mkdir %UserInputPath%\JPEG
)


echo Start copying RAW files...
move /Y %UserInputPath%\*.%RAWEXTENSION% %UserInputPath%\RAW

echo Start copying JPEG files...
move /Y %UserInputPath%\*.jpg %UserInputPath%\JPEG

echo Checking for video files...
if not exist %UserInputPath%\*.mp4 (
  echo Video files not found
) else (
  if not exist %UserInputPath%\VIDEO mkdir %UserInputPath%\VIDEO
  move /Y %UserInputPath%\*.mp4 %UserInputPath%\VIDEO
)

echo Finished!

set /p UserInput=Would you like to run again? (Y/N):
if %UserInput%==y goto main
if %UserInput%==Y goto main
set UserInputPath=%UserInput%
if exist %UserInput%\*.jpg goto ready
if exist %UserInput%\*.%RAWEXTENSION% goto ready
if exist %UserInput%\*.mp4 goto ready