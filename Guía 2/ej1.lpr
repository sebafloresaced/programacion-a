program ej1;
var
  N:char;
begin
  writeln('Ingresa un caracter');
  readln(N);
  if (('A'<=N)AND(N<='Z'))OR(('a'<=N)AND(N<='z')) then
     if N<='Z' then
        writeln('Mayuscula')
     else
         writeln('Minuscula')
  else
    writeln('Cualquier otro');
  readln(N);
end.

