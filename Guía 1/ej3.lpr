program ej3;
const
  xHora=200;
  porcentajePrevisional=11/100;
  porcentajeCobertura=5/100;
var
  cantHoras:word;
  salario:real;
begin
  writeln('Ingresa la cantidad de horas trabajadas');
  readln(cantHoras);
  salario:= cantHoras*xHora;
  writeln('El total a cobrar es ', salario-salario*porcentajePrevisional-salario*porcentajeCobertura:8:1);
  readln(cantHoras);
end.

