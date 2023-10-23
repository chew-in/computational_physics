       PROGRAM EXAMPLE5
C *** Here we read a file containing random numbers and sort them
C *** using straight insertion (CPU expensive!)

C *** SOME BIG NUMBER (PRETEND YOU DO NOT KNOW THE SIZE OF THE FILE)
C *** SEE ALSO DISCUSSION OF ASSUMED-SIZE ARRAYS IN P. 77 OF C.G.PAGE'S 

      DIMENSION ARR(100000)

      OPEN (UNIT=1,FILE='list.in',STATUS='UNKNOWN')
      OPEN (UNIT=2,FILE='list_sorted.out',STATUS='UNKNOWN')
      N=0

C *** REMEMBER, ARRAY INDEXES START WITH 1, NOT 0
    7 N=N+1
      READ(1,*,END=14)ARR(N)
      GOTO 7
   14 CONTINUE

      n=n-1

      CALL PIKSRT(N,ARR)

      DO 21 J=1,N
      WRITE(2,*)ARR(J)
   21 CONTINUE
 
      STOP 
      END

C ************************************************
      SUBROUTINE PIKSRT(N,ARR)
C *** SEE 'ADJUSTABLE ARRAYS" IN P. 77
      DIMENSION ARR(N)

      DO 12 J=2,N
      A=ARR(J)

      DO 11 I=J-1,1,-1
      IF(ARR(I).LT.A) GOTO 10
      ARR(I+1)=ARR(I)
   11 CONTINUE

      I=0
   10 ARR(I+1)=A

      write(*,*)arr(1),arr(2),arr(3),arr(4),arr(5),arr(6),arr(7)

   12 CONTINUE
      RETURN
      END
C *********************************************
