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
VAR 
  P: ARRAY[1..9] OF REAL; 
  X0, X, E: REAL;
  N, K: INTEGER;

FUNCTION F(X: REAL): REAL;
CONST 
  PI = 3.14159265;
VAR 
  Q, R, S, T: Real; 
  K: INTEGER;
BEGIN 
  S:=P[1]; 
  T:=SQRT(2 * X/PI); 
  R:= -X*X*4; 
  K:=ROUND(p[2]);
  IF K = 3 THEN
    T:= X * T;
  REPEAT 
    Q:= S; 
    S:= S - T/K; 
    T:= T * R/((K + 1) * (K + 3)); 
    K:= K + 4;
  UNTIL S=Q;
  F:=S;
End;

{ Метод секущих }
PROCEDURE SECANT(VAR X0, X, E: REAL{; FUNCTION F: REAL});
VAR 
  D,Y,R: REAL;
BEGIN 
  R:=X-X0; 
  D:=F(X0);
  REPEAT 
    Y:= F(X); 
    R:= R/(D-Y) * Y; 
    D:= Y; 
    X:= X + R;
  UNTIL ABS(R)<E;
END;

BEGIN
  WRITE('X0, X, E ? '); 
  READLN(X0, X, E);
  WRITE('СКОЛЬКО ПАРАМЕТРОВ? '); 
  READLN(N);
  FOR K:= 1 TO N DO 
  BEGIN
    WRITE('P(', K:2, ') ? '); 
    READLN(P[K]);
  END;
  SECANT(X0, X, E{, F}); 
  WRITELN('X = ', X);
END.
