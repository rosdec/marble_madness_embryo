#C64Studio.MetaData.BASIC:2049,BASIC V2

V=53248:Q=.5
POKE53281,12:POKE53280,12
POKEV+29,1:POKEV+23,1
LABEL10
PRINTCHR$(147):X=24:Y=58:
PRINT" ";:FORI=1TO62
POKE199,POS({PI})*7/9AND1
PRINTMID$("{GREY 3}{SHIFT-POUND}{GREY 1}{CBM-*}{GREY 3}{CBM-+}",RND(1)*6OR1,2);:IF((IAND7)=7)THENPRINT
NEXT:PRINT"{SHIFT-W}"


REM SETUP SPRITE
POKE53269,1
POKE832,128
POKE2040,13
POKE53287,2

LABEL120
J=PEEK(56320)
U=((JAND2)/4-(JAND1)/2)*2
C=(JAND8)/8-(JAND4)/4

REM SPRITE COORDS TO SCREEN COORDS
X1=INT((X-24)/8):Y1=INT((Y-50)/8)

REM SCREEN COORDS MODULOS
XM=X-INT(X/8)*8:YM=(Y-2-INT((Y-2)/8)*8)

D=2*((XM+YM)<7)+1:T=2*(XM<YM)+1:K=PEEK(1024+X1+Y1*40)

IF (K=105) OR (K=233) THEN X=X+D*Q:Y=Y+D*Q
IF (K=95) OR (K=223)  THEN X=X+T*Q:Y=Y-T*Q
IF (K=230)OR(K=102) THEN PRINT"GAME OVER":END
IF (K=87) THEN GOTO LABEL10
X=X-C:Y=Y-U:POKEV,X:POKEV+1,Y

REM POKE781,0:SYS59903
REM PRINT"{HOME}K:";K;" D:";D;" T:";T

REM MOVE SPRITE


GOTOLABEL120
