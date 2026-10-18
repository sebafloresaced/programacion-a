program ej2;
function Funcion(i:byte):byte;
begin
  if i=0 then
    funcion:=1
  else
    if i mod 2 = 0 then
      funcion:= 1+funcion(i-1)
    else
      funcion:= funcion(i-1);
end;
var
  i:byte;
begin
  writeln('Ingresa i'); readln(i);
  writeln('La funcion con parametro i da: ',funcion(i));
  readln;
end.

