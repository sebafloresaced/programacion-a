program ej1;
function esLetra(N:char):boolean;
  begin
    N:=upcase(N);
    if ('A'<=N)and(N<='Z') then
       esLetra:=true
    else
      esLetra:=false;
  end;
var
  N:Char;
begin
  writeln('Ingrese un caracter'); Readln(N);
  if esLetra(N) then
     writeln('El caracter ingresado es una letra')
  else
     writeln('El caracter ingresado no es una letra');
  readln();
end.

