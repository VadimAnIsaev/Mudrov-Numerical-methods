{***************************************************
 * ПРОГРАММА 2.2P
 * МЕТОД ЗЕЙДЕЛЯ ДЛЯ СЛАУ
 * (расширенная матрица, коэффициенты и правые части в одной матрице)
 *
 * На входе:
 *	N = 3 (кол-во уравнений)
 *	M = 20 (максимальное количество итераций)
 *	E = 1e-5 (погрешность)
 *		1 4 2 3
 *		2 7 3 4
 *		0 8 1 -5
 * Возможный входной параметр:
 *	X - сюда заносятся приближённые к ответу значения,
 *	    чем ближе к ответу, тем быстрее считается.
 * На выходе:
 *	X1 = 1 X2 = -1 X3 = 3
 ***************************************************}
TYPE 
  MAT = ARRAY[1..20, 1..21] OF REAL;
  VEC = ARRAY[1..20] OF REAL;
VAR
  a: MAT;
  X: VEC;
  I, L, M, N: INTEGER;
  E: REAL;
  
PROCEDURE MATR(N: INTEGER; VAR A: MAT; VAR X: VEC);
VAR 
  I, J: integer;
BEGIN
  FOR I:=1 TO N DO 
  BEGIN 
    X[i]:=0.0;
    FOR J:=1 TO N+1 DO 
    BEGIN
      WRITE('A', I:2, J:2, ' ? '); 
      READLN(A[I,J]);
    END;
  END;
END;

{ Метод Зейделя }
PROCEDURE SEID(VAR N, M, L: INTEGER; VAR A: MAT; VAR X: VEC; E: REAL);
VAR 
  I, J, K, K1, N1: INTEGER;
  S: REAL;
BEGIN
  FOR K:=1 TO M DO 
  BEGIN 
    L:=K;
    FOR I:=1 TO N DO 
    BEGIN 
      S:=A[I,N+1];
      FOR J:=1 TO N DO 
        S:=S-A[I,J]*X[J];
      S:=S/A[I,I]; 
      X[I]:=X[I]+S;
      IF ABS(S)>E THEN 
        L:=0;
    end;
    IF L<>0 THEN 
      EXIT;
  END
END;

BEGIN
  REPEAT 
    WRITE('N, M, E ?'); 
    READLN(N, M, E);
    MATR(N, A, X); 
    SEID(N, M, L, A, X, E);
    IF L<>0 THEN 
    BEGIN
      FOR I:= 1 TO N DO 
        WRITELN(' X ', I:2, ' = ', X[I]);
      WRITELN(L:3, ' ИТЕРАЦИИ');
    END 
    ELSE 
      WRITELN('ИТЕРАЦИИ BCE');
  UNTIL FALSE;
END.
