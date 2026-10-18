program ej9;
procedure Operaciones(x1,y1,x2,y2:integer; var suma,producto:real);
  begin
   suma:=(x1*y2+x2*y1)/(y1*y2);
   producto:=(x1*x2)/(y1*y2);
  end;
var
  N1,D1,N2,D2:integer;
  suma,producto:real;
begin
  writeln('Ingrese los datos de la primer fraccion (primero numerador y despues numerador)');
  read(N1,D1);
  writeln('Ingrese los datos de la segunda fraccion (primero numerador y despues numerador)');
  read(N2,D2);
  if (D1<>0) and (D2<>0) then
     begin
       Operaciones(n1,d1,n2,d2,suma,producto);
       writeln('La suma de las fracciones da: ',suma:6:2);
       writeln('El producto de las fracciones da: ',producto:6:2);
     end
  else
      writeln('Los denominadores no pueden ser 0');
  readln(n1);
end.

