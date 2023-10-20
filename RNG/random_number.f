C *** Here we use a function to write 1,000 random numbers to file
C *** IX is the seed for the random number generator

      PROGRAM RANDOM
      COMMON IX
      REAL :: random_value

      IX=77777

      OPEN (UNIT=1,FILE='rand.in',STATUS='UNKNOWN')

      J=1

C *** THIS IS A "DO-UNTIL" STRUCTURE
    7 J=J+1
      CALL RANDOM_NUMBER(random_value)
      WRITE(1,*) random_value
      IF(J<1000)GOTO 7

      STOP 
      END
 
C ************************************************
C *********************************************
