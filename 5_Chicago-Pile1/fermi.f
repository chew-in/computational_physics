C *** FIND OPTIMAL DISTANCE FOR MODERATION OF FISSION NEUTRONS
C *** IN A GRAPHITE PLATE (INFINITE ALONG X AND Y COORDINATES).
C *** WE NEGLECT THE EFFECT OF THE VELOCITY OF THE TARGET NUCLEI
C *** AND CALL "EPITHERMAL" ANY NEUTRON ENERGY BELOW 500 EV
! ********************************************************      
      PROGRAM FERMI
      COMMON IX,ANUMBE
      DIMENSION ENEOUT(100)
      IX=77777

C *** THESE ARE THE COUNTERS FOR TRANSMITTED, BACKSCATTERED,
C     ABSORBED AND THERMALIZED NEUTRONS
      TRANSM=0.
      BACKSC=0.
      ABSORB=0.
      THERMA=0.

C *** INITIALIZE THE SPECTRUM OF TRANSMITTED ENERGIES (100 KEV BINS)
      DO 7 J=1,100
      ENEOUT(J)=0.
    7 CONTINUE

C *** SIZE OF MONTE CARLO
      RMC=1.E4
C *** THICKNESS OF GRAPHITE PLATE (CM) 
C      D=20.0
      WRITE(*,*)"THICKNESS IN CM?"
      READ(*,*)D
C *** DENSITY OF GRAPHITE (G/CM^3), MASS NUMBER AND AVOGADRO'S NUMBER
      DENSIT=2.1
      ANUMBE=12.
      AVOGAD=6.02E23
      
      OPEN(UNIT=1,FILE='fermi.out',STATUS='unknown')

C *** FOLLOW EACH NEUTRON UNTIL IT EXITS OR IS ABSORBED
C *** THE SOURCE IS AT THE ORIGIN OF COORDINATES
      DO 14 RX=1.,RMC
      X=0.
      Y=0.
      Z=0.

C *** DETERMINE INITIAL ENERGY IN MEV
      CALL ENERGY(ENE)

C *** DETERMINE ENTRY (ZENITH) ANGLE ALONG Z DIRECTION (INTO THE PLATE)
C *** THIS IS A SPECIAL CASE FOR EMISSION, TO SELECT INGOING TRAJECTORIES ONLY
      CALL RANDM(RN1)

      ANGL=ACOS(RN1)


C *** SELECT AZIMUTHAL ANGLE
      CALL RANDM(RN1)
      AZIM=2.*3.14159*RN1

C *** BUILD THE COMPONENTS OF THE UNIT VELOCITY VECTOR IN THE FLIGHT DIRECTION
      VX=SIN(ANGL)*COS(AZIM)
      VY=SIN(ANGL)*SIN(AZIM)
      VZ=COS(ANGL)

C *** DOES THE NEUTRON INTERACT? CALCULATE DISTANCE (CM) TO NEXT INTERACTION
   21 CALL XSECT(ENE,XELAST,XABSOR)
      XTOTAL=XELAST+XABSOR
      CALL RANDM(RN1)
      DNEXT=(-LOG(RN1)*ANUMBE)/(XTOTAL*DENSIT*AVOGAD)

C *** CALCULATE NEW POSITION
      X=X+(VX*DNEXT)
      Y=Y+(VY*DNEXT)   
      Z=Z+(VZ*DNEXT)

C *** HAS IT BEEN BACKSCATTERED?
      IF(Z.LT.0.)THEN
      BACKSC=BACKSC+1.
      GOTO 14
      ENDIF

C *** HAS IT CROSSED THE PLATE?
      IF(Z.GT.D)THEN
      TRANSM=TRANSM+1.
      INDEX=INT(ENE*10.)+1
      ENEOUT(INDEX)=ENEOUT(INDEX)+1.
C *** HERE WE CALL "EPITHERMAL" ANY NEUTRON ENERGY BELOW 500 EV
      IF(ENE.LT.5.E-4)THERMA=THERMA+1.
      GOTO 14
      ENDIF

C *** HAS IT BEEN CAPTURED?
      RATIO=XABSOR/XTOTAL
      CALL RANDM(RN1)
      IF(RN1.LT.RATIO)THEN
      ABSORB=ABSORB+1.
      GOTO 14
      ENDIF
      
C *** IF WE GET TO THIS POINT THE NEUTRON IS STILL INSIDE THE PLATE
C *** CALCULATE ENERGY LOSS IN COLLISION AND SCATTERING ANGLE
      CALL ELOSS(ENE,ANGL,ENEAFT)
      ENE=ENEAFT

C *** FIND THE NEW TRAJECTORY
      CALL EULER(VX,VY,VZ,ANGL,SX,SY,SZ)
      VX=SX
      VY=SY
      VZ=SZ
      GOTO 21

   14 CONTINUE

      FIX=100./RMC
      WRITE(1,*)"D %TRANSM. %BACKSCAT. %ABSORB. %THERMA"
      WRITE(1,*)D,FIX*TRANSM,FIX*BACKSC,FIX*ABSORB,FIX*THERMA
      WRITE(1,*)"E(MEV) P(E)DE"
      DO 35 G=1.,100.
      WRITE(1,*)G/10.,ENEOUT(INT(G))
   35 CONTINUE
      STOP
      END      
C ************************************************
      SUBROUTINE ELOSS(ENE,ANGL,ENEAFT)
      COMMON IX,ANUMBE
C *** CALCULATE ENERGY LOSS IN COLLISION, USE ISOTROPIC (S-WAVE) 
C *** APPROXIMATION. ROUND UP ANY ENERGY BELOW 0.1 EV TO 0.02 EV (THERMAL)
      IF(ENE.LT.1.E-7)THEN
      ENEAFT=2.E-8
      ELSE
C *** THIS IS THE MAXIMUM RECOIL ENERGY THAT CAN BE IMPARTED
      EREMAX=((4.*ANUMBE)/((1.+ANUMBE)**2.))*ENE
      CALL RANDM(RN1)
C *** THE PROBABILITY DISTRIBUTION FOR RECOIL ENERGIES IS FLAT
C *** FROM ZERO UP TO THE MAXIMUM 
      EREMAX=EREMAX*RN1
      ENEAFT=ENE-EREMAX
      ENDIF

      IF(ENE.LT.1.E-7)THEN
      CALL RANDM(RN1)
      ANGL=ACOS((2.*RN1)-1.)
      ELSE
      ETA=ACOS(SQRT((EREMAX/ENE)*(((1.+ANUMBE)**2.)/(4.*ANUMBE))))
      ANGL=ATAN((SIN(2.*ETA))/((1./ANUMBE)-COS(2.*ETA)))
      ENDIF
      
      RETURN
      END
C ************************************************
      SUBROUTINE ENERGY(ENE)
      COMMON IX
C *** USE VON NEUMANN'S METHOD ("HIT AND MISS") TO CALCULATE THE 
C *** ENERGY OF THE NEUTRON EMITED FROM A FISSION SOURCE.
   7  CALL RANDM(RN1)
C *** P=0 ABOVE ~10 MEV
      RN1=RN1*9.999
C *** APPLY MAXWELL SPECTRUM
      PROB=SQRT(RN1)*EXP(-RN1/1.4)
      CALL RANDM(RN2)
C *** THE MAXIMUM OF THE DISTRIBUTION AS WRITTEN IS LESS THAN 0.5 
      RN2=RN2*0.5
      IF(RN2.GT.PROB)GOTO 7    
      ENE=RN1   
      RETURN
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
C ************************************************
      SUBROUTINE XSECT(ENE,XELAST,XABSOR)
C *** RETURNS THE APPROXIMATE CROSS SECTIONS (BARNS) FOR ABSORPTION AND 
C *** ELASTIC SCATTERING IN CARBON.
C *** HERE WE NEED THE ENERGY IN EV, NOT MEV
      X=ENE*1.E6

C *** CHECK THESE APPROXIMATIONS VS THE PLOTS IN THE HANDOUTS
      IF(X.LT.1.E4)THEN
      XELAST=5.
      ELSE
      XELAST=10.5-(1.346*LOG10(X))
      ENDIF
      XELAST=XELAST*1.E-24

      IF(X.LT.1.E3)THEN
      XABSOR=(6.442E-4)*(X**(-0.49421))
      ELSE IF(X.LT.1.E5) THEN
      XABSOR=1.5E-5
      ELSE IF(X.LT.5.E6) THEN
      XABSOR=2.E-5
      ELSE
      XABSOR=(4.E-06)*EXP(X*3.2189E-07) 
      ENDIF
      XABSOR=XABSOR*1.E-24
      RETURN
      END
C*************************************************
      SUBROUTINE EULER(EX,EY,EZ,ANGL,SX,SY,SZ)
C     THIS SUBROUTINE TAKES THE ORIGINAL LINEAR TRAJECTORY,
C     ROTATES IT TO LIE ALONG THE Z-AXIS, GENERATES A VECTOR
C     AT ZENITH ANGLE THETA = SCATTERING ANGLE 
C     AND AZIMUTHAL ANGLE FI = RANDOM * 2PI. THE
C     ORIGINAL AXIS IS NOW ROTATED BACK TAKING THE SCATTERING
C     VECTOR WITH IT. NOW WE HAVE THE SCATTERED
C     DIRECTION VECTOR (SX,SY,SZ).
C     WE USE EULER ANGLES TO PERFORM THE TRANSFORMATION.
      COMMON IX
C *** NORMALIZE THE DIRECTION TO A UNIT VECTOR (IN CASE IT WASN'T)
      S=SQRT(EX**2+EY**2+EZ**2)
      EX=EX/S
      EY=EY/S
      EZ=EZ/S
      BET=ACOS(EZ)
C *** THESE APPROXIMATIONS ARE ONLY NEEDED FOR COMPTON SCATTERING 
C *** FOR GAMMAS (BUT THEY WILL NOT HURT HERE)
      IF(ABS(BET).LT.0.027)ALF=0.0
      IF(ABS(BET).LT.0.027)GO TO 44
      ARG=EY/SIN(BET)
      AARG=ABS(ARG)
      IF(AARG.LT.1.0)GOTO 344
      ARG=ARG/(1.0001*AARG)
344   ALF=ASIN(ARG)
 44   CONTINUE
      SCO1=COS(ALF)*SIN(BET)+EX
      SCO1=ABS(SCO1)
      SCO2=ABS(EX)
      IF(SCO1.LT.SCO2)BET=-BET
      IF(SCO1.LT.SCO2)ALF=-ALF
      GAM=0.0
C     WE NOW HAVE THE EULER ANGLES OF ROTATION BETWEEN
C     Z-AXIS TO DIRECTION OF INITIAL PARTICLE.
      THET = ANGL
      CALL RANDM(RN1)
      FI = 6.2831853 * RN1
C     WE NOW HAVE SCATTERED THE PARTICLE FROM THE
C     Z-AXIS AND MUST ROTATE IT TO THE ORIGINAL UNSCATTERED
C     PARTICLE DIRECTION. CACULATE THE ROTATION MATRIX.
      R11 = COS(ALF)*COS(BET)*COS(GAM)-SIN(ALF)*SIN(GAM)
      R12 = COS(BET)*SIN(ALF)*COS(GAM)+COS(ALF)*SIN(GAM)
      R13 =-SIN(BET)*COS(GAM)
      R21 =-SIN(GAM)*COS(BET)*COS(ALF)-SIN(ALF)*COS(GAM)
      R22 =-SIN(GAM)*COS(BET)*SIN(ALF)+COS(ALF)*COS(GAM)
      R23 = SIN(BET)*SIN(GAM)
      R31 = SIN(BET)*COS(ALF)
      R32 = SIN(ALF)*SIN(BET)
      R33 = COS(BET)
      SOX = SIN(THET)*COS(FI)
      SOY = SIN(THET)*SIN(FI)
      SOZ = COS(THET)
      SX =  R11*SOX+R21*SOY+R31*SOZ
      SY =  R12*SOX+R22*SOY+R32*SOZ
      SZ =  R13*SOX+R23*SOY+R33*SOZ
C     WE NOW HAVE THE UNIT PROPAGATION VECTOR OF THE
C     SCATTERED PARTICLE IN THE *ORIGINAL* FRAME.
      RETURN
      END
C ************************************************