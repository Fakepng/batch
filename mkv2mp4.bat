IF %1.==. GOTO No1

ffmpeg -i "%1" -movflags +faststart -codec copy "%~n1.mp4"

GOTO End

:No1
  ECHO No param 1
GOTO End



:End