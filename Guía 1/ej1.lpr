program ej1;
var
  pinturaNegra, pinturaBlanca, N:single;
begin
  writeln('Cuantos litros de pintura negra tenes?');
  readln(N);
  pinturaBlanca:= Round(N*4.5/9.5);
  writeln('Necesitas comprar ', pinturaBlanca:4:2, ' litros de pintura Blanca');
  writeln('Cuantos litros de pintura blanca tenes?');
  readln(N);
  pinturaNegra := Round(N*9.5/4.5);
  writeln('Necesitas comprar ', pinturaNegra:4:2, ' litros de pintura Negra');
  readln(N);
end.
