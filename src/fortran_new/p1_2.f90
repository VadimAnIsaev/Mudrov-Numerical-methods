!************************************************************
!  ПРОГРАММА 1.2F
!  МЕТОД ДИХОТОМИИ
! 
!  Поиск корня уравнения в диапазоне найденом,
!  например, в p1_1
!  На входе:
! 	A = 0, B = 1, E = 1E-6
! 	P[1] = 2, P[2] = 1e-7
!  На выходе:
! 	Корень(X) = 0.643857
!************************************************************
Program p1_2


Real(8),parameter :: PI = 3.14159265

Real(8),dimension(2) :: P
Real(8) :: A, B, E

PRINT *, 'Начальная точка (A): '
READ (*,*) A
PRINT *, 'Конечная точка (B): ' 
READ (*,*) B
PRINT *, 'Погрешность (E): '
READ (*,*) E
PRINT *, 'P(1): '
READ (*,*) P(1)
PRINT *, 'P(2): ' 
READ (*,*) P(2)

PRINT *,'Корень = ', DICH(A, B, E, P)

Contains

Real(8) FUNCTION F(X, P)

Real(8),dimension(2),intent(in) :: P
Real(8),intent(in) :: X

Real(8) :: R, R1, R2
 
R=1.0 
R1=SQRT(1.0-X)

DO 
  IF (R-R1<=P(2)) THEN
    Exit
  END IF

  R2=(R+R1)/2  
  R1=SQRT(R*R1) 
  R=R2
END DO

F=(R+R1)*P(1)-PI

End function F

! Метод дихотомии, деления отрезка пополам
REAL(8) Function DICH (A, B, E, P)
 
Real(8),dimension(2),intent(in) :: P
Real(8) :: A, B, E

Integer :: I
Real(8) :: R, X

I=Sign(1.0_8, F(A, P))
DO 
  IF ((B-A)<=E) THEN
    EXIT
  END IF
  X=(A+B)/2 
  R=F(X, P) 
  IF (ABS(R)<P(2)) THEN 
    EXIT
  END IF
  IF (Sign(1.0_8,R)==I) THEN 
    A=X 
  ELSE 
    B=X
  END IF
END DO

DICH=X

End function DICH

End program p1_2
