program ej1;
function Potencia(x,n:integer):real;
begin
  if n=0 then
    potencia:=1
  else
    if n>0 then
      potencia:=x*potencia(x,n-1);
    if n<0 then
      potencia:=1/potencia(x,-n);
end;
var
  x,n:integer;
begin
  writeln('Ingresa un numero y la potencia'); readln(x,n);
  writeln(x,' a la ',n,' es ',potencia(x,n):4:2);
  readln;
end.

