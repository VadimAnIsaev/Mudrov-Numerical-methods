{************************************************************
 * ПРОГРАММА 1.2 P
 * МЕТОД ДИХОТОМИИ
 *
 * Поиск корня уравнения в диапазоне найденом,
 * например, в p1_1
 * На входе:
 *	A = 0, B = 1, E = 1E-6
 *	P[1] = 2, P[2] = 1e-7
 * На выходе:
 *	Корень(X) = 0.643857
 ************************************************************}
{$mode objfpc}
Uses Math;
Const
  PI = 3.14159265;

Type
  TParams = ARRAY [1..2] of Double; 

FUNCTION F(X: Double; P: TParams): Double;
VAR 
  R, R1, R2 : Double;
BEGIN 
  R:=1.0; 
  R1:=SQRT(1.0-X);
  WHILE R-R1>P[2] DO 
  BEGIN
    R2:=(R+R1)/2 ; 
    R1:=SQRT(R*R1); 
    R:=R2;
  END;
  F:=(R+R1)*P[1]-PI;
END;

{ Метод дихотомии, деления отрезка пополам }
Function DICH (A, B, E: Real; P: TParams): Double;
VAR 
  I: INTEGER; 
  R, X: Double;
BEGIN
  I:=Sign(F(A, P));
  WHILE (B-A)>E DO 
  BEGIN
    X:=(A+B)/2; 
    R:=F(X, P); 
    IF ABS(R)<P[2] THEN 
      EXIT;
    IF Sign(R)=I THEN 
      A:=X 
    ELSE 
      B:=X;
  END;
  Result:=X;
END;

VAR 
  P: TParams;
  A, B, E : REAL;

BEGIN
  WRITE('Начальная точка (A): '); 
  READLN(A);
  WRITE('Конечная точка (B): '); 
  READLN(B);    
  WRITE('Погрешность (E): '); 
  READLN(E);    
  WRITE('P[1]: '); 
  READLN(P[1]);
  WRITE('P[2]: '); 
  READLN(P[2]);
  WRITELN('Корень = ', DICH(A, B, E, P));
END.
