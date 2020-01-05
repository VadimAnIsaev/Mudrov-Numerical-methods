!*********************************************
!  ПРОГРАММА 1.1F
!  ТАБЛИЧНЫЙ МЕТОД ОТДЕЛЕНИЯ КОРНЕЙ
! 
!  На примере функции Бесселя первого рода.
!  Входные параметры:
! 	P(1) - порядок функции Бесселя;
! 	P(2) - допустимая погрешность вычисления ряда;
! 	X0, X9 - интервал;
! 	H - шаг.
!*********************************************
Program p1_1

Real(8),dimension(2) :: P
Real(8) :: X, X0, X9, H

PRINT *, 'Начальная точка (X0): '
READ (*,*) X0
PRINT *, 'Конечная точка (X9): '
READ (*,*) X9
PRINT *, 'Шаг: '
Read (*,*) H
PRINT *, 'Порядок функции Бесселя: '
READ (*,*) P(1)
PRINT *, 'Погрешность вычисления ряда: '
READ (*,*) P(2)
X=X0
DO 
  IF (X>X9) THEN
    Exit
  END IF
    
  PRINT *, X, F(X, P)
  X=X+H
END DO

Contains

Real(8) Function F(X, P)

Real(8),dimension(2),intent(in) :: P
Real(8),intent(in) :: X

Real(8) :: R, T
Integer :: N, I

R=X/2 
T=1.0 
N=INT(P(1))
DO I=1, N
  T=T*R/I
END DO
I=1 
R=-R*R
F=T
DO 
  IF (ABS(T)<=P(2)) THEN
    Exit
  END IF
  T=T*R/(I*(I+N)) 
  F=F+T
  I=I+1
END DO

End Function F

End program p1_1
