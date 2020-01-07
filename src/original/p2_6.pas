{**************************************************
 * ПРОГРАММА 2.6P
 *
 * итерационный метод вычисления
 * наибольшего собственного значения
 *
 * На входе:
 *	N = 3
 *	M = 20
 *	E = 1e-6
 *	X =	 1  0  0
 *	A =	11 -6  2
 *		-6 10 -4
 *		 2 -4  6
 * На выходе:
 *	X1 = 1.0 X2 = -0.9999 X3 = 0.4999
 **************************************************}
TYPE 
  MAT = ARRAY[1..10, 1..10] OF REAL;
  VEC = ARRAY[1..10] OF REAL;
VAR 
  I, K, M, N: INTEGER; 
  E, L: REAL; 
  A: MAT; 
  X: VEC;

PROCEDURE MATR(N: INTEGER; VAR X: VEC; VAR A: MAT);
VAR 
  I,j: INTEGER;
BEGIN 
  FOR I:=1 TO N DO
  Begin
    WRITE('X', I:2, ' ? ');
    ReadLn(X[I]);
    FOR J:=1 TO N DO 
    BEGIN
      WRITE(' A ' , I:2, J:2, ' ? ');
      READLN(A[I,J]);
    END;
  END;
END;

PROCEDURE EIGEN(N, M: INTEGER; VAR X: VEC; VAR A: MAT; E: REAL;
		VAR L: REAL; VAR K: INTEGER);
VAR 
  I, J: INTEGER; 
  R, S: REAL; 
  Y: VEC;
BEGIN 
  K:=0; 
  L:=0.0;
  REPEAT 
    R:=L; 
    K:=K+1; 
    L:=0.0;
    FOR I:=1 TO N DO 
    BEGIN 
      S:=0.0;
      FOR J:= 1 TO N DO 
        S:=S+A[I,J]*X[J];
      IF ABS(S)>ABS(L) THEN 
        L:=S;
      Y[I]:=S;
    END;
    FOR I:=1 TO N DO 
      X[I]:= Y[I]/L;
  UNTIL (K=M) OR (ABS((L-R)/L) < E);
END;

BEGIN
  REPEAT 
    WRITE('N, M, E ? '); 
    READLN(N, M, E);
    MATR(N, X, A); 
    EIGEN(N, M, X, A, E, L, K);
    IF K=M THEN 
      WRITELN('ИТЕРАЦИИ BCE') 
    ELSE 
    BEGIN
      WRITELN(' L = ', L); 
      WRITELN(K:3, ' ИТЕРАЦИИ');
      FOR I:= 1 TO N DO 
        WRITELN(' X ', I:2, ' = ', X[I]);
    END
  UNTIL FALSE;
END.
