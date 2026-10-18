program ej8;
type
  TM = array[1..10,1..10] of integer;
  TV = array[1..10] of integer;
procedure CargarMatriz(var Mat:TM;var N,M:byte);
var
  i,j:byte;
  num:integer;
begin
  write('Ingresa el orden de la matriz NxM: '); readln(N,M);
  for i:=1 to N do
    for j:=1 to M do
       begin
         write('Ingresa el numero en la posicion (',i,',',j,'): '); readln(num);
         Mat[i,j]:=num;
       end;
end;
function MaximoDeFila(Mat:TM;i,M:byte;max:integer):integer;
begin
  if M=0 then
    MaximoDeFila:=max
  else
    begin
      if Mat[i,M]>max then
        max:=Mat[i,M];
      MaximoDeFila:=MaximoDeFila(Mat,i,M-1,max);
    end;
end;
procedure VectorMaximos(mat:TM;N,M:byte;var Maximos:TV);
begin
  if N>0 then
    begin
      Maximos[N]:= MaximoDeFila(mat,n,m,Mat[n,m]);
      VectorMaximos(mat,n-1,m,maximos);
    end;
end;
procedure MostrarMatriz(Mat:TM;N,M:byte);
var
  i,j:byte;
begin
  for i:=1 to N do
   begin
    for j:=1 to M do
      write(Mat[i,j]:4);
    writeln;
   end;
end;
procedure MostrarVector(Maximos:TV;N:byte);
var
  i:byte;
begin
  for i:=1 to N do
   write(Maximos[i]:4);
end;
var
  Mat:TM;
  N,M:byte;
  Maximos:TV;
begin
  cargarMatriz(mat,n,m);
  VectorMaximos(mat,n,m,maximos);
  writeln('Matriz:');
  mostrarmatriz(mat,n,m);
  writeln;
  writeln('Vector generado:');
  mostrarvector(maximos,n);
  readln;
end.

