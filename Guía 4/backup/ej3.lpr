program ej3;
function sumaNaturales(N:byte):word;
  var
    i:byte;
    total:word;
  begin
    total:=0;
    for i:=1 to N do
      total:=total+i;
    sumaNaturales:=total;
  end;
var
  N:byte;
begin
  writeln('Ingrese un numero'); readln(N);
  writeln('La suma de los primeros ',N,' numeros naturales, es ',sumaNaturales(n));
  readln();
end.

