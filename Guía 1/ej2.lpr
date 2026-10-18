program ej2;
var
  termino:shortint;
  k:byte;
const
  a1=1;
begin
  writeln('Ingrese k');
  readln(k);
  termino:= a1+3*(k-1);
  writeln('El k-esimo termino de la sucesion es ', termino);
  writeln('La diferencia entre los terminos es ', Abs(termino-(a1+3*k)));
  readln(k);
end.

