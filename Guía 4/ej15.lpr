program ej15;
type
 TSerie = function(k:integer):real;
 function Serie1(k: integer): real;
 begin
   Serie1 := 1 / (k*k);
 end;

 function Serie2(k: integer): real;
 var
   i:byte;
   pot:word;
 begin
   pot := 1;
   for i := 1 to (k-1) do
    pot := pot * 2;
   Serie2 := 1 / pot;
 end;
 function Serie3(k: integer): real;
 var
   i,f:integer;
 begin
   f := 1;
   for i := 1 to k do
     f := f * i;
   Serie3 := 1 / f;
 end;
 procedure CalcularSerie(N: integer; var RES: real; F: tSerie);
 var i: integer;
 begin
   RES := 0;
   for i := 1 to N do
     RES := RES + F(i);
 end;
var
  Opcion:byte;
  N:integer;
  res:real;
begin
  writeln('Eleji una serie');
  writeln('1 -> 1/(k^2)');
  writeln('2 -> 1/2^(k-1)');
  writeln('3 -> 1/k!');
  repeat
    readln(opcion);
  until opcion in [1..3];
  writeln('Ingresa la cantidad de terminos a sumar'); readln(n);
  case opcion of
    1: CalcularSerie(n, res, @serie1);
    2: CalcularSerie(n, res, @serie2);
    3: CalcularSerie(n, res, @serie3);
  end;
  writeln();
  writeln('El resultado de la serie, sumando ',n,' terminos, es: ',res:6:2);
  readln();
end.

