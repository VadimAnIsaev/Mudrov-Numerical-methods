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
 *	X = 0.643857
 ************************************************************}
VAR 
  P: ARRAY [1 .. 9]  OF REAL; 
  A, B, X, E : REAL;
  N, K: integer;

FUNCTION F(X: REAL): REAL;
VAR 
  R, R1, R2 : REAL;
BEGIN 
  R:=1.0; 
  R1:=SQRT(1.0-X);
  WHILE R-R1>P[2] DO 
  BEGIN
    R2:=(R+R1)/2 ; 
    R1:=SQRT(R*R1); 
    R:=R2;
  END;
  F:=(R+R1)*P[1]-3.14159265;
END;

FUNCTION SGN(X: REAL ): INTEGER;
BEGIN 
  SGN:=0;
  IF X<0.0 THEN 
    SGN:=-1;
  IF X>0.0 THEN 
    SGN:=1;
END;

PROCEDURE DICH (VAR A, B, X, E, E1: REAL{; FUNCTION F : REAL} );
VAR 
  I: INTEGER; 
  R: REAL;
BEGIN
  I:=SGN(F(A));
  WHILE (B-A)>E DO 
  BEGIN
    X:=(A+B)/2; 
    R:=F(X); 
    IF ABS(R)<E1 THEN 
      EXIT;
    IF SGN(R)=I THEN 
      A:=X 
    ELSE 
      B:=X;
  END
END;

BEGIN
  REPEAT 
    WRITE('A, B, E ? '); 
    READLN(A, B, E);
    WRITE( 'СКОЛЬКО ПАРАМЕТРОВ ? '); 
    READLN(N);
    FOR K := 1 TO N DO 
    BEGIN
      WRITE('P(', K:1, ') ? '); 
      READLN(P[K]);
    END;
    DICH(A, B, X, E, P[2]{, F});
    WRITELN('X = ', X);
  UNTIL FALSE;
END.
