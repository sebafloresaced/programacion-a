program ej6;
var
  N, N2, centenas:real;
begin
  writeln('Ingrese un entero');
  readln(N);
  N2:= Int(N/1000);
  writeln('El entero N sin las ultimas tres cifras es ', N2:10:0);
  centenas:= Int(Frac(N/1000)*10);
  writeln('La cifra en la posicion de las centenas es ', centenas:1:0);
  readln(N);
end.

