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
 *********************************************}
{$mode objfpc}

Type
  TParams = array[1..2] of Double; 

FUNCTION F(X: Double; P: TParams): Double;
VAR 
  R, T: Double; 
  N, I: INTEGER;
BEGIN 
  R:=X/2; 
  T:=1.0; 
  N:=ROUND(P[1]);
  FOR I:=1 TO N DO 
    T:=T*R/I;
  I:=1; 
  R:=-R*R;
  Result:=T;
  WHILE ABS(T)>P[2] DO 
  BEGIN
    T:=T*R/(I*(I+N)); 
    Result:=Result+T;
    Inc(I);
  END;
END;

VAR 
  P: TParams;
  X, X0, X9, H: Double;

BEGIN
  WRITE('Начальная точка (X0): ');
  READLN(X0);
  WRITE('Конечная точка (X9): ');
  READLN(X9);
  Write('Шаг: ');
  ReadLn(H);
  WRITELN('Порядок функции Бесселя: '); 
  READ(P[1]);
  WRITELN('Погрешность вычисления ряда: '); 
  READ(P[2]);    
  X:=X0;
  WHILE X<=X9 DO
  BEGIN
    WRITELN(X, ' ', F(X, P)); 
    X:=X+H;
  END;
END.
