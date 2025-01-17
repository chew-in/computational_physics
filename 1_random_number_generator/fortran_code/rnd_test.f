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


      IX=777
C *** THIS IS THE SIZE OF YOUR RANDOM NUMBER SAMPLE (counts/bin)
      RMC=100.*PRECIS

C *** CHOOSE A REASONABLE CONFIDENCE LEVEL TO CALL A BIN "ANOMALOUS"
C *** This will be a function of your number of bins 
      CL=4.      

      OPEN (UNIT=1,FILE='rndtest.out1',STATUS='UNKNOWN')
      OPEN (UNIT=2,FILE='rndtest.out2',STATUS='UNKNOWN')

      DO 14 X=1,RMC
      CALL RANDM(RN1)

C *** JUST IN CASE
      IF(RN1.LT.0.)RN1=0.

      RN1=RN1*PRECIS
      INDEX=INT(RN1)+1

C *** JUST IN CASE
      IF(INDEX.GT.INT(PRECIS))INDEX=INT(PRECIS)

      BINS(INDEX)=BINS(INDEX)+1.
   14 CONTINUE

C *** NOW INSPECT YOUR BINS FOR STATISTICALLY-
C *** SIGNIFICANT DEVIATIONS FROM THE MEAN

      AVERAG=RMC/PRECIS
      STDERR=SQRT(AVERAG)

      WRITE(2,*)"THE EXPECTED AVERAGE OF HITS PER BIN IS ",AVERAG
      WRITE(2,*)"THESE BINS FELL MORE THAN ",CL," STANDAR ERRORS AWAY"
      WRITE(2,*)"BIN#   HITS_IN_BIN   #_OF_SIGMA_AWAY_FROM_MEAN"

      DO 21 J=1,INT(PRECIS)
      DEV=ABS( BINS(J)-AVERAG )/STDERR
      IF(DEV.GE.CL)WRITE(2,*)J,BINS(J),(BINS(J)-AVERAG)/STDERR
   
C *** COMMENT OUT THE NEXT LINE IF PRECIS IS VERY LARGE!
C*** (NOT TO WRITE A HUGE FILE)
c      WRITE(1,*)J,BINS(J),STDERR
   21 CONTINUE
 
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
