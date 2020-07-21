{****************************************************************************
 * ПРОГРАММА 1.3P
 *
 * МЕТОД ХОРД
 *
 * На входе:
 *	A = 1,    начальная точка
 *	B = 2,    конечная точка
 *	E = 1E-6, погрешность
 *	N = 2,    по кол-ву P
 *	P[1] = -0.1, P[2] = 1e-7, параметры исследуемой функции
 * На выходе:
 *	X = 1.3630148
 ****************************************************************************}
VAR 
  P: ARRAY [1..9] OF REAL; 
  A, B, X, E: Real; 
  N, K: INTEGER;

{ Исследуемая функция }
FUNCTION F(X: REAL): REAL;
VAR 
  R, R2, Q, Y: REAL; 
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

{ Знак числа }
FUNCTION SGN(X: REAL): INTEGER;
BEGIN 
  SGN:=0;
  IF X < 0.0 THEN 
    SGN := - 1;
  IF X > 0.0 THEN 
    SGN := 1;
END;

{ Метод хорд }
PROCEDURE CHORD(VAR A, B, X, E, E1: REAL{; FUNCTION F: REAL});
VAR 
  S: INTEGER; 
  F1, F2, R, X1: REAL;
BEGIN 
  X1:=A; 
  F1:=F(A); 
  S:=SGN(F1); 
  F2:=F(B); 
  X:=B;
  WHILE ABS(X-X1)>E DO 
  BEGIN
    X1:=X; 
    X:=A-(B-A)/(F2-F1)*F1; 
    R:=F(X);
    IF ABS(R)<E1 THEN 
      EXIT;
    IF SGN(R)=S THEN 
    BEGIN 
      A:=X; 
      F1:=R; 
    END 
    ELSE
    BEGIN 
      B:=X; 
      F2:=R; 
    END
  END
END;

BEGIN
  WRITE('A, B, E ? '); 
  READLN(A, B, E);
  WRITE('СКОЛЬКО ПАРАМЕТРОВ ? ');
  READLN(N);
  FOR K:=1 TO N DO 
  BEGIN
    WRITE(' P(', K:2, ') ? '); 
    READLN(P[K]);
  end;
  CHORD(A, B, X, E, P[2]{, F});
  WRITELN(' X = ', X);
END.
