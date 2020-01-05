{************************************************************
 * ПРОГРАММА 1.4P
 * МЕТОД НЬЮТОНА
 *
 * На примере уравнения Валлиса. x^3 - 2*x -5 = 0
 * На входе:
 *	X = 0 (приближённое значение к ответу. Чем ближе к ответу, тем быстрее считает)
 *	E = 1e-5 или 1e-6
 *	N = 4
 *	P[1] = 1
 *	P[2] = 0
 *	P[3] = -2
 *	P[4] = -5
 * На выходе:
 *	X = 2.09455
 ************************************************************}
{$mode objfpc}
Type
  TParams = ARRAY [1..4] of Double;
  
FUNCTION F(X: Double; P: TParams): Double;
VAR 
  Q, R: Double;
  I: Integer;
BEGIN 
  Q:=P[1];
  R:=0.0;
  FOR I:=2 TO 4 DO 
  BEGIN
    R:=Q+X*R; 
    Q:=P[I]+X*Q;
  End;
  F:=Q/R;
END;

{ Метод Ньютона }
Function NEWTON(X, E: Double; P: TParams): Double;
VAR
  F1: Double;
BEGIN
  Result:=X;
  REPEAT
    F1:=F(Result, P); 
    Result:=Result-F1;
  UNTIL ABS(F1)<E;
END;

VAR 
  P: TParams;
  X, E: Double;
  I: Integer;

BEGIN
  WRITE('Начальное приближение (X): '); 
  READLN(X);
  WRITE('Погрешность (E): '); 
  READLN(E);
  FOR I:=1 to 4 DO 
  BEGIN
    WRITE('P[', I:1, ']: '); 
    READLN(P[I]);
  End;
  
  WRITELN('X = ', NEWTON(X, E, P));
END.
