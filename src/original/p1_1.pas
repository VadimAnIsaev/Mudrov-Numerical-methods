{*********************************************
 * ПРОГРАММА 1.1P
 * ТАБЛИЧНЫЙ МЕТОД ОТДЕЛЕНИЯ КОРНЕЙ
 *
 * На примере функции Бесселя первого рода.
 * Входные параметры:
 *	P[1] - порядок функции Бесселя;
 *	P[2] - допустимая погрешность вычисления ряда;
 *	X0, X9 - интервал;
 *	H - шаг.
 *	N - 2 (по количеству ячеек P).
 * На выходе:
 *	таблица значений X и F(X)
 *********************************************}

VAR 
  P: ARRAY[1..9] OF REAL; 
  X, X0, X9, H: REAL;
  N, K: INTEGER;

{ Исследуемая функция }
FUNCTION F(X: REAL): REAL;
VAR 
  R, S, T: REAL; 
  N: INTEGER;
BEGIN 
  R:=X/2; 
  T:=1.0; 
  N:=ROUND(P[1]);
  FOR K:=1 TO N DO 
    T:=T*R/K;
  K:=1; 
  S:=T;
  // Это условие для очень старых советских ЭВМ. 
  // Сейчас оно, наверное, не нужно. Оставить только WHILE.
  IF ABS(R)>1.0E-18 THEN 
  BEGIN 
    R:=-R*R;
    WHILE ABS(T)>P[2] DO 
    BEGIN
      T:=T*R/(K*(K+N)); 
      S:=S+T; 
      K:=K+1;
    END
  END;
  F:=S;
END;

BEGIN
  REPEAT 
    WRITE('X0,X9, H ? ' );
    READLN(X0, X9, H);
    WRITE('СКОЛЬКО ПАРАМЕТРОВ (1..9) ? '); 
    READLN(N);
    FOR K:=1 TO N DO 
    BEGIN
      WRITE('P(', K:2, ') ? '); 
      READ(P[K]);
    END;
    X:=X0;
    WHILE X<=X9 DO 
    BEGIN
      WRITELN(X, ' ', F(X)); 
      X:=X+H;
    END;
    WRITELN;
  UNTIL FALSE;
END.
