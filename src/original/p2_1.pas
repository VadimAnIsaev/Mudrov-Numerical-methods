{*********************************************
 * ПРОГРАММА 2.1P
 *
 * МЕТОД ГАУССА ДЛЯ СЛАУ
 * (расширенная матрица, коэффициенты и правые части в одной матрице)
 *
 * На входе:
 *	N = 3 (кол-во уравнений)
 *		1 -3  2 7
 *		4  6  1 3
 *		2  1 -2 -1
 * На выходе:
 *	X1 = 1.4915 X2 = -0.7627 X3 = 1.61
 *********************************************}
TYPE 
  MAT = ARRAY[1..20, 1..21] OF REAL;
  VEC = ARRAY[1..20] OF REAL;
VAR 
  A: MAT;
  X: VEC;
  I, N: INTEGER;
  S: REAL;
  
PROCEDURE MATR(N: INTEGER; VAR A: MAT);
VAR 
  I,J: INTEGER;
BEGIN 
  FOR I:=1 TO N DO
    FOR J:=1 TO N+1 DO 
    BEGIN
      WRITE('A', I:2, J:2, ' ? '); 
      READLN(A[I,J]);
    END
END;

{ Метод Гаусса }
PROCEDURE GAUSS(N: INTEGER; VAR A: MAT; VAR X: VEC; VAR S: REAL);
VAR 
  I,J,K,L,K1,N1: INTEGER;
  R: REAL;
BEGIN 
  N1:=N+1;
  FOR K:=1 TO N DO 
  BEGIN 
    K1:=K+1; 
    S:=A[K,K]; 
    J:=K;
    FOR I:=K1 TO N DO 
    BEGIN 
      R:=A[I,K];
      IF ABS(R) > ABS(S) THEN 
      BEGIN 
        S:=R; 
        J:=I; 
      END;
    END;
    IF s=0.0 THEN 
      exit;
    IF J<>K THEN 
      FOR I:= K TO N1 DO 
      BEGIN
        R:=A[K,I]; 
        A[K,I]:=A[J,I]; 
        A[J,I]:=R; 
      END;
      FOR J:=K1 TO N1 DO 
        A[K,J]:=A[K,J]/S;
      FOR I:=K1 TO N DO 
      BEGIN 
        R:=A[I,K];
        FOR J:=K1 TO N1 DO 
          A[I,J]:=A[I,J]-A[K,J]*R;
      END;
  END;
  IF S<>0.0 THEN
    FOR I:=N DOWNTO 1 DO 
    BEGIN 
      S:=A[I,N1];
      FOR J:=I+1 TO N DO 
        S:=S-A[I,J]*X[J];
      X[I]:=S;
    END;
END;

BEGIN
  REPEAT 
    WRITE('N ? '); 
    READLN(N); 
    MATR(N,A); 
    GAUSS(N, A, X, S);
    IF S<>0.0 THEN 
      FOR I:=1 TO N DO 
        WRITELN('X', I:2, ' = ', X[I])
      ELSE 
        WRITELN('DET = 0 ');
  UNTIL FALSE;
END.
