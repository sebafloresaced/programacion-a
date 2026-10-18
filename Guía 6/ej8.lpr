program ej8;
type
  TV = array[1..5] of integer;
  TM = array[1..5,1..5] of byte;
procedure MatR(var Matriz:TM;A:TV;N:byte);
var
  i,j:byte;
begin
  for i:=1 to N do
    for j:=1 to N do
      if A[j] mod A[i] = 0 then
         Matriz[i,j]:=1
      else
        Matriz[i,j]:=0;
end;
function reflexiva(matriz:tm;n:byte):boolean;
var
  i:byte;
begin
  i:=1;
  while (i<N) and (matriz[i,i]=1) do
    i:=i+1;
  if matriz[i,i]=1 then
     reflexiva:=true
  else
    reflexiva:=false;
end;
function simetrica(matriz:tm;n:byte):boolean;
var
  i,j:byte;
begin
  i:=2; j:=1;
  while (i<N)and(matriz[i,j]=matriz[j,i]) do
    begin
      while (j<i)and(matriz[i,j]=matriz[j,i]) do
        j:=j+1;
      i:=i+1;
    end;
  if matriz[i,j]<>matriz[j,i] then
    simetrica:=false
  else
    simetrica:=true;
end;
var
  matriz:tm;
  n,i,j:byte;
  A:tv;
  num:integer;
begin
  writeln('Ingresa la cantidad de elementos'); readln(n);
  for i:=1 to N do
    begin
      writeln('Ingresa el elemento ',i); readln(num); A[i]:=num;
    end;
  Matr(matriz,a,n);
  if reflexiva(matriz,n) then
    writeln('La matriz de la relacion es reflexiva')
  else
    writeln('La matriz de la relacion no es reflexiva');
  if simetrica(matriz,n) then
    writeln('La matriz de la relacion es simetrica')
  else
    writeln('La matriz de la relacion no es simetrica');

  {Mostrar MatrizR}
  writeln;
  for i:=1 to N do
    begin
      for j:=1 to N do
        write(matriz[i,j]:4);
      writeln;
    end;

  readln();
end.

