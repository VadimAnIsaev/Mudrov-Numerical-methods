{******************************************
 *
 * ПPOГРAMMA 2.4P
 *
 * ОБРАЩЕНИЕ МАТРИЦЫ
 * (A ^ -1)(квадратная матрица)
 *
 * На входе:
 *	N = 3
 *		0.5 0.0 0.5
 *		0.0 0.5 1.0
 *		1.0 0.5 0.0
 * На выходе:
 *		 1.0 -0.5  0.5
 *		-2.0  1.0  1.0
 *		 1.0  0.5 -0.5
 ******************************************}
TYPE 
  MAT = ARRAY[1..10, 1..20] OF REAL;
VAR 
  I, j, n: integer; 
  s: real; 
  a: mat;

PROCEDURE MATR(N: integer; VAR A: MAT);
VAR 
  I,j: integer;
BEGIN
  FOR I:=1 TO N DO
    FOR J:=1 TO N DO 
    BEGIN
      WRITE('A', I:2, J:2, '? '); 
      READLN(A[I,J]);
    END;
END;

PROCEDURE INV(N: integer; VAR A: MAT; VAR S: REAL);
VAR 
  I, J, K: INTEGER; 
  R: REAl;
BEGIN
  FOR I:=1 TO N DO 
  BEGIN
    FOR J:=N+1 TO 2*N DO 
      A[I,J]:=0.0; 
      A[I,I+N]:=1.0;
  end;
  FOR K:= 1 TO N DO 
  BEGIN 
    S:=A[K,K]; 
    J:=k;
    FOR I:=K+1 TO N DO 
    BEGIN 
      R:=A[I,K];
      IF ABS(R)>ABS(S) THEN 
      BEGIN 
        S:=R; 
        J:=I; 
      END;
    end;
    IF s=0.0 then 
      exit;
    IF J<>K then 
      FOR I:=K TO 2*N DO 
      BEGIN
        R:=A[K,I]; 
        A[K,I]:=A[J,I]; 
        A[J,i]:=R; 
      END;
    FOR J:=K+1 TO 2*N DO 
      A[K,J]:=A[K,J]/S;
    FOR I:=K+1 TO N DO 
    BEGIN 
      R:=A[I,K];
      FOR J:=K+1 TO 2*N DO 
        A[I,J]:=A[I,J]-A[K,J]*R;
    END;
  END;

  IF S<>0.0 THEN
    FOR J:=N+1 TO 2*N DO
      FOR I:=N-1 DOWNTO 1 DO 
      BEGIN 
        R:=A[I,J];
        FOR K:=I+1 TO N DO 
          R:=R-A[K,J]*A[I,K];
        A[I,J]:=R;
      END;
END;

BEGIN
  REPEAT
    WRITE('N? '); 
    READLN(N); 
    MATR(N, A);
    INV(N, A, S);
    IF S<>0.0 THEN 
      FOR I:=1 TO N DO
        FOR J:=N+1 TO 2*N DO 
          WRITELN(' A', I:2, J-N:2, ' = ', A[I,J])
    ELSE 
      WRITELN('DET=0');
  UNTIL FALSE
END.
