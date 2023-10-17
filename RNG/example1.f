      PROGRAM EXAMPLE1

C *** our first look at a FORTRAN program. It illustrates the use of 
C *** DO-loops

C *** this is a comment line, the asterisks are just to help the eye,
C *** it is the "C" in the first column that does the trick

C *** Here we define a one-dimensional array or vector of 100 elements.
C *** each is an integer

      INtEGER A(100),B23(100)

C *** Here we open an output file
C *** remember unix is case-sensitive!!!

      OPEN(UNIT=1,FILE='expl1.out',STATUS='UNKNOWN')  

C *** We load the numbers 1 to 100 into the array, and taking advantage 
C *** of the DO-loop, print them to the file 

      DO 7 J=1,100
      A(J)=J
      B23(J)=J-1
      WRITE(1,*)A(J),B23(J)
c      write(1,*)j,j-1
    7 CONTINUE

C *** The line above is called a "tame" label (it is just a flag, a
C *** pointer in the logic flow)

      WRITE(1,*)" and now backwards, skipping odd numbers"
      DO 14 J=100,1,-2
      WRITE(1,*) A(J)
   14 CONTINUE

C *** Could I have just  written "WRITE(7,*) J" two lines above? YES!

C *** An example of interaction with the user:

      WRITE(*,*)"Provide me with three numbers to print last"
      READ(*,*) X1,X2,X3
      WRITE(1,*) X1,X2,X3

      STOP 
      END
