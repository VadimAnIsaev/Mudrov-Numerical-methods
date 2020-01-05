{****************************************************************************
 * ПРОГРАММА 1.3P
 *
 * МЕТОД ХОРД
 *
 * Поиск корня уравнения в диапазоне, найденом,
 * например, в p1_1
 * На входе:
 *	A = 1, B = 2, E = 1E-6
 *	P[1] = -0.1, P[2] = 1e-7
  * На выходе:
 *	X = 1.3630148
 ****************************************************************************}
{$mode objfpc}
Uses Math;
Type
  TParams = ARRAY [1..2] OF Double; 
  
FUNCTION F(X: Double; P: TParams): Double;
VAR 
  R, Q, Y: Double; 
  K, N: INTEGER;
BEGIN 
  Y:=X; 
  N:=0;
  IF X<10.0 THEN 
  BEGIN 
    N:=ROUND(10.0-X); 
    Y:= X+N;
  END;
  R:=1.0/Y; 
  Q:=R*R;
  R:= LN(Y)-R/2-Q/12.0*(1.0-Q*(0.1+Q/21.0));
  FOR K:=0 TO N-1 DO 
    R:=R-1.0/(X+K);
  F:=R-P[1];
END;

{ Метод хорд }
Function CHORD(A, B, E: Double; P: TParams): Double;
VAR 
  S: INTEGER; 
  F1, F2, R, X1: Double;
BEGIN 
  X1:=A; 
  F1:=F(A, P); 
  S:=Sign(F1); 
  F2:=F(B, P); 
  Result:=B;
  WHILE ABS(Result-X1)>E DO 
  BEGIN
    X1:=Result; 
    Result:=A-(B-A)/(F2-F1)*F1; 
    R:=F(Result, P);
    IF ABS(R)<P[2] THEN 
      EXIT;
    IF Sign(R)=S THEN 
    BEGIN 
      A:=Result; 
      F1:=R; 
    END 
    ELSE
    BEGIN 
      B:=Result; 
      F2:=R; 
    END
  END
END;

VAR 
  P: TParams;
  A, B, E: Double; 
  
BEGIN
  WRITE('Начальная точка (A): '); 
  READLN(A);
  WRITE('Конечная точка (B): '); 
  READLN(B);    
  WRITE('Погрешность (E): '); 
  READLN(E);    
  WRITE(' P[1] : '); 
  READLN(P[1]);
  WRITE(' P[2] : '); 
  READLN(P[2]);  

  WRITELN(' Корень = ', CHORD(A, B, E, P));
END.
