IF %1.==. GOTO No1
IF %2.==. GOTO No2
ffmpeg -i %1 -af loudnorm=I=-14:LRA=11:TP=-1 %1_%2_tmp.mp3
ffmpeg -i %1_%2_tmp.mp3 -af loudnorm=I=-14:LRA=11:TP=-1 %2
DEL %1_%2_tmp.mp3
GOTO End

:No1
  ECHO No param 1
GOTO End
:No2
  ECHO No param 2
GOTO End



:End