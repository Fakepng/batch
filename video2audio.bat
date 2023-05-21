IF %1.==. GOTO No1
IF %2.==. GOTO No2
ffmpeg -i %1 -vn %2
GOTO End

:No1
  ECHO No param 1
GOTO End
:No2
  ECHO No param 2
GOTO End



:End