program ej1;
type
  TM = array[1..5,1..5] of integer;
  TV = array[1..5] of integer;
procedure LeerMatriz(var A:TM;var N,M:byte);
var
  i,j:byte;
  arch:text;
begin
  assign(arch,'ej1.txt'); reset(arch);
  readln(arch,N,M);
  for i:=1 to N do
      for j:=1 to M do
          read(arch,A[i,j]);
  close(arch);
end;
function maximo(A:TM;fila,M:byte):integer;
var
  i:byte;
  max:integer;
begin
  max:=A[fila,1];
  for i:=2 to M do
      if max<A[fila,i] then
         max:=A[fila,i];
  maximo:=max;
end;
procedure GenMaximos(A:TM;N,M:byte;var Maximos:TV);
var
  i,j:byte;
begin
  for i:=1 to N do
    Maximos[i]:=maximo(A,i,M);
  for i:=1 to N do
    write(Maximos[i]:4);
  writeln;
end;
procedure SumarImpares(A:TM;N,M:byte;var Sumas:TV);
var
  i,j:byte;
begin
  for j:=1 to M do
    begin
      i:=0;
      repeat
        i:=i+1;
      until (A[i,j] mod 2 <> 0) or (i=N);
      if A[i,j] mod 2 <> 0 then
         begin
           Sumas[j]:=0;
           for i:=1 to N do
             if A[i,j] mod 2 <> 0 then
                Sumas[j]:=Sumas[j]+A[i,j];
         end;
    end;
  for j:=1 to M do
    write(Sumas[j]:4);
  writeln;
end;
function promedio(A:TM;N,X:byte):real;
var
  i:byte;
  acum:integer;
begin
  acum:=0;
  for i:=1 to N do
     acum:=acum+A[i,x];
  promedio:=acum/n;
end;
var
  A:TM;
  Sumas,Maximos:TV;
  N,M,X:byte;
begin
  LeerMatriz(a,n,m);
  genmaximos(a,n,m,maximos);
  sumarimpares(a,n,m,sumas);
  writeln('Ingresa una columna para ver el promedio de sus elementos'); readln(x);
  writeln('El promedio de la columna ',x,' es ',promedio(a,n,x):4:2);
  readln;
end.

