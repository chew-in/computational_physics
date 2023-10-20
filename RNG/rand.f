C *** Same number, using the standar random number generator (syntax 
C *** varies from one compiler from another)
C *** RAND is an implicit FUNCTION

      PROGRAM RANDOM

      OPEN (UNIT=1,FILE="rand.in",STATUS='unknown')

      J=1

c *** This is an example of DO UNTIL

      call srand(77977)

c *** see http://gcc.gnu.org/onlinedocs/gcc-4.1.2/gfortran/RAND.html
c *** for instructions on how to change the "seed"

    7 RN1=RAND()
      J=J+1
      WRITE(1,*) RN1
      IF(J<1000)GOTO 7
 
      STOP 
      END

