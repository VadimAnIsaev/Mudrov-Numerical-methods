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
VAR 
  P: ARRAY [1..9] of REAL;
  X, E: REAL;
  K, N: Integer;
  
FUNCTION F(X:REAL): REAL;
VAR 
  Q, R: REAL;
BEGIN 
  Q:=P[1]; 
  R:=0.0;
  FOR K:=2 TO N DO 
  BEGIN
    R:=Q+X*R; 
    Q:=P[K]+X*Q;
  End;
  F:=Q/R;
END;

PROCEDURE NEWTON(VAR X, E: REAL{; FUNCTION F: REAL});
VAR
  F1: REAL;
BEGIN
  REPEAT
    F1:=F(X); 
    X:=X-F1;
  UNTIL ABS(F1)<E;
END;

BEGIN
  WRITE('X, E ? '); 
  READLN(X, E);
  WRITE('СКОЛЬКО ПАРАМЕТРОВ ? ');
  READLN(N);
  FOR K:=1 to N DO 
  BEGIN
    WRITE('P(', K:2, ') ? '); 
    READLN(P[K]);
  End;
  NEWTON(X, E{, F});
  WRITELN('X = ', X);
END.
