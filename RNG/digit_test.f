      PROGRAM RNDTEST

      COMMON IX
      DIMENSION BINS(100000)
      INTEGER D1, D2, D3, D4

C *** THIS IS PROP. TO THE "DEPTH" (DECIMAL FIGURES) OF YOUR TEST
C *** MAKE THE DIMENSION ABOVE SAME AS YOUR PRECIS OR ASSUMED (P. 77)
      PRECIS=100000.

C *** INITIALIZE ARRAYS
      DO 35 J=1,INT(PRECIS)
      BINS(J)=0.
   35 CONTINUE

      IX=65539
C *** THIS IS THE SIZE OF YOUR RANDOM NUMBER SAMPLE (counts/bin)
      RMC=100.*PRECIS

      OPEN (UNIT=2,FILE='digit_test.out1',STATUS='UNKNOWN')

      WRITE(2,*) "rand, randm, randu, random_number 3rd digit"

      CALL SRAND(IX)

      DO 14 X=1,5000
C *** Gather all random numbers
      RN1 = RAND()
      CALL RANDM(RN2)
      RN3 = RANDU(IX)
      CALL RANDOM_NUMBER(RN4)
      IND = 3
C *** Set digits
      D1 = INT(RN1 * (10 ** IND)) - INT(RN1 * 10 ** (IND - 1)) * 10
      D2 = INT(RN2 * (10 ** IND)) - INT(RN2 * 10 ** (IND - 1)) * 10
      D3 = INT(RN3 * (10 ** IND)) - INT(RN3 * 10 ** (IND - 1)) * 10
      D4 = INT(RN4 * (10 ** IND)) - INT(RN4 * 10 ** (IND - 1)) * 10

      WRITE(2,*) D1, D2, D3, D4

   14 CONTINUE


      STOP 
      END

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

      FUNCTION RANDU(iseed)
          PARAMETER (IMAX = 2147483647, XMAX_INV = 1./IMAX)
          iseed=iseed*65539
          IF (iseed < 0) iseed = iseed + IMAX + 1
          RANDU = iseed * XMAX_INV
      END
