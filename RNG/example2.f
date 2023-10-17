      PROGRAM EXAMPLE2

C *** Here we experiment with IF structures 

      OPEN(UNIT=1,FILE='expl2.out.1',STATUS='UNKNOWN') 
      OPEN(UNIT=2,FILE='expl2.out.2',STATUS='UNKNOWN')

      WRITE(1,*)"Write even numbers and an asterisk instead of odd" 

      DO 7 J=1,100
      HALF=REAL(J)/2.

C *** Your first encounter with an intrinsic function (ch 6),
C *** relational expression (p 56) and control statement 
C *** (IF block (p. 61))

      IF( INT(HALF)-HALF .NE. 0.) THEN
      WRITE(1,*) "*"
      ELSE
      WRITE(1,*) J
      ENDIF

C *** That was risky, normally you should not mix integers and reals!

    7 CONTINUE

C *** Practice with other relational and logical operators:


      DO 14 ALPHA=1.,1000.,10.

c *** can we do this? NO!
c      alpha=alpha-1.

      IF((ALPHA.LT.500.).AND.(ALPHA.GT.400.).AND.(ALPHA.LE.450.))THEN
      WRITE(2,*)alpha,  ALPHA/10.
      ELSE IF(ALPHA.GE.700.)THEN
      WRITE(2,*)alpha,  ALPHA/10.
      ELSE
      GOTO 14
      ENDIF

c *** is the last condition necessary?

   14 CONTINUE

      STOP 
      END
