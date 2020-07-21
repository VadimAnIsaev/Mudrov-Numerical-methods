{****************************************************
 * ПРОГРАММА 1.7P
 * МЕТОД ПРОСТЫХ ИТЕРАЦИЙ
 *
 * На входе:
 *	B = -6,    произвольная константа
 *	X =  1,    начальное приблежение к корню
 *	E -  1e-6, погрешность
 *	M =  20,   максимальное число итераций
 *	N =  1,    количество параметров, по количеству ячеек P
 *	P[1] = 0.95
 * На выходе:
 *	X = 1.385903
 ****************************************************}
VAR 
  P: ARRAY [1..9] OF REAL; 
  B, X, E: REAL;
  M, N, K: Integer;

{ Исследуемая функция }
FUNCTION F(X: REAL): REAL;
CONST PI = 3.14159265;
VAR 
  Q, R, S, T: REAL;
  K: INTEGER;
BEGIN 
  T:=2*X/SQRT(PI); 
  S:=T-P[1];
  R:=-X*X;
  K:=1;
  REPEAT 
    Q:=S; 
    T:=T*R/K; 
    S:= S + T/(2*K+1); 
    K:=K+1;
  UNTIL S=Q;
  F:=X+B*S;
END;

{ Метод простых итераций }
PROCEDURE ITER(VAR B, X, E: REAL; M: INTEGER{; FUNCTION F: REAL});
VAR 
  X1, R: REAL; 
  I: INTEGER;
BEGIN
  FOR I:=1 TO M DO 
  BEGIN
    X1:=X; 
    X:=F(X);
    writeln(X);
    IF ABS(X - X1)<E THEN 
      EXIT;
    IF I = M THEN 
      WRITELN('ИТЕРАЦИИ BCE');
  END
END;

BEGIN
  WRiTE('B, X, E, M ? '); 
  READLN(B, X, E, M);
  WRITE('СКОЛЬКО ПАРАМЕТРОВ ? '); 
  READLN(N);
  FOR K:= 1 TO N DO 
  BEGIN
    WRITE(' P(', K:2, ') ? '); 
    READLN(P[K]);
  END;
  ITER(B, X, E, M{, F}); 
  WRITELN('X = ', X);
END.
