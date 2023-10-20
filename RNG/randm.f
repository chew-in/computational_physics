C *** Here we use a subroutine to write 1,000 random numbers to file
C *** IX is the seed for the random number generator

      PROGRAM RANDOM
      COMMON IX
      IX=77777

      OPEN (UNIT=1,FILE='rand.in',STATUS='UNKNOWN')

c      do 35 k=1,10000
c      call randm(rn1)
c   35 continue


      J=1

C *** THIS IS A "DO-UNTIL" STRUCTURE
    7 CALL RANDM(RN1)
      J=J+1
      WRITE(1,*) RN1
      IF(J<1000)GOTO 7

      STOP 
      END

C *** Try to understand how the subroutine works 
C *** (uses arcane ARITHMETIC IF) 
C ************************************************
      SUBROUTINE RANDM(RN1)
      COMMON IX
      IY=IX*6539
      IF(IY)5,6,6
    5 IY=IY+2147483647+1
    6 RN1=IY
      RN1=RN1*.4656613E-9
      IX=IY
      RETURN
      END
C *********************************************
