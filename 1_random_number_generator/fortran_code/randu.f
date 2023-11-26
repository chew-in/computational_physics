C *** Here we use a function to write 1,000 random numbers to file
C *** IX is the seed for the random number generator

      PROGRAM RANDOM
      COMMON IX
      IX=77777

      OPEN (UNIT=1,FILE='rand.in',STATUS='UNKNOWN')

c      do 35 k=1,10000
c      randu(IX)
c   35 continue


      J=1

C *** THIS IS A "DO-UNTIL" STRUCTURE
    7 J=J+1
      WRITE(1,*) RANDU(IX)
      IF(J<1000)GOTO 7

      STOP 
      END
 
C ************************************************
      FUNCTION RANDU(iseed)
          PARAMETER (IMAX = 2147483647, XMAX_INV = 1./IMAX)
          iseed=iseed*65539
          IF (iseed < 0) iseed = iseed + IMAX + 1
          RANDU = iseed * XMAX_INV
      END
C *********************************************
