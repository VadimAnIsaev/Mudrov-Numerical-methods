{*****************************************************
 * ПРОГРАММА 1.6P
 *
 * МЕТОД СЕКУШИХ
 *
 * На входе:
 *	X0 = 0.2 X = 0.6 E = 1e-6
 *	N = 2
 *	P[1] = 0.1818
 *	P[2] = 3
 * На выходе:
 *	X = 0.8000561
 *****************************************************}
{$mode objfpc}
Type
  TParams = ARRAY[1..2] OF Double; 

FUNCTION F(X: Double; P: TParams): Double;
CONST 
  PI = 3.14159265;
VAR 
  Q, R, T: Double; 
  K: INTEGER;
BEGIN 
  Result:=P[1]; 
  T:=SQRT(2 * X/PI); 
  R:= -X*X*4; 
  K:=ROUND(P[2]);
  IF K = 3 THEN
    T:= X * T;
  REPEAT 
    Q:= Result; 
    Result:= Result - T/K; 
    T:= T * R/((K + 1) * (K + 3)); 
    K:= K + 4;
  UNTIL Result=Q;
End;

{ Метод секущих }
Function SECANT(X0, X, E: Double; P: TParams): Double;
VAR 
  D,Y,R: Double;
BEGIN 
  R:=X-X0; 
  D:=F(X0, P);
  REPEAT 
    Y:= F(X, P); 
    R:= R/(D-Y) * Y; 
    D:= Y; 
    X:= X + R;
  UNTIL ABS(R)<E;
  Result:=X;
END;

VAR 
  P: TParams;
  X0, X, E: Double;

BEGIN
  WRITE('Начальная точка (X0): '); 
  READLN(X0);
  WRITE('Конечная точка (X): '); 
  READLN(X);
  WRITE('Погрешность (E): '); 
  READLN(E);
  WRITE('P[1]: '); 
  READLN(P[1]);
  WRITE('P[2]: '); 
  READLN(P[2]);
  
  WRITELN('Корень (X) = ', SECANT(X0, X, E, P));
END.
