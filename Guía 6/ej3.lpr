program ej3;
type
  TM = array[1..6,1..6] of integer;
procedure LeerDatos(var Matriz:TM;var N,Y:byte);
var
  num:integer;
  arch:text;
begin
  N:=0;
  assign(arch,'ej3.txt'); reset(arch);
  while not eof(arch) do
    begin
      y:=0; n:=n+1;
      while not eoln(arch) do
        begin
          read(arch,num);
          y:=y+1;
          matriz[n,y]:=num;
        end;
      readln(arch);
      if matriz[n,y] mod matriz[n,1] <> 0 then
         n:=n-1;
    end;
  close(arch);
end;
procedure MostrarMatriz(matriz:TM;N,y:byte);
var
  i,j:byte;
begin
  for i:=1 to N do
    begin
      for j:=1 to Y do
        write(Matriz[i,j]:4);
      writeln;
    end;
end;
var
  matriz:TM;
  n,y:byte;
begin
  leerdatos(matriz,n,y);
  mostrarmatriz(matriz,n,y);
  readln();
end.

