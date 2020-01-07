{**************************************************
 *
 * ПРОГРАММА 2.3P
 * ВЫЧИСЛЕНИЕ ОПРЕДЕЛИТЕЛЕЙ ПО ГАУССУ
 * (квадратная матрица)
 *
 * На входе:
 *	N = 3 
 * На выходе:
 * 	DET = -52
 **************************************************}
TYPE 
  MAT=ARRAY[1 ..20,1..20] OF REAL;
VAR 
  A: MAT;
  I,N: INTEGER;
  s: real;

PROCEDURE MATR(N: INTEGER; VAR A: MAT);
VAR 
  I,j: INTEGER;
BEGIN 
  FOR I:=1 TO N DO
    FOR J:=1 TO N DO 
    BEGIN
      WRITE(' A ' , I:2, J:2, ' ? ');
      READLN(A[I,J]);
    END;
end;

{ Определитель }
PROCEDURE DET(N: INTEGER; VAR A: MAT; VAR S: REAL);
VAR 
  I,J,K,K1: INTEGER;
  P, R: REAL;
BEGIN 
  P:=1.0;
  FOR K:=1 to N-1 DO 
  BEGIN 
    K1:=K+1; 
    S:=A[K,K]; 
    j:=K;
    FOR I:= K1 TO N DO 
    BEGIN 
      R:=A[I,K];
      IF ABS(R)>ABS(S) THEN 
      BEGIN 
        S:=R; 
        J:=I; 
      END;
    end;
    IF s=0.0 THEN 
      exit;
    IF J<>K THEN 
    BEGIN 
      p:=-p;
      FOR I:=K TO N DO 
      BEGIN
        R:=A[K,I]; 
        A[K,I]:=A[J,I]; 
        A[J,I]:=R; 
      END;
    end;
    FOR J:=K1 TO N DO 
      A[K,J]:=A[K,J]/S;
    FOR I:= K1 TO N DO 
    BEGIN 
      R:=A[i,K];
      FOR J:= K1 TO N DO 
        A[I,J]:=A[I,J]-A[K,J]*R;
    end;
    P:=P*S;
  end;
  S:=p*A[N,N];
END;

BEGIN
  REPEAT 
    WRITE(' N ? '); 
    READLN(N); 
    MATR(N, A); 
    DET(N, A, S);
    WRITELN('DET = ', S);
  UNTIL FALSE
END.
