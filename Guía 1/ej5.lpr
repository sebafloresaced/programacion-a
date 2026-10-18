program ej5;
const
  supBaldosa = 1/8;
  ancTerreno = 10;
  largTerreno = 30;
var
  N,M : byte;
begin
  writeln('Ingresar la superficie NxM');
  readln(N,M);
  writeln('La superficie representa un ', N*M*100/(10*30):3:1,'% de la superficie del terreno');
  writeln('Se necesitan ', N*M*8,' baldosas');
  readln(N);
end.

