#C64Studio.MetaData.BASIC:2049,BASIC V2
PRINTCHR$(147)
V=53248:X=24:Y=50
POKE53281,12:POKE53280,12
FORI=1TO80:
POKE199,POS({PI})*7/9AND1:
PRINTMID$("{GREY 3}{SHIFT-POUND}{GREY 1}{CBM-*}",RND(1)*4OR1,2);:
NEXT

REM SETUP SPRITE
POKE53269,1
POKE832,128:REM FORQ=832TO832+2:READW:POKEQ,W:NEXT
POKE2040,13
DATA128,0,0

LABEL120
J=PEEK(56320)
U=((JAND2)/4-(JAND1)/2)*2
C=(JAND8)/8-(JAND4)/4
X=X-C:Y=Y-U

REM SPRITE COORDS TO SCREEN COORDS
X1=INT((X-24)/8):Y1=INT((Y-50)/8)

REM SCREEN COORDS MODULOS
XM=XAND7:YM=YAND7:

REM MOVE SPRITE
POKEV,X:POKEV+1,Y:K=PEEK(53279):
REM PRINT"{HOME}";XM;" ";YM
REM PRINT"{HOME}";K;" ";(1024+X1+Y1*40);":";PEEK(1024+X1+Y1*40);"  ";X;",";Y;" ";X1;",";Y1;"  "
REM PRINT"{HOME} ";(1024+X1+Y1*40);":";PEEK(1024+X1+Y1*40);"              "

GOTOLABEL120
