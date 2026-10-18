program ej10;
const
  Max = 20;
type
  TM = array[1..Max,1..Max] of integer;
  TFunc = function(Mat:TM; k,N:byte): real;
function PromFila(Mat:TM; fila,N:byte):real;
var
  j:byte;
  suma:integer;
begin
  suma := 0;
  for j:=1 to N do
    suma := suma + Mat[fila,j];
  PromFila := suma / N;
end;
function PromCol(Mat:TM; col,N:byte):real;
var
  i:byte;
  suma:integer;
begin
  suma := 0;
  for i:=1 to N do
    suma := suma + Mat[i,col];
  PromCol := suma / N;
end;
Procedure Maximo (Mat:TM; N:Byte; Func:TFunc; var maxk:Byte);
Var
  max, prom: real;
  k: byte;
Begin
  max := Func(Mat, 1, N);
  maxk := 1;
  For k := 2 to N do
  Begin
    prom := Func(Mat, k, N);
    if max < prom then
    begin
      max := prom;
      maxk := k;
    end;
  end;
End;
var
  A:TM;
  N,i,j,maxfila,maxcol:byte;
begin
  writeln('Ingrese dimension N (matriz NxN): ');
  readln(N);
  writeln('Ingrese la matriz:');
  for i:=1 to N do
    for j:=1 to N do
      read(A[i,j]);
  Maximo(A,N,@PromFila,maxfila);
  Maximo(A,N,@PromCol,maxcol);
  writeln('La fila de máximo promedio es: ', maxfila);
  writeln('La columna de máximo promedio es: ', maxcol);
  readln;
end.

