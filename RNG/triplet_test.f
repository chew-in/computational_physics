      PROGRAM RNDTEST

      COMMON IX
      DIMENSION BINS(100000)
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

C *** CHOOSE A REASONABLE CONFIDENCE LEVEL TO CALL A BIN "ANOMALOUS"
C *** This will be a function of your number of bins 
      CL=4.      

      OPEN (UNIT=2,FILE='triplet_test_2.out1',STATUS='UNKNOWN')

C      CALL SRAND(IX)

      DO 14 X=1,1000
C *** Testing RANDU
C      RN1 = RANDU(IX)
C      RN2 = RANDU(IX)
C      RN3 = RANDU(IX)
C      WRITE(1,*) RN1, RN2, RN3
C *** Testign RANDOM_NUMBER
      CALL RANDOM_NUMBER(RN1)
      CALL RANDOM_NUMBER(RN2)
      CALL RANDOM_NUMBER(RN3)
      WRITE(2,*) RN1, RN2, RN3


C *** JUST IN CASE
C      IF(RN1.LT.0.)RN1=0.

C      RN1=RN1*PRECIS
C      INDEX=INT(RN1)+1

C *** JUST IN CASE
C      IF(INDEX.GT.INT(PRECIS))INDEX=INT(PRECIS)

C      BINS(INDEX)=BINS(INDEX)+1.
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
