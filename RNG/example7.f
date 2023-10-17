      PROGRAM EXAMPLE1
      DIMENSION ARRAY(100)
      OPEN(UNIT=1,FILE='badtrouble.out',STATUS='UNKNOWN')
      
c *** Some boob-boos are acceptable during runtime... (depends on 
c *** compiler)
      DO 7 Y=100.,-100.,-1.

      X=SQRT(Y)/Y
      WRITE(1,*)INT(Y),X

    7 CONTINUE

c *** some are not... uncomment this block, compile and run    
      DO 17 Y=100.,-100.,-1.

      X=SQRT(Y)/Y
      ARRAY(INT(EXP(Y)))=X
      WRITE(1,*)INT(Y),ARRAY(INT(Y))

   17 CONTINUE


      STOP 
      END
