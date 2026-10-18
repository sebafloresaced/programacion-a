program ej9;
type
  TMB = array[1..5,1..5] of byte;
  TMC = array[1..5,1..5] of char;
procedure GenerarT1(var T1:TMC;N:byte);
var
  i,j:byte;
  color:char;
begin
  for i:=1 to N do
    for j:=1 to N do
       begin
         write('Color de la casilla fila ',i,' columna ',j,': '); readln(color);
         T1[i,j]:=color;
       end;
end;
procedure GenerarT2(var T2:TMB;N:byte);
var
  i,j,fichas:byte;
begin
  for i:=1 to N do
    for j:=1 to N do
      begin
        write('Fichas de la casilla fila ',i,' columna ',j,': '); readln(fichas);
        T2[i,j]:=fichas;
      end;
end;
function Predomina(T1:TMC;N:byte):char;
var
  i,j,contR,contA:byte;
begin
  contR:=0; contA:=0;
  for i:=1 to N do
    for j:=1 to N do
      if T1[i,j]='R' then
        contR:=contR+1
      else
        contA:=contA+1;
  if contR<contA then
    Predomina:='A'
  else
    Predomina:='R';
end;
function masFichas(T1:TMC;T2:TMB;N:byte):char;
var
  i,j,contR,contA:byte;
begin
  contR:=0; contA:=0;
  for i:=1 to N do
    for j:=1 to N do
      if T1[i,j]='R' then
        contR:=contR+T2[i,j]
      else
        contA:=contA+T2[i,j];
  if contR<contA then
    masFichas:='A'
  else
    masFichas:='R';
end;
function UnicoColor(T1:TMC;N:byte):byte;
var
  i,j,aux:byte;
  color:char;
  cumple:boolean;
begin
  aux:=0; i:=1;
  for j:=1 to N do
    begin
      cumple:=true;
      color:=T1[1,j];
      while (i<N) and (T1[i,j]=color) do
        i:=i+1;
      if T1[i,j]=color then
        aux:=aux+1;
    end;
  unicoColor:=aux;
end;
var
  T1:TMC;
  T2:TMB;
  N:byte;
begin
  writeln('Ingresa el orden de la matriz'); readln(n);
  generarT1(t1,n);
  generarT2(t2,n);
  writeln('Color predominante: ',predomina(t1,n));
  writeln('Color con mas fichas: ',masFichas(t1,t2,n));
  writeln('Cantidad de columnas de un solo color: ',unicoColor(t1,n));
  readln();
end.

