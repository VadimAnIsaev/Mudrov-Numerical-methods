{****************************************************
 * ПРОГРАММА 1.7P
 * МЕТОД ПРОСТЫХ ИТЕРАЦИЙ
 *
 * На входе:
 *	B = -6
 *	X = 1
 *	E - 1e-6
 *	M = 20
 *	N = 1
 *	P[1] = 0.95
 * На выходе:
 *	X = 1.385903
 ****************************************************}
{$mode objfpc}

FUNCTION F(X, P, B: Double): Double;
CONST PI = 3.14159265;
VAR 
  Q, R, S, T: Double;
  K: INTEGER;
BEGIN 
  T:=2*X/SQRT(PI); 
  S:=T-P;
  R:=-X*X;
  K:=1;
  REPEAT 
    Q:=S; 
    T:=T*R/K; 
    S:= S + T/(2*K+1); 
    K:=K+1;
  UNTIL S=Q;
  Result:=X+B*S;
END;

{ Метод простых итераций }
Function ITER(B, X, E: Double; M: INTEGER; P: Double): Double;
VAR 
  I: INTEGER;
BEGIN
  Result:=X;
  FOR I:=1 TO M DO 
  BEGIN
    X:=Result;
    Result:=F(Result, P, B);
    IF ABS(Result - X)<E THEN 
      EXIT;
    IF I = M THEN 
      WRITELN('ИТЕРАЦИИ BCE');
  END;
END;

VAR 
  P: Double; 
  B, X, E: Double;
  M: Integer;

BEGIN
  WRITE('Константа (B): '); 
  READLN(B);
  WRITE('Начальное приближение к корню (X): '); 
  READLN(X);
  WRITE('Погрешность (E): '); 
  READLN(E);
  WRITE('Максимальное количество итераций (M): '); 
  READLN(M);
  WRITE(' P[1]: '); 
  READLN(P);
  
  WRITELN('Корень = ', ITER(B, X, E, M, P));
END.
