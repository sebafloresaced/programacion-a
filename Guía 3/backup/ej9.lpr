program ej9;
var
  Arch:text;
  N1,N2:integer;
begin
  Assign(Arch, 'numeros.txt');
  Reset(Arch);
  read(arch,n1,n2);
  While (not eof(Arch))AND (N1<N2) do
     begin
        n1:=n2;
        Read(Arch,N2);
     end;
  if N1>N2 then
     writeln('Los numeros no estan ordenados de forma ascendente')
  else
      writeln('Los numeros estan ordenados de forma ascendente');
  readln(n1);
end.

