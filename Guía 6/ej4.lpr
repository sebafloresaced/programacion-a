program ej4;
const
  Max = 10;
type
  TM = array[1..Max,1..Max] of integer;
procedure Inicializar(var Matriz:TM);
var
  i,j:byte;
begin
  for i:=1 to max do
      for j:=1 to max do
          matriz[i,j]:=0;
end;
procedure LeerDatos(var Matriz:TM);
var
  arch:text;
  num:integer;
  fila,columna:byte;
begin
  assign(arch,'ej4.txt'); reset(Arch);
  while not eof(arch) do
    begin
      readln(arch,fila,columna,num);
      matriz[fila,columna]:=num;
    end;
  close(arch);
end;
function ObtenerN(Matriz:TM):byte;
var
  i,j,N:byte;
begin
  n:=0;
  for j:=1 to max do
    for i:=1 to max do
      if Matriz[i,j]<>0 then
         if i>n then
            n:=i;
  obtenerN:=n;
end;
function ObtenerM(matriz:TM;N:byte):byte;
var
  i,j,M:byte;
begin
  M:=0;
  for i:=1 to N do
    for j:=1 to max do
      if Matriz[i,j]<>0 then
         if j>m then
            m:=j;
  obtenerM:=m;
end;
procedure MostrarMatriz(Matriz:TM;N,M:byte);
var
  i,j:byte;
begin
  for i:=1 to N do
    begin
      for j:=1 to M do
        write(Matriz[i,j]:4);
      writeln;
    end;
end;

function triangularInf(Matriz:TM;N,M:byte):boolean;
var
  i,j:byte;
  Aux:boolean;
begin
  Aux:=true;
  for j:=2 to M do
    for i:=1 to j-1 do
      if Matriz[i,j]<>0 then
         aux:=false;
  triangularInf:=aux;
end;
var
  Matriz:TM;
  N,M:byte;
begin
  leerDatos(matriz);
  N:=obtenerN(matriz); M:=obtenerM(matriz,n);
  MostrarMatriz(matriz,n,m);
  writeln;
  if N=M then
     begin
       if triangularInf(matriz,n,m) then
          writeln('La matriz generada es triangular inferior')
       else
          writeln('La matriz generada no es triangular inferior');
     end;
  readln();
end.

